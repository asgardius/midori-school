extends Node2D

var dindex = 0
var cname
var dialog
var pface
var press = false
# Called when the node enters the scene tree for the first time.
func _ready():
	cname = $CanvasLayer/Cname
	dialog = $CanvasLayer/Dialog
	pface = $CanvasLayer/Playerface
	if Global.cdialog[dindex][1]:
		cname.set_text(Global.pcnames[Global.cdialog[dindex][2]])
		pface.texture = load(Global.pcfaces[Global.cdialog[dindex][2]][Global.cdialog[dindex][3]])
	else:
		cname.set_text(Global.npcnames[Global.cdialog[dindex][2]])
		pface.texture = load(Global.npcfaces[Global.cdialog[dindex][2]])
	dialog.set_text(Global.cdialog[dindex][0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept") && !press:
		press = true
	if Input.is_action_just_released("ui_accept") && press:
		dindex += 1
		if dindex < Global.cdialog.size():
			if Global.cdialog[dindex][1]:
				cname.set_text(Global.pcnames[Global.cdialog[dindex][2]])
				pface.texture = load((Global.pcfaces[Global.cdialog[dindex][2]][Global.cdialog[dindex][3]]))
			else:
				cname.set_text(Global.npcnames[Global.cdialog[dindex][2]])
				pface.texture = load((Global.npcfaces[Global.cdialog[dindex][2]]))
			dialog.set_text(Global.cdialog[dindex][0])
		else:
			var isboss
			if Global.debug:
				isboss = Global.places[Global.dplace[0]][Global.dplace[1]][Global.dplace[2]][2]
			else:
				isboss = Global.places[Global.cplace[0]][Global.cplace[1]][Global.cplace[2]][2]
			if Global.live == 0:
				if isboss:
					Global.bossready = true
				Global.live = 1
				queue_free()
			elif Global.live == 3:
				if Global.ccutscene == null:
					Global.live = 7
				else:
					Global.live = 8
				queue_free()
		press = false
