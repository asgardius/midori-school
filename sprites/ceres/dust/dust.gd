extends KinematicBody2D

var theta: float = 0.0
export(float,6.2831853) var alpha: float = 1.5
var bullet = load("res://sprites/common/bullet/snowflake.tscn")

const SPEED = 300.0
const fspeed = 100.0
const JUMP_VELOCITY = -400.0
var vangle = 2
var weakness = 2
var player
var movex = 0
var movey = 0
var attack = 87
var crit = 27
var velocity = Vector2(0,0)
var isjump = false
var fplayer = false
var isfollow

func _ready():
	if Global.isboss:
		Global.cboss = ["Kitchen Nightmare",5520,5520]
	var stimer = $Speed
	stimer.start(0.05)
	#player = get_parent().root.get_node("Player")

func get_vector(angle):
	theta = angle + alpha
	return Vector2(cos(theta),sin(theta))

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

onready var anim := $AnimationPlayer

func _physics_process(delta):
	fplayer = Time.get_time_string_from_system(false)
	fplayer.erase(0, 7)
	if int(fplayer) > 4:
		isfollow = true
	else:
		isfollow = false
	if Global.live == 1:
		if Global.playerx < position.x && (position.x - Global.playerx) > 200:
			if isfollow:
				movex = -1
			else:
				movex = 1
		elif Global.playerx > position.x && (Global.playerx - position.x) > 200:
			if isfollow:
				movex = 1
			else:
				movex = -1
		else:
			movex = 0
		if Global.playery < position.y && (position.y - Global.playery) > 200:
			if isfollow:
				movey = -1
			else:
				movey = 1
		elif Global.playery > position.y && (Global.playery - position.y) > 200:
			if isfollow:
				movey = 1
			else:
				movey = -1
		else:
			movey = 0
	else:
			movex = 0
			movey = 0
	velocity.x = movex * fspeed * delta
	velocity.y = movey * fspeed * delta
	# Add the gravity.
	#var velocity = Vector2.ZERO
	#if Global.live == 1:
		#velocity = (Vector2.RIGHT.rotated(rotation) * 500 * Global.xm * delta)-Vector2.UP.rotated(rotation) * 500 * Global.ym * delta
		#origmpos = get_viewport().get_mouse_position()
	#if Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) != 0:
	#	velocity = Vector2.UP.rotated(rotation) * -400 * Input.get_joy_axis(0,JOY_AXIS_LEFT_Y)
		#position += velocity
	position += velocity
	if velocity.y > 0.3:
		vangle = 2
	elif velocity.y < -0.3:
		vangle = 0
	elif velocity.x > 0.3:
		vangle = 1
	elif velocity.x < -0.3:
		vangle = 3
	if velocity.y != 0 || velocity.x != 0:
		if vangle == 0:
			anim.play("nwalk")
		elif vangle == 1:
			anim.play("ewalk")
		elif vangle == 3:
			anim.play("wwalk")
		else:
			anim.play("swalk")
	else:
		if vangle == 0:
			anim.play("nidle")
		elif vangle == 1:
			anim.play("eidle")
		elif vangle == 3:
			anim.play("widle")
		else:
			anim.play("sidle")
	move_and_slide(velocity)
func shoot(angle):
	var new_bullet = bullet.instance()
	new_bullet.position = Vector2(position.x, position.y)
	new_bullet.direction = get_vector(angle)
	new_bullet.btype = "boss"
	new_bullet.attack = attack
	new_bullet.crit = crit
	new_bullet.isjump = isjump
	new_bullet.speed = 100 * (sin(Time.get_ticks_msec()) + 2)
	get_parent().call_deferred("add_child",new_bullet)


func _on_speed_timeout():
	if Global.live == 1:
		shoot(theta)
