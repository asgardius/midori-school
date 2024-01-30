extends Node2D
var level
var player
var music
var bgsound := AudioStreamPlayer.new()
var sfx1 := AudioStreamPlayer.new()
var musictrack
var isboss
var bhud = load("res://levels/bottomhud.tscn").instantiate()
var thud = load("res://levels/ui/tophud.tscn").instantiate()
var ishud = true

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(bgsound)
	add_child(sfx1)
	if Global.debug:
		level = load(Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][0]).instantiate()
		#player = load(Global.pchars[Global.dcpchar]).instantiate()
		musictrack = Global.musictracks[Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][1]]
		isboss = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][2]
	else:
		level = load(Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][0]).instantiate()
	#	player = load(Global.pchars[Global.cpchar]).instantiate()
		musictrack = Global.musictracks[Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][1]]
		isboss = Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][2]
	#if Global.cspawnarea[0] != null && Global.cspawnarea[0] != null:
	#	player.position.x = Global.cspawnarea[0]
	#	player.position.y = Global.cspawnarea[1]
	#elif Global.debug:
	#	player.position.x = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][1]
	#	player.position.y = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][2]
	#else:
	#	player.position.x = Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][1]
	#	player.position.y = Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][2]
	music = load(musictrack)
	get_tree().root.add_child.call_deferred(level)
	get_tree().root.add_child.call_deferred(bhud)
	get_tree().root.add_child.call_deferred(thud)
	#get_tree().root.add_child.call_deferred(player)
	bgsound.stream = music
	if !isboss:
		bgsound.play(0)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.xm = 0
	Global.ym = 0
	var velocity = Vector2.ZERO
	if Global.live == 1 && !Input.is_key_pressed(KEY_V) && !Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER):
		if Input.get_joy_axis(0,JOY_AXIS_LEFT_X) > 0.2 || Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) > 0.2 || Input.get_joy_axis(0,JOY_AXIS_LEFT_X) < -0.2 || Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) < -0.2:
			Global.xm = Input.get_joy_axis(0,JOY_AXIS_LEFT_X)
			Global.ym = Input.get_joy_axis(0,JOY_AXIS_LEFT_Y)
		else:
			if Input.is_action_pressed("ui_left"):
				Global.xm = -1
			if Input.is_action_pressed("ui_right"):
				Global.xm = 1
			if Input.is_action_pressed("ui_up"):
				Global.ym = -1
			if Input.is_action_pressed("ui_down"):
				Global.ym = 1
		#velocity = (Vector2.RIGHT.rotated(rotation) * -100 * Global.xm * delta)-Vector2.UP.rotated(rotation) * -100 * Global.ym * delta

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE) || Input.is_joy_button_pressed(0,JOY_BUTTON_BACK):
		Global.live = 0
		Global.bossready = false
		get_tree().root.remove_child(thud)
		get_tree().root.remove_child(bhud)
		get_tree().root.remove_child(player)
		get_tree().root.remove_child(level)
		if Global.debug:
			get_tree().change_scene_to_file("res://levels/ui/scene.tscn")
		else:
			get_tree().change_scene_to_file("res://title.tscn")
	if (Global.live == 1 && (Input.is_key_pressed(KEY_V) && Input.is_key_pressed(KEY_UP)) ||(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) && Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_UP))):
		if Global.debug:
			if Global.dparty[0] != null:
				Global.dcpchar = 0
		else:
			if Global.party[0] != null:
				Global.cpchar = 0
	elif (Global.live == 1 && (Input.is_key_pressed(KEY_V) && Input.is_key_pressed(KEY_RIGHT)) ||(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) && Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_RIGHT))):
		if Global.debug:
			if Global.dparty[1] != null:
				Global.dcpchar = 1
		else:
			if Global.party[1] != null:
				Global.cpchar = 1
	elif (Global.live == 1 && (Input.is_key_pressed(KEY_V) && Input.is_key_pressed(KEY_DOWN)) ||(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) && Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_DOWN))):
		if Global.debug:
			if Global.dparty[2] != null:
				Global.dcpchar = 2
		else:
			if Global.party[2] != null:
				Global.cpchar = 2
	elif (Global.live == 1 && (Input.is_key_pressed(KEY_V) && Input.is_key_pressed(KEY_LEFT)) ||(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) && Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_LEFT))):
		if Global.debug:
			if Global.dparty[3] != null:
				Global.dcpchar = 3
		else:
			if Global.party[3] != null:
				Global.cpchar = 3
	if Global.bossready:
		Global.bossready = false
		sfx1.stream = load(Global.sfxtracks[1])
		sfx1.play(0)
		bgsound.play(0)
	if Global.cdialog.size() != 0 && ishud:
		get_tree().root.remove_child(thud)
		ishud = false
	elif Global.cdialog.size() == 0&& !ishud:
		get_tree().root.add_child.call_deferred(thud)
		ishud = true
