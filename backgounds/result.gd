extends Node2D

var rmusic := AudioStreamPlayer.new()
var wait
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(rmusic)
	var titlemusic = load(Global.musictracks[7])
	rmusic.stream = titlemusic
	rmusic.play(0)
	wait = Time.get_ticks_msec()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_accept"):
		#print("Mouse Click/Unclick at: ", event.position)
		_title()

func _title():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	if Global.debug:
		get_tree().change_scene_to_file("res://levels/ui/scene.tscn")
	else:
		get_tree().change_scene_to_file("res://backgounds/wip.tscn")
		#get_tree().root.add_child(title)
		#get_tree().root.remove_child(boot)
		#boot.queue_free()
