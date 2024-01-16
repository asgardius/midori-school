extends Control

var player := AudioStreamPlayer.new()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(player)
	$"BoxContainer/VBoxContainer/Title Screen".grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _level():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().change_scene_to_file("res://backgounds/disclaimer.tscn")
		#Global.live = 1
		#Global.gamelevel = randi() % 3
		#if Global.gamelevel == 0:
		#	get_tree().change_scene_to_file("res://backgounds/galaxy.tscn")
		#elif Global.gamelevel == 1:
		#	get_tree().change_scene_to_file("res://backgounds/wormhole.tscn")
		#else:
		#	get_tree().change_scene_to_file("res://backgounds/abstract.tscn")
		#get_tree().root.add_child(title)
		#get_tree().root.remove_child(boot)
		#boot.queue_free()

func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_cancel"):
		_on_back_pressed()
	if Input.is_key_pressed(KEY_X) || Input.is_joy_button_pressed(0,JOY_BUTTON_X):
		player.stop()
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
	get_tree().change_scene_to_file("res://levels/soundtest.tscn")


func _on_title_screen_pressed():
	player.stream = load(Global.musictracks[0])
	player.play(0)

func _on_disclaimer_settings_stores_pressed():
	player.stream = load(Global.musictracks[1])
	player.play(0)




func _on_testrooms_pressed():
	player.stream = load(Global.musictracks[2])
	player.play(0)


func _on_friendly_challenge_pressed():
	player.stream = load(Global.musictracks[3])
	player.play(0)


func _on_school_nursery_pressed():
	player.stream = load(Global.musictracks[4])
	player.play(0)


func _on_overworld_ceres_pressed():
	player.stream = load(Global.musictracks[5])
	player.play(0)


func _on_boss_fight_ceres_pressed():
	player.stream = load(Global.musictracks[6])
	player.play(0)


func _on_result_pressed():
	player.stream = load(Global.musictracks[7])
	player.play(0)


func _on_overworld_earth_pressed():
	player.stream = load(Global.musictracks[8])
	player.play(0)


func _on_the_zubmarine_zone_pressed():
	player.stream = load(Global.musictracks[9])
	player.play(0)


func _on_radioactive_desert_pressed():
	player.stream = load(Global.musictracks[10])
	player.play(0)


func _on_boss_fight_earth_pressed():
	player.stream = load(Global.musictracks[11])
	player.play(0)


func _on_dungeon_of_destruction_pressed():
	player.stream = load(Global.musictracks[12])
	player.play(0)


func _on_final_boss_fight_pressed():
	player.stream = load(Global.musictracks[13])
	player.play(0)


func _on_ending_theme_pressed():
	player.stream = load(Global.musictracks[14])
	player.play(0)


func _on_credits_1_pressed():
	player.stream = load(Global.musictracks[15])
	player.play(0)


func _on_credits_2_pressed():
	player.stream = load(Global.musictracks[16])
	player.play(0)


func _on_credits_3_pressed():
	player.stream = load(Global.musictracks[17])
	player.play(0)
