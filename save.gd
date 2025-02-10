extends Node
func _init(slot, erase):
	var saveinit = str(slot)+","+str(int(OS.is_vsync_enabled()))+","+str(int(OS.is_window_fullscreen()))+","+str(Time.get_unix_time_from_datetime_dict(Time.get_datetime_dict_from_system(true)))
	var file = File.new()
	file.open("user://userprefs", File.WRITE)
	file.store_string(saveinit)
	file.close()
	if erase:
		saveinit = "0,0,<null>,<null>,<null>,<null>,<null>,<null>\n0\n0\n1,11,19\n0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\n<null>,<null>,<null>,<null>,<null>,<null>,<null>,<null>\n0\n0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0"
	else:
		saveinit = str(Global.party[0][0])+","+str(Global.party[0][1])+","+str(Global.party[1][0])+","+str(Global.party[1][1])+","+str(Global.party[2][0])+","+str(Global.party[2][1])+","+str(Global.party[3][0])+","+str(Global.party[3][1])+"\n"+str(Global.cpchar)+"\n"+str(Global.dificulty)+"\n"+str(Global.cplace[0])+","+str(Global.cplace[1])+","+str(Global.cplace[2])+"\n"+str(Global.quest[0])+","+str(Global.quest[1])+","+str(Global.quest[2])+","+str(Global.quest[3])+","+str(Global.quest[4])+","+str(Global.quest[5])+","+str(Global.quest[6])+","+str(Global.quest[7])+","+str(Global.quest[8])+","+str(Global.quest[9])+","+str(Global.quest[10])+","+str(Global.quest[11])+","+str(Global.quest[12])+","+str(Global.quest[13])+","+str(Global.quest[14])+","+str(Global.quest[15])+","+str(Global.quest[16])+","+str(Global.quest[17])+","+str(Global.quest[18])+","+str(Global.quest[19])+"\n"+str(Global.sparty[0][0])+","+str(Global.sparty[0][1])+","+str(Global.sparty[1][0])+","+str(Global.sparty[1][1])+","+str(Global.sparty[2][0])+","+str(Global.sparty[2][1])+","+str(Global.sparty[3][0])+","+str(Global.sparty[3][1])+"\n"+str(Global.defeats)+"\n"+str(Global.challenges[0])+","+str(Global.challenges[1])+","+str(Global.challenges[2])+","+str(Global.challenges[3])+","+str(Global.challenges[4])+","+str(Global.challenges[5])+","+str(Global.challenges[6])+","+str(Global.challenges[7])+","+str(Global.challenges[8])+","+str(Global.challenges[9])+","+str(Global.challenges[10])+","+str(Global.challenges[11])+","+str(Global.challenges[12])+","+str(Global.challenges[13])+","+str(Global.challenges[14])+","+str(Global.challenges[15])+","+str(Global.challenges[16])+","+str(Global.challenges[17])+","+str(Global.challenges[18])+","+str(Global.challenges[19])+"\n"+str(Global.level[0])+","+str(Global.level[1])+","+str(Global.level[2])+","+str(Global.level[3])+","+str(Global.level[4])+","+str(Global.level[5])+","+str(Global.level[6])+","+str(Global.level[7])+","+str(Global.level[8])+","+str(Global.level[9])+","+str(Global.level[10])+","+str(Global.level[11])+","+str(Global.level[12])+","+str(Global.level[13])+","+str(Global.level[14])+","+str(Global.level[15])+","+str(Global.level[16])+","+str(Global.level[17])+","+str(Global.level[18])+","+str(Global.level[19])+"\n"+str(Global.gold)
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
