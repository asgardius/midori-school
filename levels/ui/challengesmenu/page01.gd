extends Control
var gamepadtest = load("res://gamepad.gd")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.challenges[0] == 0:
		$Ch0.queue_free()
	if Global.challenges[1] == 0:
		$Ch1.queue_free()
	if Global.challenges[2] == 0:
		$Ch2.queue_free()
	if Global.challenges[3] == 0:
		$Ch3.queue_free()
	if Global.challenges[4] == 0:
		$Ch4.queue_free()
	if Global.challenges[5] == 0:
		$Ch5.queue_free()
	if Global.challenges[6] == 0:
		$Ch6.queue_free()
	if Global.challenges[7] == 0:
		$Ch7.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	gamepadtest.new(event)
	if Input.is_action_just_pressed("ui_cancel"):
		_on_Return_pressed()
	elif Input.is_action_just_pressed("ui_right"):
		_on_Next_pressed()

func _on_Return_pressed():
	if Global.live == 10:
		get_tree().change_scene("res://levels/ui/gameplay.tscn")
	else:
		get_tree().change_scene("res://levels/ui/settings.tscn")


func _on_Next_pressed():
	get_tree().change_scene("res://levels/ui/challengesmenu/page02.tscn")
