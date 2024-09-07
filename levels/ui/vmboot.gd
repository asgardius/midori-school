extends Node2D
const backgrounds = ["res://backgounds/booting.png", "res://backgounds/fsck.png"]
var stage = 0
var bg
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	bg = $TextureRect
	bg.texture = load(backgrounds[stage])
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if stage == 0:
		stage = stage + 1
		bg.texture = load(backgrounds[stage])
	else:
		get_tree().change_scene_to_file("res://backgounds/disclaimer.tscn")
	#pass # Replace with function body.
