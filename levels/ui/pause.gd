extends Control
var cff
var cnf
var chealthf
var clevel

# Called when the node enters the scene tree for the first time.
func _ready():
	cff = $CanvasLayer/HBoxContainer/TextureRect
	cnf = $CanvasLayer/HBoxContainer/VBoxContainer/Cname
	chealthf = $CanvasLayer/HBoxContainer/VBoxContainer/HBoxContainer/Label2
	clevel = $CanvasLayer/HBoxContainer/VBoxContainer/HBoxContainer2/Label2
	_fetchdata()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	_fetchdata()

func _fetchdata():
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
