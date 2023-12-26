extends Node2D

var rmusic := AudioStreamPlayer.new()
var wait
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(rmusic)
	var titlemusic = load("res://music/XsEdzesSs.wav")
	rmusic.stream = titlemusic
	rmusic.play(0)
	wait = Time.get_ticks_msec()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
   # Mouse in viewport coordinates.
	if (Time.get_ticks_msec() - wait) >= 1000 && (event is InputEventMouseButton || Input.is_joy_button_pressed(0,JOY_BUTTON_A) || Input.is_key_pressed(KEY_ENTER)):
		#print("Mouse Click/Unclick at: ", event.position)
		_title()

func _title():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
		get_tree().change_scene_to_file("res://title.tscn")
		#get_tree().root.add_child(title)
		#get_tree().root.remove_child(boot)
		#boot.queue_free()
