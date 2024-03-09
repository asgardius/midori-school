extends Control
var topleft
var topleftbg
var cn1
var cn2
var cn3
var cn4
var cf1
var cf2
var cf3
var cf4
var cff
var cnf
var focus1
var focus2
var focus3
var focus4
var topmini
var topminibg

# Called when the node enters the scene tree for the first time.
func _ready():
	topleft = $CanvasLayer/Topleft
	topleftbg = $CanvasLayer/Topleftbg
	topmini = $CanvasLayer/Topmini
	topminibg = $CanvasLayer/Topminibg
	cn1 = $CanvasLayer/Topleft/Character1/VBoxContainer/HBoxContainer/Label
	cn2 = $CanvasLayer/Topleft/Character2/VBoxContainer/HBoxContainer/Label
	cn3 = $CanvasLayer/Topleft/Character3/VBoxContainer/HBoxContainer/Label
	cn4 = $CanvasLayer/Topleft/Character4/VBoxContainer/HBoxContainer/Label
	cf1 = $CanvasLayer/Topleft/Character1/TextureRect
	cf2 = $CanvasLayer/Topleft/Character2/TextureRect
	cf3 = $CanvasLayer/Topleft/Character3/TextureRect
	cf4 = $CanvasLayer/Topleft/Character4/TextureRect
	focus1 = $CanvasLayer/Topleft/Character1/ColorRect2
	focus2 = $CanvasLayer/Topleft/Character2/ColorRect2
	focus3 = $CanvasLayer/Topleft/Character3/ColorRect2
	focus4 = $CanvasLayer/Topleft/Character4/ColorRect2
	cnf = $CanvasLayer/Topmini/VBoxContainer/HBoxContainer/Label
	cff = $CanvasLayer/Topmini/TextureRect
	topleft.visible = false
	topleftbg.visible = false
	if Global.mangohud:
		topleft.position.y = 244
		topleftbg.position.y = 244
		topmini.position.y = 601
		topminibg.position.y = 601
	_charrefresh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_key_pressed(KEY_V) || Input.is_joy_button_pressed(0,JOY_BUTTON_RIGHT_SHOULDER):
		topleft.visible = true
		topleftbg.visible = true
	else:
		topleft.visible = false
		topleftbg.visible = false
	_charrefresh()
func _charrefresh():
	if topleft.visible:
		if Global.debug:
			if Global.dparty[0][0] != null:
				cn1.set_text(Global.pcnames[Global.dparty[0][0]])
				cf1.texture = load(Global.hudfaces[Global.dparty[0][0]][Global.dparty[0][1]])
				if Global.dcpchar == 0:
					focus1.set_color(Color(0, 0, 1, 1))
				else:
					focus1.set_color(Color(1, 1, 1, 1))
			else:
				cn1.set_text("")
				cf1.texture = null
				focus1.set_color(Color(1, 1, 1, 1))
			if Global.dparty[1][0] != null:
				cn2.set_text(Global.pcnames[Global.dparty[1][0]])
				cf2.texture = load(Global.hudfaces[Global.dparty[1][0]][Global.dparty[1][1]])
				if Global.dcpchar == 1:
					focus2.set_color(Color(0, 0, 1, 1))
				else:
					focus2.set_color(Color(1, 1, 1, 1))
			else:
				cn2.set_text("")
				cf2.texture = null
				focus2.set_color(Color(1, 1, 1, 1))
			if Global.dparty[2][0] != null:
				cn3.set_text(Global.pcnames[Global.dparty[2][0]])
				cf3.texture = load(Global.hudfaces[Global.dparty[2][0]][Global.dparty[2][1]])
				if Global.dcpchar == 2:
					focus3.set_color(Color(0, 0, 1, 1))
				else:
					focus3.set_color(Color(1, 1, 1, 1))
			else:
				cn3.set_text("")
				cf3.texture = null
				focus3.set_color(Color(1, 1, 1, 1))
			if Global.dparty[3][0] != null:
				cn4.set_text(Global.pcnames[Global.dparty[3][0]])
				cf4.texture = load(Global.hudfaces[Global.dparty[3][0]][Global.dparty[3][1]])
				if Global.dcpchar == 3:
					focus4.set_color(Color(0, 0, 1, 1))
				else:
					focus4.set_color(Color(1, 1, 1, 1))
			else:
				cn4.set_text("")
				cf4.texture = null
				focus4.set_color(Color(1, 1, 1, 1))
		else:
			if Global.party[0][0] != null:
				cn1.set_text(Global.pcnames[Global.party[0][0]])
				cf1.texture = load(Global.hudfaces[Global.party[0][0]][Global.party[0][1]])
				if Global.dcpchar == 0:
					focus1.set_color(Color(0, 0, 1, 1))
				else:
					focus1.set_color(Color(1, 1, 1, 1))
			else:
				cn1.set_text("")
				cf1.texture = null
				focus1.set_color(Color(1, 1, 1, 1))
			if Global.party[1][0] != null:
				cn2.set_text(Global.pcnames[Global.party[1][0]])
				cf2.texture = load(Global.hudfaces[Global.party[1][0]][Global.party[1][1]])
				if Global.dcpchar == 1:
					focus2.set_color(Color(0, 0, 1, 1))
				else:
					focus2.set_color(Color(1, 1, 1, 1))
			else:
				cn2.set_text("")
				cf2.texture = null
				focus2.set_color(Color(1, 1, 1, 1))
			if Global.party[2][0] != null:
				cn3.set_text(Global.pcnames[Global.party[2][0]])
				cf3.texture = load(Global.hudfaces[Global.party[2][0]][Global.party[2][1]])
				if Global.dcpchar == 2:
					focus3.set_color(Color(0, 0, 1, 1))
				else:
					focus3.set_color(Color(1, 1, 1, 1))
			else:
				cn3.set_text("")
				cf3.texture = null
				focus3.set_color(Color(1, 1, 1, 1))
			if Global.party[3][0] != null:
				cn4.set_text(Global.pcnames[Global.party[3][0]])
				cf4.texture = load(Global.hudfaces[Global.party[3][0]][Global.party[3][1]])
				if Global.dcpchar == 3:
					focus4.set_color(Color(0, 0, 1, 1))
				else:
					focus4.set_color(Color(1, 1, 1, 1))
			else:
				cn4.set_text("")
				cf4.texture = null
				focus4.set_color(Color(1, 1, 1, 1))
	else:
		if Global.debug:
			cnf.set_text(Global.pcnames[Global.dparty[Global.dcpchar][0]])
			cff.texture = load(Global.hudfaces[Global.dparty[Global.dcpchar][0]][Global.dparty[Global.dcpchar][1]])
		else:
			cnf.set_text(Global.pcnames[Global.party[Global.cpchar][0]])
			cff.texture = load(Global.hudfaces[Global.party[Global.cpchar][0]][Global.party[Global.cpchar][1]])
			
