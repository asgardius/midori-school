extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var angle = 2
var sprite
var anim
var speed
var csprite
var bpress = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var weakness

func _ready():
	add_to_group("players")
	anim = $AnimationPlayer
	sprite = $Sprite2D
	#_charswitch()
	_charinit()

func _physics_process(delta):
	# Add the gravity.
	#var velocity = Vector2.ZERO
	if Global.live == 1:
		velocity = (Vector2.RIGHT.rotated(rotation) * speed * Global.xm * delta)-Vector2.UP.rotated(rotation) * speed * Global.ym * delta
		#origmpos = get_viewport().get_mouse_position()
	#if Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) != 0:
	#	velocity = Vector2.UP.rotated(rotation) * -400 * Input.get_joy_axis(0,JOY_AXIS_LEFT_Y)
	position += velocity
	Global.playerx = position.x
	Global.playery = position.y
	if Global.ym > 0.3:
		angle = 2
	elif Global.ym < -0.3:
		angle = 0
	elif Global.xm > 0.3:
		angle = 1
	elif Global.xm < -0.3:
		angle = 3
	if velocity.y != 0 || velocity.x != 0:
		if angle == 0:
			anim.play("nwalk")
		elif angle == 1:
			anim.play("ewalk")
		elif angle == 3:
			anim.play("wwalk")
		else:
			anim.play("swalk")
	else:
		if angle == 0:
			anim.play("nidle")
		elif angle == 1:
			anim.play("eidle")
		elif angle == 3:
			anim.play("widle")
		else:
			anim.play("sidle")
	move_and_slide()

func _input(event):
	if Global.live == 1:
		if Input.is_action_pressed("schar") && (Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down") || Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
			_charswitch()
		if Input.is_action_just_pressed("shoot") && !bpress && Global.live == 1:
			bpress = true
			var bullet
			if Global.debug:
				bullet = load(Global.pbbullets[Global.dparty[Global.dcpchar][0]])
			else:
				bullet = load(Global.pbbullets[Global.party[Global.cpchar][0]])
			var new_pbullet = bullet.instantiate()
			new_pbullet.btype = "players"
			new_pbullet.velocity = Vector2(0, -speed).rotated(deg_to_rad(angle * 90))
			var rposition = Vector2(0, -96).rotated(deg_to_rad(angle * 90))
			if angle == 2:
				new_pbullet.position = Vector2(position.x + rposition.x, position.y + rposition.y + 98)
			else:
				new_pbullet.position = Vector2(position.x + rposition.x, position.y + rposition.y)
			if new_pbullet.position.x > 0 && new_pbullet.position.y > 0 && new_pbullet.position.x < 1280 && new_pbullet.position.y < 720:
				get_parent().add_child(new_pbullet)
		elif Input.is_action_just_released("shoot") && bpress:
			bpress = false

func _charinit():
	if Global.debug:
		speed = Global.mstats[Global.dparty[Global.dcpchar][0]][6]
		#print(Global.dparty[Global.dcpchar][0])
		#print(speed)
	else:
		speed = Global.mstats[Global.party[Global.cpchar][0]][6]
		#print(Global.dparty[Global.cpchar][0])
		#print(speed)
	_charswitch()

func _charswitch():
	if Global.debug:
		if csprite != null && speed!=Global.mstats[Global.dparty[csprite][0]][6]:
			print("Script Kiddie")
			speed = Global.dparty/0
		else:
			speed = Global.mstats[Global.dparty[Global.dcpchar][0]][6]
		if Global.dcpchar != csprite:
			csprite = Global.dcpchar
			sprite.texture = load(Global.pchars[Global.dparty[Global.dcpchar][0]][Global.dparty[Global.dcpchar][1]])
			weakness = Global.specialities[Global.pcspecialities[Global.dparty[Global.dcpchar][0]]]
		print(Global.dparty[Global.dcpchar][0])
		print(speed)
	else:
		if csprite != null && speed!=Global.mstats[Global.party[Global.cpchar][0]][6]:
			print("Script Kiddie")
			speed = Global.party/0
		else:
			speed = Global.mstats[Global.party[Global.dcpchar][0]][6]
		if Global.cpchar != csprite:
			csprite = Global.cpchar
			sprite.texture = load(Global.pchars[Global.party[Global.cpchar][0]][Global.party[Global.cpchar][1]])
			weakness = Global.specialities[Global.pcspecialities[Global.party[Global.cpchar][0]]]
