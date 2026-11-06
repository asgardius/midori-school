extends Control
var sister = load("res://levels/challenges/sister.tscn").instance()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if !Global.debug:
			call_deferred("_sister")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _sister():
	get_tree().root.add_child(sister)
