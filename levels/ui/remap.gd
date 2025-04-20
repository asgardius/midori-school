extends Control
const gamepadtest = preload("res://gamepad.gd")
var action = null
var button1
var button2
var button3
var button4
var button5
var button6
var button7
var button8
var button9
func _ready():
	button1 = $VBoxContainer/Shoot
	button1.grab_focus()
	button2 = $VBoxContainer/Jump
	button3 = $VBoxContainer/Item
	button4 = $VBoxContainer/Switch
	button5 = $VBoxContainer/Special
	button6 = $VBoxContainer/Pause
	button7 = $VBoxContainer/Backpack
	button8 = $VBoxContainer/OCSkill
	button9 = $VBoxContainer/Run
	

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
	if action != null && event is InputEventJoypadButton:
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)
		print(event)
		if action.match("shoot"):
			button1.set_text("Shoot")
		elif action.match("jump"):
			button2.set_text("Jump")
		elif action.match("schar"):
			button4.set_text("Switch")
		elif action.match("pause"):
			button6.set_text("Pause")
		elif action.match("run"):
			button9.set_text("Run")
		action = null
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
	get_tree().change_scene("res://levels/ui/settings.tscn")



func _on_Shoot_pressed():
	button1.set_text("press desired button")
	action = "shoot"


func _on_Jump_pressed():
	button2.set_text("press desired button")
	action = "jump"


func _on_Switch_pressed():
	button4.set_text("press desired button")
	action = "schar"


func _on_Pause_pressed():
	button6.set_text("press desired button")
	action = "pause"


func _on_Run_pressed():
	button9.set_text("press desired button")
	action = "run"
