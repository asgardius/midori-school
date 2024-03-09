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

func _physics_process(delta):
	if player.velocity.x >= 0 && player.velocity.y >= 0:
		if player.position.y < boss.position.y && player.get_index() > boss.get_index():
			move_child(player, boss.get_index() - 1)
			print("move up")
		elif player.position.y > boss.position.y && player.get_index() < boss.get_index():
			move_child(player, boss.get_index() + 1)
			print("move down")
