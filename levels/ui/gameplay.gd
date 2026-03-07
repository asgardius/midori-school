extends Node2D
const gamepadtest = preload("res://gamepad.gd")
var level
var player
var music
var bgsound := AudioStreamPlayer.new()
var sfx1 := AudioStreamPlayer.new()
var musictrack
var bhud = load("res://levels/bottomhud.tscn").instance()
var thud = load("res://levels/ui/tophud.tscn").instance()
var pmenu = load("res://levels/ui/pause.tscn").instance()
var backpack = load("res://levels/ui/backpack.tscn").instance()
var mgamepad = load("res://levels/ui/missinggamepad.tscn").instance()
var tcontrol = load("res://levels/ui/touchcontrols.tscn").instance()
var ismgamepad = false
var ishud = true
var istouch = false
var fl
var fr
var rl
var rr
var powerdismiss = false
var talk

# Called when the node enters the scene tree for the first time.
func _ready():
	fl = $Front_Left
	fr = $Front_Right
	rl = $Rear_Left
	rr = $Rear_Right
	if Input.get_mouse_mode() == 0:
		istouch = true
	if Global.dificulty == 1:
		if Global.difdamage != 0:
			print("Script Kiddie")
			Global.difdamage = Global.dparty/0
	elif Global.dificulty == 2 || Global.dificulty == 0:
		if Global.difdamage == 0 || Global.difdamage == 1:
			Global.difdamage = 1
		else:
			print("Script Kiddie")
			Global.difdamage = Global.dparty/0
	elif Global.dificulty == 3:
		if Global.difdamage == 0 || Global.difdamage == 3:
			Global.difdamage = 3
		else:
			print("Script Kiddie")
			Global.difdamage = Global.dparty/0
	elif Global.dificulty == 4:
		if Global.difdamage == 0 || Global.difdamage == 6:
			Global.difdamage = 6
		else:
			print("Script Kiddie")
			Global.difdamage = Global.dparty/0
	Input.connect("joy_connection_changed",self,"_on_joy_connection_changed")
	_statrebase()
	add_child(bgsound)
	add_child(sfx1)
	if Global.debug:
		level = load(Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][0]).instance()
		#player = load(Global.pchars[Global.dcpchar]).instance()
		musictrack = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][1]
		Global.isboss = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][2]
	else:
		level = load(Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][0]).instance()
	#	player = load(Global.pchars[Global.cpchar]).instance()
		musictrack = Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][1]
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
	
	music = load(Global.musictrackc[musictrack])
	fl.stream = load(Global.musictrackfl[musictrack])
	fr.stream = load(Global.musictrackfr[musictrack])
	rl.stream = load(Global.musictrackrl[musictrack])
	rr.stream = load(Global.musictrackrr[musictrack])
	call_deferred("_level")
	call_deferred("_bhud")
	call_deferred("_thud")
	if istouch:
		call_deferred("_tcontrol")
	#get_tree().root.add_child.call_deferred(player)
	bgsound.stream = music
	bgsound.bus = "Music"
	bgsound.mix_target = 2
	sfx1.mix_target = 1
	sfx1.bus = "SFX1"
	if !Global.isboss:
		bgsound.play(0)
		fl.play(0)
		fr.play(0)
		rl.play(0)
		rr.play(0)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.live != 1 && ishud:
		get_tree().root.remove_child(thud)
		get_tree().root.remove_child(tcontrol)
		ishud = false
	elif Global.live == 1 && !ishud:
		call_deferred("_thud")
		if istouch:
			call_deferred("_tcontrol")
		ishud = true
	if Global.istobackpack:
		Global.istobackpack = false
		_pausemenu()
		_backpackm()
	if Global.isresume:
		Global.isresume = false
		if Global.isbackpack:
			_backpackm()
		else:
			_pausemenu()
	var velocity = Vector2.ZERO
	#print(OS.get_power_percent_left())
	if OS.get_name() == "X11" && Global.live == 1:
		if OS.get_power_percent_left() < 30 && OS.get_power_state() == 1 && powerdismiss == false:
			Global.cdialog = [[tr("LOWBATTERY_WARNING"), true, 0, 0]]
			Global.live = 0
			call_deferred("_talk")
			powerdismiss = true
		elif OS.get_power_state() != 1 && powerdismiss == true:
			powerdismiss = false
	if (Global.live > 4 && Global.live < 13) || Global.live == 2:
		_exit()
		#velocity = (Vector2.RIGHT.rotated(rotation) * -100 * Global.xm * delta)-Vector2.UP.rotated(rotation) * -100 * Global.ym * delta

func _input(event):
	if (event is InputEventScreenTouch) && Input.get_mouse_mode() == 0 && !istouch && Global.live == 1:
		istouch = true
		call_deferred("_tcontrol")
	elif Input.get_mouse_mode() != 0 && istouch && !(event is InputEventScreenTouch || event is InputEventMouse):
		istouch = false
		get_tree().root.remove_child(tcontrol)
	if ismgamepad && (event is InputEventJoypadButton || Input.is_key_pressed(KEY_ENTER) || Input.is_action_just_pressed("mclick")):
		ismgamepad = false
		get_tree().root.remove_child(mgamepad)
		Global.live = 1
		
	gamepadtest.new(event)
	if Input.is_action_just_pressed("Pause") && Global.live == 1:
		_pausemenu()
	if Input.is_action_just_pressed("Backpack") && Global.live == 1:
		_backpackm()
		#Global.exitgame = true
	if Global.live == 1 && Input.is_action_pressed("schar") && Input.is_action_just_pressed("ui_up"):
		if Global.debug:
			if Global.dparty[0][0] != null && Global.dstats[Global.dparty[0][0]][0] > 0:
				Global.dcpchar = 0
		else:
			if Global.party[0][0] != null && Global.cstats[Global.party[0][0]][0] > 0:
				Global.cpchar = 0
	elif Global.live == 1 && Input.is_action_pressed("schar") && Input.is_action_just_pressed("ui_right"):
		if Global.debug:
			if Global.dparty[1][0] != null && Global.dstats[Global.dparty[1][0]][0] > 0:
				Global.dcpchar = 1
		else:
			if Global.party[1][0] != null && Global.cstats[Global.party[1][0]][0] > 0:
				Global.cpchar = 1
	elif Global.live == 1 && Input.is_action_pressed("schar") && Input.is_action_just_pressed("ui_down"):
		if Global.debug:
			if Global.dparty[2][0] != null && Global.dstats[Global.dparty[2][0]][0] > 0:
				Global.dcpchar = 2
		else:
			if Global.party[2][0] != null && Global.cstats[Global.party[2][0]][0] > 0:
				Global.cpchar = 2
	elif Global.live == 1 && Input.is_action_pressed("schar") && Input.is_action_just_pressed("ui_left"):
		if Global.debug:
			if Global.dparty[3][0] != null && Global.dstats[Global.dparty[3][0]][0] > 0:
				Global.dcpchar = 3
		else:
			if Global.party[3][0] != null && Global.cstats[Global.party[3][0]][0] > 0:
				Global.cpchar = 3
	if Global.bossready:
		Global.bossready = false
		sfx1.stream = load(Global.sfxtracks[1])
		sfx1.play(0)
		bgsound.play(0)
		fl.play(0)
		fr.play(0)
		rl.play(0)
		rr.play(0)
func _statrebase():
	if Global.debug:
		for i in 4:
			if Global.dparty[i][0] != null:
				for j in 7:
					Global.mstats[Global.dparty[i][0]][j] = Global.basestats[Global.dparty[i][0]][j] * Global.dlevel[Global.dparty[i][0]]
					Global.cstats[Global.dparty[i][0]][j] = Global.basestats[Global.dparty[i][0]][j] * Global.dlevel[Global.dparty[i][0]]
	else:
		for i in 4:
			if Global.party[i][0] != null:
				for j in 7:
					Global.mstats[Global.party[i][0]][j] = Global.basestats[Global.party[i][0]][j] * Global.level[Global.party[i][0]]
					Global.cstats[Global.party[i][0]][j] = Global.basestats[Global.party[i][0]][j] * Global.level[Global.party[i][0]]
func _backpackm():
	if Global.live == 1 && !Global.isbackpack:
		get_tree().root.remove_child(bhud)
		call_deferred("_backpack")
		Global.isbackpack = true
		Global.live = 4
	elif Global.live == 4 && Global.isbackpack:
		get_tree().root.remove_child(backpack)
		call_deferred("_bhud")
		Global.isbackpack = false
		backpack = load("res://levels/ui/backpack.tscn").instance()
		Global.live = 1
		
func _pausemenu():
	if Global.live == 1:
		Global.live = 4
		get_tree().root.remove_child(bhud)
		call_deferred("_pmenu")
	elif Global.live == 4:
		Global.live = 1
		get_tree().root.remove_child(pmenu)
		call_deferred("_bhud")
		pmenu = load("res://levels/ui/pause.tscn").instance()
func _exit():
	Global.cdialog = []
	Global.exitgame = false
	ishud = false
	Global.bossready = false
	Global.cboss = [null, null, null]
	#if Global.live == 4:
	get_tree().root.remove_child(tcontrol)
	get_tree().root.remove_child(pmenu)
	#else:
	#	get_tree().root.remove_child(thud)
	#	get_tree().root.remove_child(bhud)
	#get_tree().root.remove_child(player)
	get_tree().root.remove_child(level)
	if Global.live == 7:
		_statrebase()
		get_tree().change_scene("res://backgounds/result.tscn")
	elif Global.live == 8:
		get_tree().change_scene("res://levels/ui/Cutscenes.tscn")
	elif Global.live == 12:
		get_tree().change_scene("res://levels/ui/charinfo/charlist.tscn")
	elif Global.live == 9:
		get_tree().change_scene("res://levels/ui/teams.tscn")
	elif Global.live == 10:
		get_tree().change_scene("res://levels/ui/challengesmenu/page01.tscn")
	elif Global.live == 11:
		get_tree().change_scene("res://levels/ui/questmenu/page01.tscn")
	elif Global.live == 5:
		bhud = load("res://levels/bottomhud.tscn").instance()
		pmenu = load("res://levels/ui/pause.tscn").instance()
		_loadlevel()
	elif Global.live == 2:
		Global.result = [0, 0, 0, 0, 0]
		if !Global.debug:
			Global.defeats += 1
		_statrebase()
		get_tree().root.remove_child(thud)
		get_tree().change_scene("res://backgounds/gameover.tscn")
	elif Global.live == 6:
		Global.result = [0, 0, 0, 0, 0]
		if Global.debug:
			Global.live = 0
			get_tree().change_scene("res://levels/ui/scene.tscn")
		else:
			Global.live = 0
			get_tree().change_scene("res://title.tscn")

func  _on_joy_connection_changed(device_id, connected):
	if !ismgamepad && !connected && Global.gamepad != 0 && Global.live == 1:
		ismgamepad = true
		Global.live = 4
		call_deferred("_mgamepad")

func _level():
	get_tree().root.add_child(level)

func _thud():
	get_tree().root.add_child(thud)

func _bhud():
	get_tree().root.add_child(bhud)

func _pmenu():
	Global.live = 4
	get_tree().root.add_child(pmenu)

func _backpack():
	Global.live = 4
	get_tree().root.add_child(backpack)

func _mgamepad():
	get_tree().root.add_child(mgamepad)

func _tcontrol():
	get_tree().root.add_child(tcontrol)

func _loadlevel():
	var oldtrack = musictrack
	if Global.debug:
		level = load(Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][0]).instance()
		#player = load(Global.pchars[Global.dcpchar]).instance()
		musictrack = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][1]
		Global.isboss = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][2]
	else:
		level = load(Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][0]).instance()
	#	player = load(Global.pchars[Global.cpchar]).instance()
		musictrack = Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][1]
		Global.isboss = Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][2]
	if musictrack != oldtrack:
		bgsound.stop()
		music = load(Global.musictrackc[musictrack])
		fl.stream = load(Global.musictrackfl[musictrack])
		fr.stream = load(Global.musictrackfr[musictrack])
		rl.stream = load(Global.musictrackrl[musictrack])
		rr.stream = load(Global.musictrackrr[musictrack])
		bgsound.stream = music
		bgsound.play(0)
		fl.play(0)
		fr.play(0)
		rl.play(0)
		rr.play(0)
	_level()

func _talk():
	talk = load("res://levels/ui/talk.tscn").instance()
	get_tree().root.add_child(talk)
