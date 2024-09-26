extends Control
const gamepadtest = preload("res://gamepad.gd")
var vsync
var fullscreen
var xw
var gldrv
func _ready():
	vsync = $VBoxContainer/L20
	fullscreen = $VBoxContainer/Lilytest
	xw = $VBoxContainer/Dialogtest
	gldrv = $VBoxContainer/Bullethell
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$VBoxContainer/L20.grab_focus()
	if DisplayServer.window_get_vsync_mode() == 1:
		vsync.set_text(tr("SETTING_VSYNCT"))
	else:
		vsync.set_text(tr("SETTING_VSYNCF"))
	if DisplayServer.window_get_mode() == 3:
		fullscreen.set_text(tr("SETTING_FULLSCREEN"))
	else:
		fullscreen.set_text(tr("SETTING_WINDOWED"))
		

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
	get_tree().change_scene_to_file("res://levels/ui/tmenu.tscn")


func _on_l_20_pressed():
	if DisplayServer.window_get_vsync_mode() == 1:
		DisplayServer.window_set_vsync_mode(0)
		vsync.set_text(tr("SETTING_VSYNCF"))
	else:
		DisplayServer.window_set_vsync_mode(1)
		vsync.set_text(tr("SETTING_VSYNCT"))


func _on_lilytest_pressed() -> void:
	if DisplayServer.window_get_mode() == 3:
		DisplayServer.window_set_mode(0)
		fullscreen.set_text(tr("SETTING_WINDOWED"))
	else:
		DisplayServer.window_set_mode(3)
		fullscreen.set_text(tr("SETTING_FULLSCREEN"))


func _on_dialogtest_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/ui/debug.tscn")


func _on_bullethell_pressed() -> void:
	pass
