extends CharacterBody2D

var theta: float = 0.0
@export_range(0,2*PI) var alpha: float = 1.5
var bullet = load("res://sprites/common/bullet/arrow.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var vangle = 2
var weakness = 1


func _ready():
	var stimer = $Speed
	stimer.start(0.05)

func get_vector(angle):
	theta = angle + alpha
	return Vector2(cos(theta),sin(theta))

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim := $AnimationPlayer

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
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
	#move_and_slide()
func shoot(angle):
	var new_bullet = bullet.instantiate()
	new_bullet.position = Vector2(position.x, position.y)
	new_bullet.direction = get_vector(angle)
	new_bullet.btype = "boss"
	get_parent().call_deferred("add_child",new_bullet)


func _on_speed_timeout():
	if Global.live == 1:
		shoot(theta)
