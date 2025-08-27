extends Control

const gamepadtest = preload("res://gamepad.gd")
var player := AudioStreamPlayer.new()
var infobox
var fl
var fr
var rl
var rr

func _ready():
	fl = $Front_Left
	fr = $Front_Right
	rl = $Rear_Left
	rr = $Rear_Right
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(player)
	player.mix_target = 2
	player.bus = "Music"
	$"BoxContainer/VBoxContainer/Title Screen".grab_focus()
	infobox = $Info

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _level():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().change_scene("res://backgounds/disclaimer.tscn")
		#Global.live = 1
		#Global.gamelevel = randi() % 3
		#if Global.gamelevel == 0:
		#	get_tree().change_scene("res://backgounds/galaxy.tscn")
		#elif Global.gamelevel == 1:
		#	get_tree().change_scene("res://backgounds/wormhole.tscn")
		#else:
		#	get_tree().change_scene("res://backgounds/abstract.tscn")
		#get_tree().root.add_child(title)
		#get_tree().root.remove_child(boot)
		#boot.queue_free()

func _input(event):
	gamepadtest.new(event)
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_cancel"):
		_on_back_pressed()
	if Input.is_action_just_pressed("stopmusic"):
		infobox.set_text("")
		player.stop()
		fl.stop()
		fr.stop()
		rl.stop()
		rr.stop()
		#print("Mouse Click/Unclick at: ", event.position)
#		if highlighted == 1:
#			_on_debug_pressed()
#		if highlighted == 2:
#			_on_exit_pressed()
#		else:
#			_on_start_pressed()
#	elif Input.is_action_pressed("ui_up"):
#		focus_next
			



func _on_back_pressed():
	get_tree().change_scene("res://levels/ui/soundtest.tscn")


func _on_title_screen_pressed():
	infobox.set_text(tr("SONG0_INFO"))
	_musicplay(0)

func _on_disclaimer_settings_stores_pressed():
	infobox.set_text(tr("SONG1_INFO"))
	_musicplay(1)




func _on_testrooms_pressed():
	infobox.set_text(tr("SONG2_INFO"))
	_musicplay(2)


func _on_friendly_challenge_pressed():
	infobox.set_text(tr("SONG3_INFO"))
	_musicplay(3)


func _on_school_nursery_pressed():
	infobox.set_text(tr("SONG4_INFO"))
	_musicplay(4)


func _on_overworld_ceres_pressed():
	infobox.set_text(tr("SONG5_INFO"))
	_musicplay(5)


func _on_boss_fight_ceres_pressed():
	infobox.set_text(tr("SONG6_INFO"))
	_musicplay(6)


func _on_result_pressed():
	infobox.set_text(tr("SONG7_INFO"))
	_musicplay(7)


func _on_overworld_earth_pressed():
	infobox.set_text(tr("SONG8_INFO"))
	_musicplay(8)


func _on_the_zubmarine_zone_pressed():
	infobox.set_text(tr("SONG9_INFO"))
	_musicplay(9)


func _on_radioactive_desert_pressed():
	infobox.set_text(tr("SONG10_INFO"))
	_musicplay(10)

func _on_natashas_theme_pressed():
	infobox.set_text(tr("SONG11_INFO"))
	_musicplay(11)


func _on_dungeon_of_destruction_pressed():
	infobox.set_text(tr("SONG12_INFO"))
	_musicplay(12)


func _on_final_boss_fight_pressed():
	infobox.set_text(tr("SONG13_INFO"))
	_musicplay(13)


func _on_ending_theme_pressed():
	infobox.set_text(tr("SONG14_INFO"))
	_musicplay(14)


func _on_credits_1_pressed():
	infobox.set_text(tr("SONG15_INFO"))
	_musicplay(15)


func _on_credits_2_pressed():
	infobox.set_text(tr("SONG16_INFO"))
	_musicplay(16)


func _on_credits_3_pressed():
	infobox.set_text(tr("SONG17_INFO"))
	_musicplay(17)




func _on_the_magic_school_pressed():
	infobox.set_text(tr("SONG18_INFO"))
	_musicplay(18)


func _on_deep_forest_pressed():
	infobox.set_text(tr("SONG19_INFO"))
	_musicplay(19)


func _on_boss_fight_earth_pressed():
	infobox.set_text(tr("SONG20_INFO"))
	_musicplay(20)


func _on_alsa_pressed() -> void:
	infobox.set_text(tr("SONG21_INFO"))
	_musicplay(21)


func _on_elysium_pressed() -> void:
	infobox.set_text(tr("SONG22_INFO"))
	_musicplay(22)


func _on_Stop_pressed():
	infobox.set_text("")
	player.stop()
	fl.stop()
	fr.stop()
	rl.stop()
	rr.stop()


func _on_Neon_pressed():
	infobox.set_text(tr("SONG23_INFO"))
	_musicplay(23)


func _on_Meido_pressed():
	infobox.set_text(tr("SONG24_INFO"))
	_musicplay(24)

func _musicplay(song):
	player.stream = load(Global.musictrackc[song])
	fl.stream = load(Global.musictrackfl[song])
	fr.stream = load(Global.musictrackfr[song])
	rl.stream = load(Global.musictrackrl[song])
	rr.stream = load(Global.musictrackrr[song])
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_Underworld_pressed():
	infobox.set_text(tr("SONG25_INFO"))
	_musicplay(25)



func _on_Antiques_pressed():
	infobox.set_text(tr("SONG26_INFO"))
	_musicplay(26)

