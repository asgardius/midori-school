extends Control
var cff
var cnf
var chealthf
var clevel
var warpmenu
var teammenu
var teamswitch

# Called when the node enters the scene tree for the first time.
func _ready():
	warpmenu = $CanvasLayer/HBoxContainer2/VBoxContainer/Warp
	cff = $CanvasLayer/HBoxContainer/TextureRect
	cnf = $CanvasLayer/HBoxContainer/VBoxContainer/Cname
	chealthf = $CanvasLayer/HBoxContainer/VBoxContainer/HBoxContainer/Label2
	clevel = $CanvasLayer/HBoxContainer/VBoxContainer/HBoxContainer2/Label2
	$CanvasLayer/HBoxContainer2/VBoxContainer2/Exit.grab_focus()
	teammenu = $CanvasLayer/HBoxContainer2/VBoxContainer/Team
	_fetchdata()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	_fetchdata()

func _fetchdata():
	if Global.debug:
		if Global.dplace == [1, 8, 28]:
			teammenu.visible = true
		if Global.dplace != [1, 11, 19] && (Global.dplace[0] == 1 || Global.dplace[0] == 2):
			warpmenu.visible = true
		else:
			warpmenu.visible = false
	else:
		if Global.cplace == [1, 8, 28]:
			teammenu.visible = true
		if Global.cplace != [1, 11, 19] && (Global.cplace[0] == 1 || Global.dplace[0] == 2):
			warpmenu.visible = true
		else:
			warpmenu.visible = false
	if Global.debug:
		cnf.set_text(Global.pcnames[Global.dparty[Global.dcpchar][0]])
		cff.texture = load(Global.hudfaces[Global.dparty[Global.dcpchar][0]][Global.dparty[Global.dcpchar][1]])
		chealthf.set_text(str(Global.dstats[Global.dparty[Global.dcpchar][0]][0])+"/"+str(Global.mstats[Global.dparty[Global.dcpchar][0]][0]))
		clevel.set_text(str(Global.dlevel[Global.dparty[Global.dcpchar][0]]))
	else:
		cnf.set_text(Global.pcnames[Global.party[Global.cpchar][0]])
		cff.texture = load(Global.hudfaces[Global.party[Global.cpchar][0]][Global.party[Global.cpchar][1]])
		chealthf.set_text(str(Global.cstats[Global.dparty[Global.cpchar][0]][0])+"/"+str(Global.mstats[Global.dparty[Global.cpchar][0]][0]))
		clevel.set_text(str(Global.level[Global.party[Global.cpchar][0]]))


func _on_exit_pressed():
	Global.live = 6
	#pass # Replace with function body.


func _on_warp_pressed() -> void:
	Global.result = [0, 0, 0, 0, 0]
	if Global.debug:
		Global.dplace = [0, 0, 0]
	else:
		Global.cplace = [0, 0, 0]
	Global.live = 5


func _on_Resume_pressed():
	Global.isresume = true


func _on_Team_pressed():
	Global.live = 9


func _on_Challenges_pressed():
	Global.live = 10
