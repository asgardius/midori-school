extends Node2D
var boss

# Called when the node enters the scene tree for the first time.
func _ready():
	boss = $Lily
	boss.add_to_group("boss")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
