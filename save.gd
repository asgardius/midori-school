extends Node
func _init(slot, erase):
	var saveinit = str(slot)+","+str(int(OS.is_vsync_enabled()))+","+str(int(OS.is_window_fullscreen()))
	var file = File.new()
	file.open("user://userprefs", File.WRITE)
	file.store_string(saveinit)
	file.close()
	if erase:
		saveinit = "0,0,<null>,<null>,<null>,<null>,<null>,<null>\n0\n0\n1,11,19\n0,0,0,0,0,0"
	else:
		saveinit = str(Global.party[0][0])+","+str(Global.party[0][1])+","+str(Global.party[1][0])+","+str(Global.party[1][1])+","+str(Global.party[2][0])+","+str(Global.party[2][1])+","+str(Global.party[3][0])+","+str(Global.party[3][1])+"\n"+str(Global.cpchar)+"\n"+str(Global.dificulty)+"\n"+str(Global.cplace[0])+","+str(Global.cplace[1])+","+str(Global.cplace[2])+"\n"+str(Global.quest[0])+","+str(Global.quest[1])+","+str(Global.quest[2])+","+str(Global.quest[3])+","+str(Global.quest[4])+","+str(Global.quest[5])
	if slot == 1:
		file = File.new()
		file.open("user://slot1", File.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 2:
		file = File.new()
		file.open("user://slot2", File.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 3:
		file = File.new()
		file.open("user://slot3", File.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 4:
		file = File.new()
		file.open("user://slot4", File.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 5:
		file = File.new()
		file.open("user://slot5", File.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 6:
		file = File.new()
		file.open("user://slot6", File.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 7:
		file = File.new()
		file.open("user://slot7", File.WRITE)
		file.store_string(saveinit)
		file.close()
	elif slot == 8:
		file = File.new()
		file.open("user://slot8", File.WRITE)
		file.store_string(saveinit)
		file.close()
