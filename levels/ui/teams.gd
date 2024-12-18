extends Control
var team1
var team2
var team3
var team4

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	team1 = $"VBoxContainer/HBoxContainer/1"
	team2 = $"VBoxContainer/HBoxContainer/2"
	team3 = $"VBoxContainer/HBoxContainer/3"
	team4 = $"VBoxContainer/HBoxContainer/4"
	if Global.debug:
		team1.icon = load(Global.pcharfull[Global.dparty[0][0]][Global.dparty[0][1]])
		if Global.dparty[1][0] != null:
			team2.icon = load(Global.pcharfull[Global.dparty[1][0]][Global.dparty[1][1]])
		if Global.dparty[2][0] != null:
			team3.icon = load(Global.pcharfull[Global.dparty[2][0]][Global.dparty[2][1]])
		if Global.dparty[3][0] != null:
			team4.icon = load(Global.pcharfull[Global.dparty[3][0]][Global.dparty[3][1]])
	else:
		team1.icon = load(Global.pcharfull[Global.party[0][0]][Global.party[0][1]])
		if Global.party[1][0] != null:
			team2.icon = load(Global.pcharfull[Global.party[1][0]][Global.party[1][1]])
		if Global.party[2][0] != null:
			team3.icon = load(Global.pcharfull[Global.party[2][0]][Global.party[2][1]])
		if Global.party[3][0] != null:
			team4.icon = load(Global.pcharfull[Global.party[3][0]][Global.party[3][1]])
	$"VBoxContainer/HBoxContainer/1".grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
func _input(event):
	if Input.is_action_just_pressed("Pause"):
		queue_free()

func _charsel():
	get_tree().change_scene("res://levels/ui/charlist.tscn")

func _on_Return_pressed():
	#	call_deferred("_teamswitch")Global.isresume = true
	get_tree().change_scene("res://levels/ui/gameplay.tscn")


func _on_1_pressed():
	Global.charswitch = 0
	_charsel()


func _on_2_pressed():
	Global.charswitch = 1
	_charsel()


func _on_3_pressed():
	Global.charswitch = 2
	_charsel()


func _on_4_pressed():
	Global.charswitch = 3
	_charsel()
