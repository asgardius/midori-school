extends Node2D
var sfx1 := AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(sfx1)
	sfx1.mix_target = 1
	sfx1.bus = "SFX1"
	sfx1.stream = load(Global.sfxtracks[0])
	sfx1.play(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://title.tscn")
