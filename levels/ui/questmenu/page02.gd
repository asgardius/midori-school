extends Control
var gamepadtest = load("res://gamepad.gd")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if Global.challenges[8] == 0:
		$Ch8.queue_free()
	if Global.challenges[9] == 0:
		$Ch9.queue_free()
	if Global.challenges[10] == 0:
		$Ch10.queue_free()
	if Global.challenges[10] == 0:
		$Ch11.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	gamepadtest.new(event)
	if Input.is_action_just_pressed("ui_cancel"):
		_on_Return_pressed()
	elif Input.is_action_just_pressed("ui_left"):
		_on_Previous_pressed()

func _on_Previous_pressed():
	get_tree().change_scene("res://levels/ui/challengesmenu/page01.tscn")


func _on_Return_pressed():
	if Global.live == 10:
		get_tree().change_scene("res://levels/ui/gameplay.tscn")
	else:
		get_tree().change_scene("res://levels/ui/settings.tscn")
