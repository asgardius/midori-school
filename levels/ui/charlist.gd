extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.cheater:
		$HBoxContainer/VBoxContainer/Diana.visible = true
		$HBoxContainer/VBoxContainer/Rikka.visible = true
		$HBoxContainer/VBoxContainer/Kimberly.visible = true
		$HBoxContainer/VBoxContainer/Hu.visible = true
		$HBoxContainer/VBoxContainer/Gurukosu.visible = true
		$HBoxContainer/VBoxContainer/Momo.visible = true
		$HBoxContainer/VBoxContainer/Pamela.visible = true
		$HBoxContainer/VBoxContainer/Lety.visible = true
		$HBoxContainer/VBoxContainer/Natasha.visible = true
	if Global.quest[2] == 3:
		$HBoxContainer/VBoxContainer/Diana.visible = true
		$HBoxContainer/VBoxContainer/Pamela.visible = true
		$HBoxContainer/VBoxContainer/Lety.visible = true
	if Global.quest[3] == 3:
		$HBoxContainer/VBoxContainer/Kimberly.visible = true
	$HBoxContainer/VBoxContainer/Midori.grab_focus()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Return_pressed():
	get_tree().change_scene("res://levels/ui/teams.tscn")


func _on_Midori_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 0
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 0
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()


func _on_Diana_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 1
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 1
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()


func _on_Pamela_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 7
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 7
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()


func _on_Lety_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 8
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 8
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()



func _on_Kimberly_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 3
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 3
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()


func _on_Hu_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 4
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 4
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()


func _on_Gurukosu_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 5
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 5
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()


func _on_Momo_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 6
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 6
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()


func _on_Natasha_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 9
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 9
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()


func _on_Rikka_pressed():
	if Global.debug:
		Global.dparty[Global.charswitch][0] = 2
		Global.dparty[Global.charswitch][1] = 0
	else:
		Global.party[Global.charswitch][0] = 2
		Global.party[Global.charswitch][1] = 0
	_on_Return_pressed()
