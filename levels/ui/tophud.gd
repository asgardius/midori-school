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
var focus1
var focus2
var focus3
var focus4
var topmini
var topminibg

# Called when the node enters the scene tree for the first time.
func _ready():
	topleft = $Topleft
	topleftbg = $Topleftbg
	topmini = $Topmini
	topminibg = $Topminibg
	cn1 = $Topleft/Character1/VBoxContainer/HBoxContainer/Label
	cn2 = $Topleft/Character2/VBoxContainer/HBoxContainer/Label
	cn3 = $Topleft/Character3/VBoxContainer/HBoxContainer/Label
	cn4 = $Topleft/Character4/VBoxContainer/HBoxContainer/Label
	cf1 = $Topleft/Character1/TextureRect
	cf2 = $Topleft/Character2/TextureRect
	cf3 = $Topleft/Character3/TextureRect
	cf4 = $Topleft/Character4/TextureRect
	focus1 = $Topleft/Character1/ColorRect2
	focus2 = $Topleft/Character2/ColorRect2
	focus3 = $Topleft/Character3/ColorRect2
	focus4 = $Topleft/Character4/ColorRect2
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
	if Global.debug:
		if Global.dparty[0] != null:
			cn1.set_text(Global.pcnames[Global.dparty[0]])
			cf1.texture = load(Global.hudfaces[Global.dparty[0]])
			if Global.dcpchar == 0:
				focus1.set_color(Color(0, 0, 1, 1))
			else:
				focus1.set_color(Color(1, 1, 1, 1))
		else:
			cn1.set_text("")
			cf1.texture = null
			focus1.set_color(Color(1, 1, 1, 1))
		if Global.dparty[1] != null:
			cn2.set_text(Global.pcnames[Global.dparty[1]])
			cf2.texture = load(Global.hudfaces[Global.dparty[1]])
			if Global.dcpchar == 1:
				focus2.set_color(Color(0, 0, 1, 1))
			else:
				focus2.set_color(Color(1, 1, 1, 1))
		else:
			cn2.set_text("")
			cf2.texture = null
			focus2.set_color(Color(1, 1, 1, 1))
		if Global.dparty[2] != null:
			cn3.set_text(Global.pcnames[Global.dparty[2]])
			cf3.texture = load(Global.hudfaces[Global.dparty[2]])
			if Global.dcpchar == 2:
				focus3.set_color(Color(0, 0, 1, 1))
			else:
				focus3.set_color(Color(1, 1, 1, 1))
		else:
			cn3.set_text("")
			cf3.texture = null
			focus3.set_color(Color(1, 1, 1, 1))
		if Global.dparty[3] != null:
			cn4.set_text(Global.pcnames[Global.dparty[3]])
			cf4.texture = load(Global.hudfaces[Global.dparty[3]])
			if Global.dcpchar == 3:
				focus4.set_color(Color(0, 0, 1, 1))
			else:
				focus4.set_color(Color(1, 1, 1, 1))
		else:
			cn4.set_text("")
			cf4.texture = null
			focus4.set_color(Color(1, 1, 1, 1))
	else:
		if Global.party[0] != null:
			cn1.set_text(Global.pcnames[Global.party[0]])
			cf1.texture = load(Global.hudfaces[Global.party[0]])
			if Global.dcpchar == 0:
				focus1.set_color(Color(0, 0, 1, 1))
			else:
				focus1.set_color(Color(1, 1, 1, 1))
		else:
			cn1.set_text("")
			cf1.texture = null
			focus1.set_color(Color(1, 1, 1, 1))
		if Global.party[1] != null:
			cn2.set_text(Global.pcnames[Global.party[1]])
			cf2.texture = load(Global.hudfaces[Global.party[1]])
			if Global.dcpchar == 1:
				focus2.set_color(Color(0, 0, 1, 1))
			else:
				focus2.set_color(Color(1, 1, 1, 1))
		else:
			cn2.set_text("")
			cf2.texture = null
			focus2.set_color(Color(1, 1, 1, 1))
		if Global.party[2] != null:
			cn3.set_text(Global.pcnames[Global.party[0]])
			cf3.texture = load(Global.hudfaces[Global.party[0]])
			if Global.dcpchar == 2:
				focus3.set_color(Color(0, 0, 1, 1))
			else:
				focus3.set_color(Color(1, 1, 1, 1))
		else:
			cn3.set_text("")
			cf3.texture = null
			focus3.set_color(Color(1, 1, 1, 1))
		if Global.party[3] != null:
			cn4.set_text(Global.pcnames[Global.party[3]])
			cf4.texture = load(Global.hudfaces[Global.party[3]])
			if Global.dcpchar == 3:
				focus4.set_color(Color(0, 0, 1, 1))
			else:
				focus4.set_color(Color(1, 1, 1, 1))
		else:
			cn4.set_text("")
			cf4.texture = null
			focus4.set_color(Color(1, 1, 1, 1))
