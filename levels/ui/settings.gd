extends Control
const gamepadtest = preload("res://gamepad.gd")
var vsync
var fullscreen
var fps
func _ready():
	vsync = $VBoxContainer/L20
	fullscreen = $VBoxContainer/Lilytest
	fps = $VBoxContainer/Credits
	if Engine.target_fps == 30:
		fps.set_text(tr("SETTING_LFPST"))
	else:
		fps.set_text(tr("SETTING_LFPSF"))
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$VBoxContainer/L20.grab_focus()
	if OS.get_name() == "X11":
		vsync.disabled = false
		fullscreen.disabled = false
		fps.disabled = false
	if OS.is_vsync_enabled():
		vsync.set_text(tr("SETTING_VSYNCT"))
	else:
		vsync.set_text(tr("SETTING_VSYNCF"))
	if OS.is_window_fullscreen():
		fullscreen.set_text(tr("SETTING_FULLSCREEN"))
	else:
		fullscreen.set_text(tr("SETTING_WINDOWED"))
		

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
	get_tree().change_scene("res://levels/ui/tmenu.tscn")


func _on_l_20_pressed():
	if OS.is_vsync_enabled():
		OS.set_use_vsync(false)
		vsync.set_text(tr("SETTING_VSYNCF"))
	else:
		OS.set_use_vsync(true)
		vsync.set_text(tr("SETTING_VSYNCT"))


func _on_lilytest_pressed() -> void:
	if OS.is_window_fullscreen():
		OS.set_window_fullscreen(false)
		fullscreen.set_text(tr("SETTING_WINDOWED"))
	else:
		OS.set_window_fullscreen(true)
		fullscreen.set_text(tr("SETTING_FULLSCREEN"))


func _on_dialogtest_pressed() -> void:
	get_tree().change_scene("res://levels/ui/debug.tscn")


func _on_bullethell_pressed() -> void:
	get_tree().change_scene("res://levels/ui/savefile.tscn")


func _on_Credits_pressed():
	if Engine.target_fps == 30:
		Engine.target_fps = 0
		fps.set_text(tr("SETTING_LFPSF"))
		
	else:
		Engine.target_fps = 30
		fps.set_text(tr("SETTING_LFPST"))
