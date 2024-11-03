extends Control
const gamepadtest = preload("res://gamepad.gd")
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$"VBoxContainer/Disclaimer".grab_focus()

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
	get_tree().change_scene("res://levels/ui/debug.tscn")

func _on_credits_pressed():
	get_tree().change_scene("res://levels/ui/credits.tscn")


func _on_wip_pressed():
	get_tree().change_scene("res://backgounds/wip.tscn")


func _on_results_pressed():
	get_tree().change_scene("res://backgounds/result.tscn")


func _on_disclaimer_pressed():
	Global.debug = false
	get_tree().change_scene("res://backgounds/disclaimer.tscn")


func _on_testrooms_pressed():
	get_tree().change_scene("res://levels/ui/testrooms.tscn")


func _on_ceres_pressed():
	get_tree().change_scene("res://levels/ui/ceres.tscn")


func _on_cutscene_pressed():
	get_tree().change_scene("res://levels/ui/cscene.tscn")
