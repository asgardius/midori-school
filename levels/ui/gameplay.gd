extends Node2D
var level
var player
var music
var bgsound := AudioStreamPlayer.new()
var sfx1 := AudioStreamPlayer.new()
var musictrack
var bhud = load("res://levels/bottomhud.tscn").instantiate()
var thud = load("res://levels/ui/tophud.tscn").instantiate()
var pmenu = load("res://levels/ui/pause.tscn").instantiate()
var ispaused = false
var ishud = true

# Called when the node enters the scene tree for the first time.
func _ready():
	_statrebase()
	add_child(bgsound)
	add_child(sfx1)
	if Global.debug:
		level = load(Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][0]).instantiate()
		#player = load(Global.pchars[Global.dcpchar]).instantiate()
		musictrack = Global.musictracks[Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][1]]
		Global.isboss = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][2]
	else:
		level = load(Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][0]).instantiate()
	#	player = load(Global.pchars[Global.cpchar]).instantiate()
		musictrack = Global.musictracks[Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][1]]
		Global.isboss = Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][2]
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
	bgsound.bus = &"Music"
	bgsound.mix_target = 1
	sfx1.mix_target = 1
	sfx1.bus = &"SFX1"
	if !Global.isboss:
		bgsound.play(0)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Global.live > 4 && Global.live < 9:
		_exit()
		#velocity = (Vector2.RIGHT.rotated(rotation) * -100 * Global.xm * delta)-Vector2.UP.rotated(rotation) * -100 * Global.ym * delta

func _input(event):
	Global.xm = 0
	Global.ym = 0
	if Global.live == 1 && !Input.is_action_pressed("schar"):
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
	if Input.is_action_just_pressed("Pause") && Global.cdialog == []:
		_pausemenu()
		#Global.exitgame = true
	if Global.live == 1 && Input.is_action_pressed("schar") && Input.is_action_just_pressed("ui_up"):
		if Global.debug:
			if Global.dparty[0][0] != null:
				Global.dcpchar = 0
		else:
			if Global.party[0][0] != null:
				Global.cpchar = 0
	elif Global.live == 1 && Input.is_action_pressed("schar") && Input.is_action_just_pressed("ui_right"):
		if Global.debug:
			if Global.dparty[1][0] != null:
				Global.dcpchar = 1
		else:
			if Global.party[1][0] != null:
				Global.cpchar = 1
	elif Global.live == 1 && Input.is_action_pressed("schar") && Input.is_action_just_pressed("ui_down"):
		if Global.debug:
			if Global.dparty[2][0] != null:
				Global.dcpchar = 2
		else:
			if Global.party[2][0] != null:
				Global.cpchar = 2
	elif Global.live == 1 && Input.is_action_pressed("schar") && Input.is_action_just_pressed("ui_left"):
		if Global.debug:
			if Global.dparty[3][0] != null:
				Global.dcpchar = 3
		else:
			if Global.party[3][0] != null:
				Global.cpchar = 3
	if Global.bossready:
		Global.bossready = false
		sfx1.stream = load(Global.sfxtracks[1])
		sfx1.play(0)
		bgsound.play(0)
	if Global.live != 1 && ishud:
		get_tree().root.remove_child(thud)
		ishud = false
	elif Global.live == 1 && !ishud:
		get_tree().root.add_child.call_deferred(thud)
		ishud = true
func _statrebase():
	if Global.debug:
		for i in 4:
			if Global.dparty[i][0] != null:
				for j in 7:
					Global.mstats[Global.dparty[i][0]][j] = Global.basestats[Global.dparty[i][0]][j] * Global.dlevel[Global.dparty[i][0]]
	else:
		for i in 4:
			if Global.party[i][0] != null:
				for j in 7:
					Global.mstats[Global.party[i][0]][j] = Global.basestats[Global.party[i][0]][j] * Global.level[Global.dparty[i][0]]
func _pausemenu():
	if Global.live == 1 && !ispaused:
		get_tree().root.remove_child(bhud)
		get_tree().root.add_child.call_deferred(pmenu)
		ispaused = true
		Global.live = 4
	elif Global.live == 4 && ispaused:
		get_tree().root.remove_child(pmenu)
		get_tree().root.add_child.call_deferred(bhud)
		ispaused = false
		pmenu = load("res://levels/ui/pause.tscn").instantiate()
		Global.live = 1
func _exit():
	Global.cdialog = []
	Global.exitgame = false
	ishud = false
	Global.bossready = false
	Global.cboss = [null, null, null]
	#if Global.live == 4:
	get_tree().root.remove_child(pmenu)
	#else:
	#	get_tree().root.remove_child(thud)
	#	get_tree().root.remove_child(bhud)
	#get_tree().root.remove_child(player)
	get_tree().root.remove_child(level)
	if Global.live == 7:
		get_tree().change_scene_to_file("res://backgounds/result.tscn")
	elif Global.live == 8:
		get_tree().change_scene_to_file("res://levels/ui/Cutscenes.tscn")
	elif Global.live == 6:
		if Global.debug:
			Global.live = 0
			get_tree().change_scene_to_file("res://levels/ui/scene.tscn")
		else:
			Global.live = 0
			get_tree().change_scene_to_file("res://title.tscn")
