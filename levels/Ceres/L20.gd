extends Node2D
var talk = load("res://levels/ui/talk.tscn").instantiate()
var boss
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	boss = $Kimberly
	player = $Player
	boss.add_to_group("boss")
	Global.cdialog = [[tr("DIALOG_CERES_L20_0"), true, 0, 0], [tr("DIALOG_CERES_L20_1"), false, 3], [tr("DIALOG_CERES_L20_2"), true, 0, 0]]
	Global.live = 0
	get_tree().root.add_child.call(talk)


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

func _input(event):
	if Global.cdialog.size() != 0 && Global.live == 1:
		get_tree().root.remove_child(talk)
		Global.cdialog = []
	
