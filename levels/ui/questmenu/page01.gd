extends Control
var gamepadtest = load("res://gamepad.gd")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.quest[0] == 3:
		$Ch0.text = tr($Ch0.text) + "\n" + tr("QSTATUS_3")
	elif Global.quest[0] == 1:
		$Ch0.text = tr($Ch0.text) + "\n" + tr("QSTATUS_1")
	elif Global.quest[0] == 2:
		$Ch0.text = tr($Ch0.text) + "\n" + tr("QSTATUS_2")
	else:
		$Ch0.text = tr($Ch0.text) + "\n" + tr("QSTATUS_0")
	if Global.quest[1] == 3:
		$Ch1.text = tr($Ch1.text) + "\n" + tr("QSTATUS_3")
	elif Global.quest[1] == 1:
		$Ch1.text = tr($Ch1.text) + "\n" + tr("QSTATUS_1")
	elif Global.quest[1] == 2:
		$Ch1.text = tr($Ch1.text) + "\n" + tr("QSTATUS_2")
	else:
		$Ch1.text = tr($Ch1.text) + "\n" + tr("QSTATUS_0")
	if Global.quest[2] == 3:
		$Ch2.text = tr($Ch2.text) + "\n" + tr("QSTATUS_3")
	elif Global.quest[2] == 1:
		$Ch2.text = tr($Ch2.text) + "\n" + tr("QSTATUS_1")
	elif Global.quest[2] == 2:
		$Ch2.text = tr($Ch2.text) + "\n" + tr("QSTATUS_2")
	else:
		$Ch2.text = tr($Ch2.text) + "\n" + tr("QSTATUS_0")
	if Global.quest[3] == 3:
		$Ch3.text = tr($Ch3.text) + "\n" + tr("QSTATUS_3")
	elif Global.quest[3] == 1:
		$Ch3.text = tr($Ch3.text) + "\n" + tr("QSTATUS_1")
	elif Global.quest[3] == 2:
		$Ch3.text = tr($Ch3.text) + "\n" + tr("QSTATUS_2")
	else:
		$Ch3.text = tr($Ch3.text) + "\n" + tr("QSTATUS_0")
	if Global.quest[4] == 3:
		$Ch4.text = tr($Ch4.text) + "\n" + tr("QSTATUS_3")
	elif Global.quest[4] == 1:
		$Ch4.text = tr($Ch4.text) + "\n" + tr("QSTATUS_1")
	elif Global.quest[4] == 2:
		$Ch4.text = tr($Ch4.text) + "\n" + tr("QSTATUS_2")
	else:
		$Ch4.text = tr($Ch4.text) + "\n" + tr("QSTATUS_0")
	if Global.quest[5] == 3:
		$Ch5.text = tr($Ch5.text) + "\n" + tr("QSTATUS_3")
	elif Global.quest[5] == 1:
		$Ch5.text = tr($Ch5.text) + "\n" + tr("QSTATUS_1")
	elif Global.quest[5] == 2:
		$Ch5.text = tr($Ch5.text) + "\n" + tr("QSTATUS_2")
	else:
		$Ch5.text = tr($Ch5.text) + "\n" + tr("QSTATUS_0")
	if Global.quest[6] == 3:
		$Ch6.text = tr($Ch6.text) + "\n" + tr("QSTATUS_3")
	elif Global.quest[6] == 1:
		$Ch6.text = tr($Ch6.text) + "\n" + tr("QSTATUS_1")
	elif Global.quest[6] == 2:
		$Ch6.text = tr($Ch6.text) + "\n" + tr("QSTATUS_2")
	else:
		$Ch6.text = tr($Ch6.text) + "\n" + tr("QSTATUS_0")
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
	if Global.live == 11:
		get_tree().change_scene("res://levels/ui/gameplay.tscn")
	else:
		get_tree().change_scene("res://levels/ui/settings.tscn")


func _on_Next_pressed():
	get_tree().change_scene("res://levels/ui/challengesmenu/page02.tscn")
