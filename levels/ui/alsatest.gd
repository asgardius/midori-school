extends Control
var bgsound := AudioStreamPlayer.new()
var fl := AudioStreamPlayer2D.new()
var fr := AudioStreamPlayer2D.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(bgsound)
	add_child(fl)
	add_child(fr)
	bgsound.stream = load(Global.musictracks[21])
	fl.stream = load("res://sfx/Front_Left.wav")
	fr.stream = load("res://sfx/Front_Right.wav")
	bgsound.set_volume_db(-10)
	fl.set_volume_db(10)
	fr.set_volume_db(10)
	bgsound.play(0)

func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://levels/ui/soundtest.tscn")
	elif Input.is_action_just_pressed("ui_left"):
		fl.play(0)
	elif Input.is_action_just_pressed("ui_right"):
		fr.play(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
