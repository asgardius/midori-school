extends Node2D
var talk = load("res://levels/ui/talk.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.cdialog = [[tr("DIALOG_TEST_0"), true, 0, 0], [tr("DIALOG_TEST_1"), false, 9], [tr("DIALOG_TEST_2"), false, 0]]
	Global.live = 0
	call_deferred("_talk")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Global.cdialog.size() != 0 && Global.live == 1:
		get_tree().root.remove_child(talk)
		Global.cdialog = []

func _talk():
	get_tree().root.add_child(talk)
