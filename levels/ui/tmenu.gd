extends Control
const gamepadtest = preload("res://gamepad.gd")
var startbutton
func _ready():
	startbutton = $VBoxContainer/Start
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$VBoxContainer/Start.grab_focus()
	if Global.dificulty != 0:
		startbutton.set_text(tr("BUTTON_CONTINUE"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _level():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().change_scene("res://backgounds/wip.tscn")
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
	gamepadtest.new(event)
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://title.tscn")
#    Mouse in viewport coordinates.
#	if Input.is_key_pressed(KEY_ENTER) || Input.is_joy_button_pressed(0,JOY_BUTTON_B):
#		print("Mouse Click/Unclick at: ", event.position)
#		if highlighted == 1:
#			_on_debug_pressed()
#		if highlighted == 2:
#			_on_exit_pressed()
#		else:
#			_on_start_pressed()
#	elif Input.is_action_pressed("ui_up"):
#		focus_next
			

func _on_start_pressed():
	if Global.dificulty == 0:
		get_tree().change_scene("res://levels/ui/newgame.tscn")
	else:
		Global.live = 1
		get_tree().change_scene("res://levels/ui/gameplay.tscn")
	#_level()
	#pass # Replace with function body.


func _on_debug_pressed():
	get_tree().change_scene("res://levels/ui/settings.tscn")


func _on_exit_pressed():
	get_tree().quit()
	#pass # Replace with functio
