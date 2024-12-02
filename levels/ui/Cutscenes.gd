extends Node2D
var level
var player
var music
var bgsound := AudioStreamPlayer.new()
var sfx1 := AudioStreamPlayer.new()
var musictrack
var isboss
var bhud = load("res://levels/bottomhud.tscn").instance()
var ishud = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.live = 1
	add_child(bgsound)
	add_child(sfx1)
	level = load(Global.cutscenes[Global.ccutscene][0]).instance()
	musictrack = Global.musictracks[Global.cutscenes[Global.ccutscene][2]]
	music = load(musictrack)
	call_deferred("_level")
	call_deferred("_bhud")
	#get_tree().root.add_child.call_deferred(player)
	bgsound.stream = music
	bgsound.mix_target = 1
	bgsound.play(0)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#Global.xm = 0
	#Global.ym = 0
	#var velocity = Vector2.ZERO
	#if Global.live == 1 && !Input.is_key_pressed(KEY_V) && !Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER):
	#	if Input.get_joy_axis(0,JOY_AXIS_LEFT_X) > 0.2 || Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) > 0.2 || Input.get_joy_axis(0,JOY_AXIS_LEFT_X) < -0.2 || Input.get_joy_axis(0,JOY_AXIS_LEFT_Y) < -0.2:
	#		Global.xm = Input.get_joy_axis(0,JOY_AXIS_LEFT_X)
	#		Global.ym = Input.get_joy_axis(0,JOY_AXIS_LEFT_Y)
	#	else:
	#		if Input.is_action_pressed("ui_left"):
	#			Global.xm = -1
	#		if Input.is_action_pressed("ui_right"):
	#			Global.xm = 1
	#		if Input.is_action_pressed("ui_up"):
	#			Global.ym = -1
	#		if Input.is_action_pressed("ui_down"):
	#			Global.ym = 1
		#velocity = (Vector2.RIGHT.rotated(rotation) * -100 * Global.xm * delta)-Vector2.UP.rotated(rotation) * -100 * Global.ym * delta

func _input(event):
	if (Input.is_key_pressed(KEY_ESCAPE) || Input.is_joy_button_pressed(0,JOY_SELECT)) && Global.debug:
		Global.live = 0
		Global.bossready = false
		get_tree().root.remove_child(bhud)
		#get_tree().root.remove_child(player)
		get_tree().root.remove_child(level)
		if Global.debug:
			get_tree().change_scene("res://levels/ui/scene.tscn")
		else:
			get_tree().change_scene("res://title.tscn")
	if Input.is_action_just_pressed("ui_accept") || Input.is_action_just_pressed("mclick"):
		if Global.cutscenes[Global.ccutscene][3]:
			var ccutscene = Global.ccutscene
			Global.ccutscene = null
			get_tree().root.remove_child(bhud)
			get_tree().root.remove_child(level)
			bgsound.stop()
			if Global.debug:
				get_tree().change_scene("res://levels/ui/scene.tscn")
			else:
				get_tree().change_scene(Global.cutscenes[ccutscene][1])
		else:
			Global.ccutscene += 1
			get_tree().root.remove_child(level)
			level = load(Global.cutscenes[Global.ccutscene][0]).instance()
			if musictrack != Global.musictracks[Global.cutscenes[Global.ccutscene][2]]:
				bgsound.stop()
				musictrack = Global.musictracks[Global.cutscenes[Global.ccutscene][2]]
				music = load(musictrack)
				bgsound.stream = music
				bgsound.play(0)
			call_deferred("_level")
	#if (Global.live == 1 && (Input.is_key_pressed(KEY_V) && Input.is_key_pressed(KEY_UP)) ||(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) && Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_UP))):
	#	if Global.debug:
	#		if Global.dparty[0][0] != null:
	#			Global.dcpchar = 0
	#	else:
	#		if Global.party[0][0] != null:
	#			Global.cpchar = 0
	#elif (Global.live == 1 && (Input.is_key_pressed(KEY_V) && Input.is_key_pressed(KEY_RIGHT)) ||(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) && Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_RIGHT))):
	#	if Global.debug:
	#		if Global.dparty[1][0] != null:
	#			Global.dcpchar = 1
	#	else:
	#		if Global.party[1][0] != null:
	#			Global.cpchar = 1
	#elif (Global.live == 1 && (Input.is_key_pressed(KEY_V) && Input.is_key_pressed(KEY_DOWN)) ||(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) && Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_DOWN))):
	#	if Global.debug:
	#		if Global.dparty[2][0] != null:
	#			Global.dcpchar = 2
	#	else:
	#		if Global.party[2][0] != null:
	#			Global.cpchar = 2
	#elif (Global.live == 1 && (Input.is_key_pressed(KEY_V) && Input.is_key_pressed(KEY_LEFT)) ||(Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER) && Input.is_joy_button_pressed(0,JOY_BUTTON_DPAD_LEFT))):
	#	if Global.debug:
	#		if Global.dparty[3][0] != null:
	#			Global.dcpchar = 3
	#	else:
	#		if Global.party[3][0] != null:
	#			Global.cpchar = 3
	#if Global.bossready:
	#	Global.bossready = false
	#	sfx1.stream = load(Global.sfxtracks[1])
	#	sfx1.play(0)
	#	bgsound.play(0)

func _level():
	get_tree().root.add_child(level)

func _bhud():
	get_tree().root.add_child(bhud)
