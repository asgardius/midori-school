extends Control
const gamepadtest = preload("res://gamepad.gd")
var alsatest
func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	alsatest = $VBoxContainer/ALSA
	$"VBoxContainer/Music".grab_focus()
	if OS.get_name() == "Linux":
		alsatest.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
	get_tree().change_scene_to_file("res://levels/ui/debug.tscn")



func _on_music_pressed():
	get_tree().change_scene_to_file("res://levels/ui/musictest.tscn")


func _on_sfx_pressed():
	get_tree().change_scene_to_file("res://levels/ui/sfxtest.tscn")


func _on_alsa_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/ui/alsatest.tscn")
