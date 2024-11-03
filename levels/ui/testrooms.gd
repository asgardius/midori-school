extends Control
const gamepadtest = preload("res://gamepad.gd")
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$"VBoxContainer/Testspawn".grab_focus()

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
			





func _on_back_pressed():
	get_tree().change_scene("res://levels/ui/scene.tscn")


func _on_testspawn_pressed():
	Global.dplace = [0, 2, 1]
	Global.live = 1
	get_tree().change_scene("res://levels/ui/gameplay.tscn")


func _on_lilytest_pressed():
	Global.dplace = [0, 1, 1]
	Global.live = 1
	get_tree().change_scene("res://levels/ui/gameplay.tscn")


func _on_dialogtest_pressed():
	Global.dplace = [0, 2, 0]
	Global.live = 1
	get_tree().change_scene("res://levels/ui/gameplay.tscn")


func _on_bullethell_pressed():
	Global.dplace = [0, 1, 0]
	Global.live = 1
	get_tree().change_scene("res://levels/ui/gameplay.tscn")
