extends KinematicBody2D

var velocity
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var angle = 2
var sprite
var anim
var speed
var csprite
var attack
var crit
var bpress = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var weakness
var speciality
var rboost = 1
var jtimer
var isjump = false

func _ready():
	add_to_group("players")
	anim = $AnimationPlayer
	jtimer = $Jtimer
	sprite = $Sprite
	#_charswitch()
	_charinit()

func _physics_process(delta):
	if Global.live != 1:
		Global.xm = 0
		Global.ym = 0
	if Global.debug:
		if Global.cplace != [1, 11, 19]:
			if Global.dstats[Global.dparty[Global.dcpchar][0]][0] <= 0 && Global.live == 1:
				if Global.dparty[0][0] != null && Global.dstats[Global.dparty[0][0]][0] > 0:
					Global.dcpchar = 0
					_charswitch()
				elif Global.dparty[1][0] != null && Global.dstats[Global.dparty[1][0]][0] > 0:
					Global.dcpchar = 1
					_charswitch()
				elif Global.dparty[2][0] != null && Global.dstats[Global.dparty[2][0]][0] > 0:
					Global.dcpchar = 2
					_charswitch()
				elif Global.dparty[3][0] != null && Global.dstats[Global.dparty[3][0]][0] > 0:
					Global.dcpchar = 3
					_charswitch()
				else:
					Global.live = 2
	else:
		if Global.quest[0] == 3:
			if Global.cstats[Global.party[Global.cpchar][0]][0] <= 0 && Global.live == 1:
				if Global.party[0][0] != null && Global.cstats[Global.party[0][0]][0] > 0:
					Global.cpchar = 0
					_charswitch()
				elif Global.party[1][0] != null && Global.cstats[Global.party[1][0]][0] > 0:
					Global.cpchar = 1
					_charswitch()
				elif Global.party[2][0] != null && Global.cstats[Global.party[2][0]][0] > 0:
					Global.cpchar = 2
					_charswitch()
				elif Global.party[3][0] != null && Global.cstats[Global.party[3][0]][0] > 0:
					Global.cpchar = 3
					_charswitch()
				else:
					Global.live = 2
	# Add the gravity.
	#var velocity = Vector2.ZERO
	#if Global.live == 1 || (Global.xm == 0 && Global.ym == 0):
	if speed != null:
		velocity = (Vector2.RIGHT.rotated(rotation) * speed * Global.xm * delta * rboost)-Vector2.UP.rotated(rotation) * speed * Global.ym * delta * rboost
			#origmpos = get_viewport().get_mouse_position()
		#if Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) != 0:
		#	velocity = Vector2.UP.rotated(rotation) * -400 * Input.get_joy_axis(0,JOY_AXIS_LEFT_Y)
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
		if !isjump:
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
		position += velocity
		velocity = move_and_slide(velocity)
		#move_and_slide(position)

func _input(event):
	#Global.xm = 0
	#Global.ym = 0
	if Global.live == 1:
		if Input.is_action_just_pressed("jump") && !isjump:
			if angle == 0:
				anim.play("njump")
			elif angle == 1:
				anim.play("ejump")
			elif angle == 3:
				anim.play("wjump")
			else:
				anim.play("sjump")
			isjump = true
			jtimer.start()
		if Global.live == 1 && !Input.is_action_pressed("schar"):
			Global.xm = Input.get_axis("ui_left", "ui_right")
			Global.ym = Input.get_axis("ui_up", "ui_down")
			rboost = (Input.get_action_strength("run") + 1)*2
		if Input.is_action_pressed("schar") && (Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down") || Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right") || (event is InputEventScreenTouch and event.pressed == true)):
			_charswitch()
		if Input.is_action_just_pressed("shoot") && !bpress && Global.live == 1:
			bpress = true
			var bullet
			if Global.debug:
				bullet = load(Global.pbbullets[Global.dparty[Global.dcpchar][0]])
			else:
				bullet = load(Global.pbbullets[Global.party[Global.cpchar][0]])
			var new_pbullet = bullet.instance()
			new_pbullet.btype = "players"
			new_pbullet.attack = attack
			new_pbullet.crit = crit
			new_pbullet.isjump = isjump
			new_pbullet.speciality = speciality
			new_pbullet.speed = speed
			new_pbullet.velocity = Vector2(0, -speed).rotated(deg2rad(angle * 90))
			var rposition = Vector2(0, -96).rotated(deg2rad(angle * 90))
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
		attack = Global.mstats[Global.dparty[Global.dcpchar][0]][2]
		crit = Global.mstats[Global.dparty[Global.dcpchar][0]][3]
		#print(Global.dparty[Global.dcpchar][0])
		#print(speed)
	else:
		speed = Global.mstats[Global.party[Global.cpchar][0]][6]
		attack = Global.mstats[Global.party[Global.cpchar][0]][2]
		crit = Global.mstats[Global.party[Global.cpchar][0]][3]
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
			speciality = Global.pcspecialities[Global.dparty[Global.dcpchar][0]]
		print(Global.dparty[Global.dcpchar][0])
		print(speed)
	else:
		if csprite != null && speed!=Global.mstats[Global.party[csprite][0]][6]:
			print("Script Kiddie")
			speed = Global.party/0
		else:
			speed = Global.mstats[Global.party[Global.cpchar][0]][6]
		if Global.cpchar != csprite:
			csprite = Global.cpchar
			sprite.texture = load(Global.pchars[Global.party[Global.cpchar][0]][Global.party[Global.cpchar][1]])
			weakness = Global.specialities[Global.pcspecialities[Global.party[Global.cpchar][0]]]
			speciality = Global.pcspecialities[Global.party[Global.cpchar][0]]


func _on_Jtimer_timeout():
	isjump = false
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
