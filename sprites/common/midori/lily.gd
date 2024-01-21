extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var angle = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim := $AnimationPlayer

func _physics_process(delta):
	# Add the gravity.
	#var velocity = Vector2.ZERO
	if Global.live == 1:
		#velocity = (Vector2.RIGHT.rotated(rotation) * 500 * Global.xm * delta)-Vector2.UP.rotated(rotation) * 500 * Global.ym * delta
		#origmpos = get_viewport().get_mouse_position()
	#if Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) != 0:
	#	velocity = Vector2.UP.rotated(rotation) * -400 * Input.get_joy_axis(0,JOY_AXIS_LEFT_Y)
		#position += velocity
		if velocity.y > 0.3:
			angle = 2
		elif velocity.y < -0.3:
			angle = 0
		elif velocity.x > 0.3:
			angle = 1
		elif velocity.x < -0.3:
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
