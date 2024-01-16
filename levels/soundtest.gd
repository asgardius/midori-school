extends Control
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
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
	if Input.is_action_pressed("ui_cancel"):
		_on_back_pressed()
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
	get_tree().change_scene_to_file("res://levels/debug.tscn")


func _on_title_screen_pressed():
	pass # Replace with function body.

func _on_credits_1_pressed():
	pass # Replace with function body.


func _on_credits_2_pressed():
	pass # Replace with function body.


func _on_credits_3_pressed():
	pass # Replace with function body.


func _on_disclaimer_settings_stores_pressed():
	pass # Replace with function body.


func _on_testrooms_pressed():
	pass # Replace with function body.


func _on_friendly_challenge_pressed():
	pass # Replace with function body.


func _on_school_nursery_pressed():
	pass # Replace with function body.


func _on_overworld_ceres_pressed():
	pass # Replace with function body.


func _on_boss_fight_ceres_pressed():
	pass # Replace with function body.


func _on_overworld_earth_pressed():
	pass # Replace with function body.


func _on_the_zubmarine_zone_pressed():
	pass # Replace with function body.


func _on_radioactive_desert_pressed():
	pass # Replace with function body.


func _on_boss_fight_earth_pressed():
	pass # Replace with function body.


func _on_dungeon_of_destruction_pressed():
	pass # Replace with function body.


func _on_final_boss_fight_pressed():
	pass # Replace with function body.


func _on_ending_theme_pressed():
	pass # Replace with function body.
