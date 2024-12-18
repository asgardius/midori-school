extends Node2D

var talk
# Called when the node enters the scene tree for the first time.
func _ready():
	if !Global.debug:
		_statrebase()
	Global.live = 1
	#Global.quest[1] = 3
	#Global.quest[2] = 1
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept") && Global.cdialog != []:
		if Global.live == 1:
			Global.live = 0
			talk = load("res://levels/ui/talk.tscn").instance()
			call_deferred("_talk")

func _statrebase():
	for i in 4:
		if Global.party[i][0] != null:
			for j in 7:
				Global.cstats[Global.party[i][0]][j] = Global.basestats[Global.party[i][0]][j] * Global.level[Global.dparty[i][0]]


func _talk():
	get_tree().root.add_child(talk)


func _on_Katalk_body_entered(body):
	Global.cdialog = [[tr("DIALOG_HOME_0"), true, 3, 0]]


func _on_Katalk_body_exited(body):
	Global.cdialog = []
