extends Control
var croll = load("res://levels/challenges/croll.tscn").instance()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Global.debug:
		Global.cplace = [0, 0, 0]
		call_deferred("_croll")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _croll():
	get_tree().root.add_child(croll)
