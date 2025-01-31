extends Control
const gamepadtest = preload("res://gamepad.gd")
func _ready():
	_statrebase()
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Global.debug = true
	$"VBoxContainer/Gamepad Test".grab_focus()

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
		#print("Mouse Click/Unclick at: ", event.position)
#		if highlighted == 1:
#			_on_debug_pressed()
#		if highlighted == 2:
#			_on_exit_pressed()
#		else:
#			_on_start_pressed()
#	elif Input.is_action_pressed("ui_up"):
#		focus_next
			


func _on_scene_selector_pressed():
	get_tree().change_scene("res://levels/ui/scene.tscn")


func _on_sound_test_pressed():
	get_tree().change_scene("res://levels/ui/soundtest.tscn")


func _on_back_pressed():
	Global.debug = false
	get_tree().change_scene("res://levels/ui/settings.tscn")


func _on_gamepad_test_pressed():
	get_tree().change_scene("res://levels/ui/gamepadtest.tscn")

func _statrebase():
	for i in 4:
		if Global.dparty[i][0] != null:
			for j in 7:
				Global.dstats[Global.dparty[i][0]][j] = Global.basestats[Global.dparty[i][0]][j] * Global.dlevel[Global.dparty[i][0]]
