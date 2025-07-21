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
	player.stream = load(Global.musictrackc[0])
	fl.stream = load(Global.musictrackfl[0])
	fr.stream = load(Global.musictrackfr[0])
	rl.stream = load(Global.musictrackrl[0])
	rr.stream = load(Global.musictrackrr[0])
	infobox.set_text(tr("SONG0_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)

func _on_disclaimer_settings_stores_pressed():
	player.stream = load(Global.musictrackc[1])
	fl.stream = load(Global.musictrackfl[1])
	fr.stream = load(Global.musictrackfr[1])
	rl.stream = load(Global.musictrackrl[1])
	rr.stream = load(Global.musictrackrr[1])
	infobox.set_text(tr("SONG1_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)




func _on_testrooms_pressed():
	player.stream = load(Global.musictrackc[2])
	fl.stream = load(Global.musictrackfl[2])
	fr.stream = load(Global.musictrackfr[2])
	rl.stream = load(Global.musictrackrl[2])
	rr.stream = load(Global.musictrackrr[2])
	infobox.set_text(tr("SONG2_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_friendly_challenge_pressed():
	player.stream = load(Global.musictrackc[3])
	fl.stream = load(Global.musictrackfl[3])
	fr.stream = load(Global.musictrackfr[3])
	rl.stream = load(Global.musictrackrl[3])
	rr.stream = load(Global.musictrackrr[3])
	infobox.set_text(tr("SONG3_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_school_nursery_pressed():
	player.stream = load(Global.musictrackc[4])
	fl.stream = load(Global.musictrackfl[4])
	fr.stream = load(Global.musictrackfr[4])
	rl.stream = load(Global.musictrackrl[4])
	rr.stream = load(Global.musictrackrr[4])
	infobox.set_text(tr("SONG4_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_overworld_ceres_pressed():
	player.stream = load(Global.musictrackc[5])
	fl.stream = load(Global.musictrackfl[5])
	fr.stream = load(Global.musictrackfr[5])
	rl.stream = load(Global.musictrackrl[5])
	rr.stream = load(Global.musictrackrr[5])
	infobox.set_text(tr("SONG5_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_boss_fight_ceres_pressed():
	player.stream = load(Global.musictrackc[6])
	fl.stream = load(Global.musictrackfl[6])
	fr.stream = load(Global.musictrackfr[6])
	rl.stream = load(Global.musictrackrl[6])
	rr.stream = load(Global.musictrackrr[6])
	infobox.set_text(tr("SONG6_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_result_pressed():
	player.stream = load(Global.musictrackc[7])
	fl.stream = load(Global.musictrackfl[7])
	fr.stream = load(Global.musictrackfr[7])
	rl.stream = load(Global.musictrackrl[7])
	rr.stream = load(Global.musictrackrr[7])
	infobox.set_text(tr("SONG7_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_overworld_earth_pressed():
	player.stream = load(Global.musictrackc[8])
	fl.stream = load(Global.musictrackfl[8])
	fr.stream = load(Global.musictrackfr[8])
	rl.stream = load(Global.musictrackrl[8])
	rr.stream = load(Global.musictrackrr[8])
	infobox.set_text(tr("SONG8_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_the_zubmarine_zone_pressed():
	player.stream = load(Global.musictrackc[9])
	fl.stream = load(Global.musictrackfl[9])
	fr.stream = load(Global.musictrackfr[9])
	rl.stream = load(Global.musictrackrl[9])
	rr.stream = load(Global.musictrackrr[9])
	infobox.set_text(tr("SONG9_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_radioactive_desert_pressed():
	player.stream = load(Global.musictrackc[10])
	fl.stream = load(Global.musictrackfl[10])
	fr.stream = load(Global.musictrackfr[10])
	rl.stream = load(Global.musictrackrl[10])
	rr.stream = load(Global.musictrackrr[10])
	infobox.set_text(tr("SONG10_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)

func _on_natashas_theme_pressed():
	player.stream = load(Global.musictrackc[11])
	fl.stream = load(Global.musictrackfl[11])
	fr.stream = load(Global.musictrackfr[11])
	rl.stream = load(Global.musictrackrl[11])
	rr.stream = load(Global.musictrackrr[11])
	infobox.set_text(tr("SONG11_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_dungeon_of_destruction_pressed():
	player.stream = load(Global.musictrackc[12])
	fl.stream = load(Global.musictrackfl[12])
	fr.stream = load(Global.musictrackfr[12])
	rl.stream = load(Global.musictrackrl[12])
	rr.stream = load(Global.musictrackrr[12])
	infobox.set_text(tr("SONG12_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_final_boss_fight_pressed():
	player.stream = load(Global.musictrackc[13])
	fl.stream = load(Global.musictrackfl[13])
	fr.stream = load(Global.musictrackfr[13])
	rl.stream = load(Global.musictrackrl[13])
	rr.stream = load(Global.musictrackrr[13])
	infobox.set_text(tr("SONG13_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_ending_theme_pressed():
	player.stream = load(Global.musictrackc[14])
	fl.stream = load(Global.musictrackfl[14])
	fr.stream = load(Global.musictrackfr[14])
	rl.stream = load(Global.musictrackrl[14])
	rr.stream = load(Global.musictrackrr[14])
	infobox.set_text(tr("SONG14_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_credits_1_pressed():
	player.stream = load(Global.musictrackc[15])
	fl.stream = load(Global.musictrackfl[15])
	fr.stream = load(Global.musictrackfr[15])
	rl.stream = load(Global.musictrackrl[15])
	rr.stream = load(Global.musictrackrr[15])
	infobox.set_text(tr("SONG15_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_credits_2_pressed():
	player.stream = load(Global.musictrackc[16])
	fl.stream = load(Global.musictrackfl[16])
	fr.stream = load(Global.musictrackfr[16])
	rl.stream = load(Global.musictrackrl[16])
	rr.stream = load(Global.musictrackrr[16])
	infobox.set_text(tr("SONG16_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_credits_3_pressed():
	player.stream = load(Global.musictrackc[17])
	fl.stream = load(Global.musictrackfl[17])
	fr.stream = load(Global.musictrackfr[17])
	rl.stream = load(Global.musictrackrl[17])
	rr.stream = load(Global.musictrackrr[17])
	infobox.set_text(tr("SONG17_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)




func _on_the_magic_school_pressed():
	player.stream = load(Global.musictrackc[18])
	fl.stream = load(Global.musictrackfl[18])
	fr.stream = load(Global.musictrackfr[18])
	rl.stream = load(Global.musictrackrl[18])
	rr.stream = load(Global.musictrackrr[18])
	infobox.set_text(tr("SONG18_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_deep_forest_pressed():
	player.stream = load(Global.musictrackc[19])
	fl.stream = load(Global.musictrackfl[19])
	fr.stream = load(Global.musictrackfr[19])
	rl.stream = load(Global.musictrackrl[19])
	rr.stream = load(Global.musictrackrr[19])
	infobox.set_text(tr("SONG19_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_boss_fight_earth_pressed():
	player.stream = load(Global.musictrackc[20])
	fl.stream = load(Global.musictrackfl[20])
	fr.stream = load(Global.musictrackfr[20])
	rl.stream = load(Global.musictrackrl[20])
	rr.stream = load(Global.musictrackrr[20])
	infobox.set_text(tr("SONG20_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_alsa_pressed() -> void:
	player.stream = load(Global.musictrackc[21])
	fl.stream = load(Global.musictrackfl[21])
	fr.stream = load(Global.musictrackfr[21])
	rl.stream = load(Global.musictrackrl[21])
	rr.stream = load(Global.musictrackrr[21])
	infobox.set_text(tr("SONG21_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_elysium_pressed() -> void:
	player.stream = load(Global.musictrackc[22])
	fl.stream = load(Global.musictrackfl[22])
	fr.stream = load(Global.musictrackfr[22])
	rl.stream = load(Global.musictrackrl[22])
	rr.stream = load(Global.musictrackrr[22])
	infobox.set_text(tr("SONG22_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)


func _on_Stop_pressed():
	infobox.set_text("")
	player.stop()
	fl.stop()
	fr.stop()
	rl.stop()
	rr.stop()


func _on_Neon_pressed():
	player.stream = load(Global.musictrackc[23])
	fl.stream = load(Global.musictrackfl[23])
	fr.stream = load(Global.musictrackfr[23])
	rl.stream = load(Global.musictrackrl[23])
	rr.stream = load(Global.musictrackrr[23])
	infobox.set_text(tr("SONG23_INFO"))
	player.play(0)
	fl.play(0)
	fr.play(0)
	rl.play(0)
	rr.play(0)
