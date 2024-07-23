extends Node2D
var boss
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	boss = $Lily
	player = $Player
	boss.add_to_group("boss")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _physics_process(delta):
#	pass
