extends Node2D
var talk = load("res://levels/ui/talk.tscn").instantiate()
var boss
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	boss = $Natasha
	player = $Player
	boss.add_to_group("boss")
	Global.cdialog = [["What are you doing here?", true, 0, 0], ["Your father need help to debug this game", false, 9], ["Ok, i'll help too", true, 0, 0]]
	Global.live = 0
	get_tree().root.add_child.call(talk)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.y < boss.position.y && player.get_index() > boss.get_index():
		move_child(player, boss.get_index() - 1)
		print("move up")
	elif player.position.y > boss.position.y && player.get_index() < boss.get_index():
		move_child(player, boss.get_index() + 1)
		print("move down")
	#pass

func _input(event):
	if Global.cdialog.size() == 0:
		get_tree().root.remove_child(talk)
	
