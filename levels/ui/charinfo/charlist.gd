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
		$HBoxContainer/VBoxContainer/Rikka.visible = true
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
	get_tree().change_scene("res://levels/ui/gameplay.tscn")


func _on_Midori_pressed():
	get_tree().change_scene("res://levels/ui/charinfo/Midori.tscn")


func _on_Diana_pressed():
	get_tree().change_scene("res://levels/ui/charinfo/Diana.tscn")


func _on_Pamela_pressed():
	pass


func _on_Lety_pressed():
	pass



func _on_Kimberly_pressed():
	get_tree().change_scene("res://levels/ui/charinfo/Kimberly.tscn")


func _on_Hu_pressed():
	get_tree().change_scene("res://levels/ui/charinfo/Hu.tscn")


func _on_Gurukosu_pressed():
	pass


func _on_Momo_pressed():
	pass


func _on_Natasha_pressed():
	pass


func _on_Rikka_pressed():
	get_tree().change_scene("res://levels/ui/charinfo/Rikka.tscn")
