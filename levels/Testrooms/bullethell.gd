extends Node2D
var talk = load("res://levels/ui/talk.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.cdialog = [["What are you doing heree?", true, 0], ["Your father need help to debug this game", false, 9], ["Ok, i'll help too", true, 0]]
	Global.live = 0
	get_tree().root.add_child.call(talk)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Global.cdialog.size() == 0:
		get_tree().root.remove_child(talk)
