extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Global.debug:
		Global.cplace = [1, 1, 17]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass