extends Node
func _init(slot, erase):
	var saveinit = str(slot)+","+str(DisplayServer.window_get_vsync_mode())+","+str(DisplayServer.window_get_mode())
	var file = FileAccess.open("user://userprefs", FileAccess.WRITE)
	file.store_string(saveinit)
	file.close()
	if erase:
		saveinit = "0,0,<null>,<null>,<null>,<null>,<null>,<null>\n0\n0\n1,11,19\n0,0,0,0,0,0"
	else:
		saveinit = str(Global.party[0][0])+","+str(Global.party[0][1])+","+str(Global.party[1][0])+","+str(Global.party[1][1])+","+str(Global.party[2][0])+","+str(Global.party[2][1])+","+str(Global.party[3][0])+","+str(Global.party[3][1])+"\n"+str(Global.cpchar)+"\n"+str(Global.dificulty)+"\n"+str(Global.cplace[0])+","+str(Global.cplace[1])+","+str(Global.cplace[2])+"\n"+str(Global.quest[0])+","+str(Global.quest[1])+","+str(Global.quest[2])+","+str(Global.quest[3])+","+str(Global.quest[4])+","+str(Global.quest[5])
	if slot == 1:
		file = FileAccess.open("user://slot1", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 2:
		file = FileAccess.open("user://slot2", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 3:
		file = FileAccess.open("user://slot3", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 4:
		file = FileAccess.open("user://slot4", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 5:
		file = FileAccess.open("user://slot5", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 6:
		file = FileAccess.open("user://slot6", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 7:
		file = FileAccess.open("user://slot7", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 8:
		file = FileAccess.open("user://slot8", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
