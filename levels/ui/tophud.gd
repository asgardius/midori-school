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
var chealthf
var cstaminaf
var cskillf
var chealth1
var cstamina1
var cskill1
var chealth2
var cstamina2
var cskill2
var chealth3
var cstamina3
var cskill3
var chealth4
var cstamina4
var cskill4
var bhealthf
var bstaminaf
var bskillf
var bhealth1
var bstamina1
var bskill1
var bhealth2
var bstamina2
var bskill2
var bhealth3
var bstamina3
var bskill3
var bhealth4
var bstamina4
var bskill4
var bboss
var cboss
var nboss
var boss
var bossbg
var ctime
var ctimeset
var buffcalc

# Called when the node enters the scene tree for the first time.
func _ready():
	ctime = $CanvasLayer/Time
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
	chealthf = $CanvasLayer/Topmini/VBoxContainer/HBoxContainer2/Label2
	cstaminaf = $CanvasLayer/Topmini/VBoxContainer/HBoxContainer3/Label2
	cskillf = $CanvasLayer/Topmini/VBoxContainer/HBoxContainer4/Label2
	chealth1 = $CanvasLayer/Topleft/Character1/VBoxContainer/HBoxContainer2/Label2
	cstamina1 = $CanvasLayer/Topleft/Character1/VBoxContainer/HBoxContainer3/Label2
	cskill1 = $CanvasLayer/Topleft/Character1/VBoxContainer/HBoxContainer4/Label2
	chealth2 = $CanvasLayer/Topleft/Character2/VBoxContainer/HBoxContainer2/Label2
	cstamina2 = $CanvasLayer/Topleft/Character2/VBoxContainer/HBoxContainer3/Label2
	cskill2 = $CanvasLayer/Topleft/Character2/VBoxContainer/HBoxContainer4/Label2
	chealth3 = $CanvasLayer/Topleft/Character3/VBoxContainer/HBoxContainer2/Label2
	cstamina3 = $CanvasLayer/Topleft/Character3/VBoxContainer/HBoxContainer3/Label2
	cskill3 = $CanvasLayer/Topleft/Character3/VBoxContainer/HBoxContainer4/Label2
	chealth4 = $CanvasLayer/Topleft/Character4/VBoxContainer/HBoxContainer2/Label2
	cstamina4 = $CanvasLayer/Topleft/Character4/VBoxContainer/HBoxContainer3/Label2
	cskill4 = $CanvasLayer/Topleft/Character4/VBoxContainer/HBoxContainer4/Label2
	bhealthf = $CanvasLayer/Topmini/VBoxContainer/HBoxContainer2/ProgressBar
	bstaminaf = $CanvasLayer/Topmini/VBoxContainer/HBoxContainer3/ProgressBar
	bskillf = $CanvasLayer/Topmini/VBoxContainer/HBoxContainer4/ProgressBar
	bhealth1 = $CanvasLayer/Topleft/Character1/VBoxContainer/HBoxContainer2/ProgressBar
	bstamina1 = $CanvasLayer/Topleft/Character1/VBoxContainer/HBoxContainer3/ProgressBar
	bskill1 = $CanvasLayer/Topleft/Character1/VBoxContainer/HBoxContainer4/ProgressBar
	bhealth2 = $CanvasLayer/Topleft/Character2/VBoxContainer/HBoxContainer2/ProgressBar
	bstamina2 = $CanvasLayer/Topleft/Character2/VBoxContainer/HBoxContainer3/ProgressBar
	bskill2 = $CanvasLayer/Topleft/Character2/VBoxContainer/HBoxContainer4/ProgressBar
	bhealth3 = $CanvasLayer/Topleft/Character3/VBoxContainer/HBoxContainer2/ProgressBar
	bstamina3 = $CanvasLayer/Topleft/Character3/VBoxContainer/HBoxContainer3/ProgressBar
	bskill3 = $CanvasLayer/Topleft/Character3/VBoxContainer/HBoxContainer4/ProgressBar
	bhealth4 = $CanvasLayer/Topleft/Character4/VBoxContainer/HBoxContainer2/ProgressBar
	bstamina4 = $CanvasLayer/Topleft/Character4/VBoxContainer/HBoxContainer3/ProgressBar
	bskill4 = $CanvasLayer/Topleft/Character4/VBoxContainer/HBoxContainer4/ProgressBar
	bboss = $CanvasLayer/Boss/HBoxContainer2/ProgressBar
	cboss = $CanvasLayer/Boss/HBoxContainer2/Label2
	nboss = $CanvasLayer/Boss/HBoxContainer/Label
	boss = $CanvasLayer/Boss
	bossbg = $CanvasLayer/Bossbg
	topleft.visible = false
	topleftbg.visible = false
	if Global.cboss == [null, null, null]:
		bossbg.visible = false
		boss.visible = false
	else:
		bossbg.visible = true
		boss.visible = true
		nboss.set_text(Global.cboss[0])
		if Global.cboss[2] != 0:
			bboss.value = (Global.cboss[1] * 100) / Global.cboss[2]
		cboss.set_text(str(Global.cboss[1])+"/"+str(Global.cboss[2]))
		
	_charrefresh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		_charrefresh()
		ctimeset = Time.get_time_string_from_system(false)
		ctimeset.erase(5, 3)
		ctime.set_text(ctimeset)
		ctimeset.erase(2, 3)
		buffcalc = int(ctimeset)
		if buffcalc < 6 && buffcalc >= 20:
			#print("water")
			Global.spboost = 0
		elif buffcalc < 14 && buffcalc >= 12:
			#print("fire")
			Global.spboost = 1
		elif buffcalc < 20 && buffcalc >= 18:
			#print("electricity")
			Global.spboost = 2
		elif buffcalc < 10 && buffcalc >= 6:
			#print("wood")
			Global.spboost = 3
		elif buffcalc < 12 && buffcalc >= 10:
			#print("earth")
			Global.spboost = 4
		elif buffcalc < 18 && buffcalc >= 14:
			#print("wind")
			Global.spboost = 5
		if Global.debug:
			chealthf.set_text(str(Global.dstats[Global.dparty[Global.dcpchar][0]][0])+"/"+str(Global.mstats[Global.dparty[Global.dcpchar][0]][0]))
			cstaminaf.set_text(str(Global.dstats[Global.dparty[Global.dcpchar][0]][1])+"/"+str(Global.mstats[Global.dparty[Global.dcpchar][0]][1]))
			cskillf.set_text(str(Global.dstats[Global.dparty[Global.dcpchar][0]][4])+"/"+str(Global.mstats[Global.dparty[Global.dcpchar][0]][4]))
			bhealthf.value = (Global.dstats[Global.dparty[Global.dcpchar][0]][0] * 100) / Global.mstats[Global.dparty[Global.dcpchar][0]][0]
			bstaminaf.value = (Global.dstats[Global.dparty[Global.dcpchar][0]][1] * 100) / Global.mstats[Global.dparty[Global.dcpchar][0]][1]
			bskillf.value = (Global.dstats[Global.dparty[Global.dcpchar][0]][4] * 100) / Global.mstats[Global.dparty[Global.dcpchar][0]][4]
		else:
			chealthf.set_text(str(Global.cstats[Global.party[Global.cpchar][0]][0])+"/"+str(Global.mstats[Global.party[Global.cpchar][0]][0]))
			cstaminaf.set_text(str(Global.cstats[Global.party[Global.cpchar][0]][1])+"/"+str(Global.mstats[Global.party[Global.cpchar][0]][1]))
			cskillf.set_text(str(Global.cstats[Global.party[Global.cpchar][0]][4])+"/"+str(Global.mstats[Global.party[Global.cpchar][0]][4]))
			bhealthf.value = (Global.cstats[Global.party[Global.cpchar][0]][0] * 100) / Global.mstats[Global.party[Global.cpchar][0]][0]
			bstaminaf.value = (Global.cstats[Global.party[Global.cpchar][0]][1] * 100) / Global.mstats[Global.party[Global.cpchar][0]][1]
			bskillf.value = (Global.cstats[Global.party[Global.cpchar][0]][4] * 100) / Global.mstats[Global.party[Global.cpchar][0]][4]


func _input(event):
	if Global.cboss == [null, null, null]:
		bossbg.visible = false
		boss.visible = false
	else:
		bossbg.visible = true
		boss.visible = true
		nboss.set_text(Global.cboss[0])
		if Global.cboss[2] != 0:
			bboss.value = (Global.cboss[1] * 100) / Global.cboss[2]
		cboss.set_text(str(Global.cboss[1])+"/"+str(Global.cboss[2]))
	if Input.is_action_just_pressed("schar"):
		topleft.visible = true
		topleftbg.visible = true
	elif Input.is_action_just_released("schar"):
		topleft.visible = false
		topleftbg.visible = false
	#_charrefresh()
func _charrefresh():
	if topleft.visible:
		if Global.debug:
			if Global.dparty[0][0] != null:
				cn1.set_text(Global.pcnames[Global.dparty[0][0]])
				cf1.texture = load(Global.hudfaces[Global.dparty[0][0]][Global.dparty[0][1]])
				chealth1.set_text(str(Global.dstats[Global.dparty[0][0]][0])+"/"+str(Global.mstats[Global.dparty[0][0]][0]))
				cstamina1.set_text(str(Global.dstats[Global.dparty[0][0]][1])+"/"+str(Global.mstats[Global.dparty[0][0]][1]))
				cskill1.set_text(str(Global.dstats[Global.dparty[0][0]][4])+"/"+str(Global.mstats[Global.dparty[0][0]][4]))
				bhealth1.value = (Global.dstats[Global.dparty[0][0]][0] * 100) / Global.mstats[Global.dparty[0][0]][0]
				bstamina1.value = (Global.dstats[Global.dparty[0][0]][1] * 100) / Global.mstats[Global.dparty[0][0]][1]
				bskill1.value = (Global.dstats[Global.dparty[0][0]][4] * 100) / Global.mstats[Global.dparty[0][0]][4]
				if Global.dcpchar == 0:
					focus1.set_frame_color(Color(0, 0, 1, 1))
				else:
					focus1.set_frame_color(Color(1, 1, 1, 1))
			else:
				cn1.set_text("")
				cf1.texture = null
				focus1.set_frame_color(Color(1, 1, 1, 1))
				chealth1.set_text("0/0")
				cstamina1.set_text("0/0")
				cskill1.set_text("0/0")
				bhealth1.value = 0
				bstamina1.value = 0
				bskill1.value = 0
			if Global.dparty[1][0] != null:
				cn2.set_text(Global.pcnames[Global.dparty[1][0]])
				cf2.texture = load(Global.hudfaces[Global.dparty[1][0]][Global.dparty[1][1]])
				chealth2.set_text(str(Global.dstats[Global.dparty[1][0]][0])+"/"+str(Global.mstats[Global.dparty[1][0]][0]))
				cstamina2.set_text(str(Global.dstats[Global.dparty[1][0]][1])+"/"+str(Global.mstats[Global.dparty[1][0]][1]))
				cskill2.set_text(str(Global.dstats[Global.dparty[1][0]][4])+"/"+str(Global.mstats[Global.dparty[1][0]][4]))
				bhealth2.value = (Global.dstats[Global.dparty[1][0]][0] * 100) / Global.mstats[Global.dparty[1][0]][0]
				bstamina2.value = (Global.dstats[Global.dparty[1][0]][1] * 100) / Global.mstats[Global.dparty[1][0]][1]
				bskill2.value = (Global.dstats[Global.dparty[1][0]][4] * 100) / Global.mstats[Global.dparty[1][0]][4]
				if Global.dcpchar == 1:
					focus2.set_frame_color(Color(0, 0, 1, 1))
				else:
					focus2.set_frame_color(Color(1, 1, 1, 1))
			else:
				cn2.set_text("")
				cf2.texture = null
				focus2.set_frame_color(Color(1, 1, 1, 1))
				chealth2.set_text("0/0")
				cstamina2.set_text("0/0")
				cskill2.set_text("0/0")
				bhealth2.value = 0
				bstamina2.value = 0
				bskill2.value = 0
			if Global.dparty[2][0] != null:
				cn3.set_text(Global.pcnames[Global.dparty[2][0]])
				cf3.texture = load(Global.hudfaces[Global.dparty[2][0]][Global.dparty[2][1]])
				chealth3.set_text(str(Global.dstats[Global.dparty[2][0]][0])+"/"+str(Global.mstats[Global.dparty[2][0]][0]))
				cstamina3.set_text(str(Global.dstats[Global.dparty[2][0]][1])+"/"+str(Global.mstats[Global.dparty[2][0]][1]))
				cskill3.set_text(str(Global.dstats[Global.dparty[2][0]][4])+"/"+str(Global.mstats[Global.dparty[2][0]][4]))
				bhealth3.value = (Global.dstats[Global.dparty[2][0]][0] * 100) / Global.mstats[Global.dparty[2][0]][0]
				bstamina3.value = (Global.dstats[Global.dparty[2][0]][1] * 100) / Global.mstats[Global.dparty[2][0]][1]
				bskill3.value = (Global.dstats[Global.dparty[2][0]][4] * 100) / Global.mstats[Global.dparty[2][0]][4]
				if Global.dcpchar == 2:
					focus3.set_frame_color(Color(0, 0, 1, 1))
				else:
					focus3.set_frame_color(Color(1, 1, 1, 1))
			else:
				cn3.set_text("")
				cf3.texture = null
				focus3.set_frame_color(Color(1, 1, 1, 1))
				chealth3.set_text("0/0")
				cstamina3.set_text("0/0")
				cskill3.set_text("0/0")
				bhealth3.value = 0
				bstamina3.value = 0
				bskill3.value = 0
			if Global.dparty[3][0] != null:
				cn4.set_text(Global.pcnames[Global.dparty[3][0]])
				cf4.texture = load(Global.hudfaces[Global.dparty[3][0]][Global.dparty[3][1]])
				chealth4.set_text(str(Global.dstats[Global.dparty[3][0]][0])+"/"+str(Global.mstats[Global.dparty[3][0]][0]))
				cstamina4.set_text(str(Global.dstats[Global.dparty[3][0]][1])+"/"+str(Global.mstats[Global.dparty[3][0]][1]))
				cskill4.set_text(str(Global.dstats[Global.dparty[3][0]][4])+"/"+str(Global.mstats[Global.dparty[3][0]][4]))
				bhealth4.value = (Global.dstats[Global.dparty[3][0]][0] * 100) / Global.mstats[Global.dparty[3][0]][0]
				bstamina4.value = (Global.dstats[Global.dparty[3][0]][1] * 100) / Global.mstats[Global.dparty[3][0]][1]
				bskill4.value = (Global.dstats[Global.dparty[3][0]][4] * 100) / Global.mstats[Global.dparty[3][0]][4]
				if Global.dcpchar == 3:
					focus4.set_frame_color(Color(0, 0, 1, 1))
				else:
					focus4.set_frame_color(Color(1, 1, 1, 1))
			else:
				cn4.set_text("")
				cf4.texture = null
				focus4.set_frame_color(Color(1, 1, 1, 1))
				chealth4.set_text("0/0")
				cstamina4.set_text("0/0")
				cskill4.set_text("0/0")
				bhealth4.value = 0
				bstamina4.value = 0
				bskill4.value = 0
		else:
			if Global.party[0][0] != null:
				cn1.set_text(Global.pcnames[Global.party[0][0]])
				cf1.texture = load(Global.hudfaces[Global.party[0][0]][Global.party[0][1]])
				chealth1.set_text(str(Global.cstats[Global.party[0][0]][0])+"/"+str(Global.mstats[Global.party[0][0]][0]))
				cstamina1.set_text(str(Global.cstats[Global.party[0][0]][1])+"/"+str(Global.mstats[Global.party[0][0]][1]))
				cskill1.set_text(str(Global.cstats[Global.party[0][0]][4])+"/"+str(Global.mstats[Global.party[0][0]][4]))
				bhealth1.value = (Global.cstats[Global.party[0][0]][0] * 100) / Global.mstats[Global.party[0][0]][0]
				bstamina1.value = (Global.cstats[Global.party[0][0]][1] * 100) / Global.mstats[Global.party[0][0]][1]
				bskill1.value = (Global.cstats[Global.party[0][0]][4] * 100) / Global.mstats[Global.party[0][0]][4]
				if Global.dcpchar == 0:
					focus1.set_frame_color(Color(0, 0, 1, 1))
				else:
					focus1.set_frame_color(Color(1, 1, 1, 1))
			else:
				cn1.set_text("")
				cf1.texture = null
				chealth1.set_text("0/0")
				cstamina1.set_text("0/0")
				cskill1.set_text("0/0")
				bhealth1.value = 0
				bstamina1.value = 0
				bskill1.value = 0
				focus1.set_frame_color(Color(1, 1, 1, 1))
			if Global.party[1][0] != null:
				cn2.set_text(Global.pcnames[Global.party[1][0]])
				cf2.texture = load(Global.hudfaces[Global.party[1][0]][Global.party[1][1]])
				chealth2.set_text(str(Global.cstats[Global.party[1][0]][0])+"/"+str(Global.mstats[Global.party[1][0]][0]))
				cstamina2.set_text(str(Global.cstats[Global.party[1][0]][1])+"/"+str(Global.mstats[Global.party[1][0]][1]))
				cskill2.set_text(str(Global.cstats[Global.party[1][0]][4])+"/"+str(Global.mstats[Global.party[1][0]][4]))
				bhealth2.value = (Global.cstats[Global.party[1][0]][0] * 100) / Global.mstats[Global.party[1][0]][0]
				bstamina2.value = (Global.cstats[Global.party[1][0]][1] * 100) / Global.mstats[Global.party[1][0]][1]
				bskill2.value = (Global.cstats[Global.party[1][0]][4] * 100) / Global.mstats[Global.party[1][0]][4]
				if Global.dcpchar == 1:
					focus2.set_frame_color(Color(0, 0, 1, 1))
				else:
					focus2.set_frame_color(Color(1, 1, 1, 1))
			else:
				cn2.set_text("")
				cf2.texture = null
				chealth2.set_text("0/0")
				cstamina2.set_text("0/0")
				cskill2.set_text("0/0")
				bhealth2.value = 0
				bstamina2.value = 0
				bskill2.value = 0
				focus2.set_frame_color(Color(1, 1, 1, 1))
			if Global.party[2][0] != null:
				cn3.set_text(Global.pcnames[Global.party[2][0]])
				cf3.texture = load(Global.hudfaces[Global.party[2][0]][Global.party[2][1]])
				chealth3.set_text(str(Global.cstats[Global.party[2][0]][0])+"/"+str(Global.mstats[Global.party[2][0]][0]))
				cstamina3.set_text(str(Global.cstats[Global.party[2][0]][1])+"/"+str(Global.mstats[Global.party[2][0]][1]))
				cskill3.set_text(str(Global.cstats[Global.party[2][0]][4])+"/"+str(Global.mstats[Global.party[2][0]][4]))
				bhealth3.value = (Global.cstats[Global.party[2][0]][0] * 100) / Global.mstats[Global.party[2][0]][0]
				bstamina3.value = (Global.cstats[Global.party[2][0]][1] * 100) / Global.mstats[Global.party[2][0]][1]
				bskill3.value = (Global.cstats[Global.party[2][0]][4] * 100) / Global.mstats[Global.party[2][0]][4]
				if Global.dcpchar == 2:
					focus3.set_frame_color(Color(0, 0, 1, 1))
				else:
					focus3.set_frame_color(Color(1, 1, 1, 1))
			else:
				cn3.set_text("")
				cf3.texture = null
				chealth3.set_text("0/0")
				cstamina3.set_text("0/0")
				cskill3.set_text("0/0")
				bhealth3.value = 0
				bstamina3.value = 0
				bskill3.value = 0
				focus3.set_frame_color(Color(1, 1, 1, 1))
			if Global.party[3][0] != null:
				cn4.set_text(Global.pcnames[Global.party[3][0]])
				cf4.texture = load(Global.hudfaces[Global.party[3][0]][Global.party[3][1]])
				chealth4.set_text(str(Global.cstats[Global.party[3][0]][0])+"/"+str(Global.mstats[Global.party[3][0]][0]))
				cstamina4.set_text(str(Global.cstats[Global.party[3][0]][1])+"/"+str(Global.mstats[Global.party[3][0]][1]))
				cskill4.set_text(str(Global.cstats[Global.party[3][0]][4])+"/"+str(Global.mstats[Global.party[3][0]][4]))
				bhealth4.value = (Global.cstats[Global.party[3][0]][0] * 100) / Global.mstats[Global.party[3][0]][0]
				bstamina4.value = (Global.cstats[Global.party[3][0]][1] * 100) / Global.mstats[Global.party[3][0]][1]
				bskill4.value = (Global.cstats[Global.party[3][0]][4] * 100) / Global.mstats[Global.party[3][0]][4]
				if Global.dcpchar == 3:
					focus4.set_frame_color(Color(0, 0, 1, 1))
				else:
					focus4.set_frame_color(Color(1, 1, 1, 1))
			else:
				cn4.set_text("")
				cf4.texture = null
				chealth4.set_text("0/0")
				cstamina4.set_text("0/0")
				cskill4.set_text("0/0")
				bhealth4.value = 0
				bstamina4.value = 0
				bskill4.value = 0
				focus4.set_frame_color(Color(1, 1, 1, 1))
	else:
		if Global.debug:
			cnf.set_text(Global.pcnames[Global.dparty[Global.dcpchar][0]])
			cff.texture = load(Global.hudfaces[Global.dparty[Global.dcpchar][0]][Global.dparty[Global.dcpchar][1]])
			chealthf.set_text(str(Global.cstats[Global.dparty[Global.dcpchar][0]][0])+"/"+str(Global.mstats[Global.dparty[Global.dcpchar][0]][0]))
			cstaminaf.set_text(str(Global.cstats[Global.dparty[Global.dcpchar][0]][1])+"/"+str(Global.mstats[Global.dparty[Global.dcpchar][0]][1]))
			cskillf.set_text(str(Global.cstats[Global.dparty[Global.dcpchar][0]][4])+"/"+str(Global.mstats[Global.dparty[Global.dcpchar][0]][4]))
			bhealthf.value = (Global.cstats[Global.dparty[Global.dcpchar][0]][0] * 100) / Global.mstats[Global.dparty[Global.dcpchar][0]][0]
			bstaminaf.value = (Global.cstats[Global.dparty[Global.dcpchar][0]][1] * 100) / Global.mstats[Global.dparty[Global.dcpchar][0]][1]
			bskillf.value = (Global.cstats[Global.dparty[Global.dcpchar][0]][4] * 100) / Global.mstats[Global.dparty[Global.dcpchar][0]][4]
		else:
			cnf.set_text(Global.pcnames[Global.party[Global.cpchar][0]])
			cff.texture = load(Global.hudfaces[Global.party[Global.cpchar][0]][Global.party[Global.cpchar][1]])
			chealthf.set_text(str(Global.cstats[Global.party[Global.cpchar][0]][0])+"/"+str(Global.mstats[Global.party[Global.cpchar][0]][0]))
			cstaminaf.set_text(str(Global.cstats[Global.party[Global.cpchar][0]][1])+"/"+str(Global.mstats[Global.party[Global.cpchar][0]][1]))
			cskillf.set_text(str(Global.cstats[Global.party[Global.cpchar][0]][4])+"/"+str(Global.mstats[Global.party[Global.cpchar][0]][4]))
			bhealthf.value = (Global.cstats[Global.party[Global.cpchar][0]][0] * 100) / Global.mstats[Global.party[Global.cpchar][0]][0]
			bstaminaf.value = (Global.cstats[Global.party[Global.cpchar][0]][1] * 100) / Global.mstats[Global.party[Global.cpchar][0]][1]
			bskillf.value = (Global.cstats[Global.party[Global.cpchar][0]][4] * 100) / Global.mstats[Global.party[Global.cpchar][0]][4]
			
