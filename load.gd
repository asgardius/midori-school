extends Node
var file = File.new()
var fileslot
func _init(slot):
	Global.cheater = false
	if file.file_exists("user://userprefs"):
		
		
		file.open("user://userprefs", File.READ)
		var savefile = file.get_as_text().rsplit(",", true, 7)
		file.close()
		if int(savefile[1]) > 0:
			OS.set_use_vsync(true)
		else:
			OS.set_use_vsync(false)
		if int(savefile[2]) > 0:
			OS.set_window_fullscreen(true)
		else:
			OS.set_window_fullscreen(false)
		if savefile.size() > 4:
			Engine.target_fps =  int(savefile[4])
		if slot == 0:
			fileslot = int(savefile[0])
		else:
			fileslot = slot
		if fileslot == 1:
			file = File.new()
			file.open("user://slot1", File.READ)
			savefile = file.get_as_text().rsplit("\n", true, 21)
			file.close()
		elif fileslot == 2:
			file = File.new()
			file.open("user://slot2", File.READ)
			savefile = file.get_as_text().rsplit("\n", true, 21)
			file.close()
		elif fileslot == 3:
			file = File.new()
			file.open("user://slot3", File.READ)
			savefile = file.get_as_text().rsplit("\n", true, 21)
			file.close()
		elif fileslot == 4:
			file = File.new()
			file.open("user://slot4", File.READ)
			savefile = file.get_as_text().rsplit("\n", true, 21)
			file.close()
		elif fileslot == 5:
			file = File.new()
			file.open("user://slot5", File.READ)
			savefile = file.get_as_text().rsplit("\n", true, 21)
			file.close()
		elif fileslot == 6:
			file = File.new()
			file.open("user://slot6", File.READ)
			savefile = file.get_as_text().rsplit("\n", true, 21)
			file.close()
		elif fileslot == 7:
			file = File.new()
			file.open("user://slot7", File.READ)
			savefile = file.get_as_text().rsplit("\n", true, 21)
			file.close()
		elif fileslot == 8:
			file = File.new()
			file.open("user://slot8", File.READ)
			savefile = file.get_as_text().rsplit("\n", true, 21)
			file.close()
		if fileslot != 0 && savefile.size() > 7:
			Global.dificulty = int(savefile[2])
			var quest = savefile[4].rsplit(",", true, 21)
			Global.quest = [int(quest[0]), int(quest[1]), int(quest[2]), int(quest[3]), int(quest[4]), int(quest[5]), int(quest[6]), int(quest[7]), int(quest[8]), int(quest[9]), int(quest[10]), int(quest[11]), int(quest[12]), int(quest[13]), int(quest[14]), int(quest[15]), int(quest[16]), int(quest[17]), int(quest[18]), int(quest[19])]
			quest = savefile[3].rsplit(",", true, 7)
			Global.cplace = [int(quest[0]), int(quest[1]), int(quest[2])]
			Global.cpchar = int(savefile[1])
			quest = savefile[0].rsplit(",", true, 9)
			Global.party[0][0] = int(quest[0])
			Global.party[0][1] = int(quest[1])
			if quest[2] is int:
				Global.party[1][0] = int(quest[2])
				Global.party[1][1] = int(quest[3])
			else:
				Global.party[1][0] = null
				Global.party[1][1] = null
			if quest[4] is int:
				Global.party[2][0] = int(quest[4])
				Global.party[2][1] = int(quest[5])
			else:
				Global.party[2][0] = null
				Global.party[2][1] = null
			if quest[6] is int:
				Global.party[3][0] = int(quest[6])
				Global.party[3][1] = int(quest[7])
			else:
				Global.party[3][0] = null
				Global.party[3][1] = null
			quest = savefile[5].rsplit(",", true, 9)
			if quest[0] is int:
				Global.sparty[0][0] = int(quest[0])
				Global.sparty[0][1] = int(quest[1])
			if quest[2] is int:
				Global.sparty[1][0] = int(quest[2])
				Global.sparty[1][1] = int(quest[3])
			else:
				Global.sparty[1][0] = null
				Global.sparty[1][1] = null
			if quest[4] is int:
				Global.sparty[2][0] = int(quest[4])
				Global.sparty[2][1] = int(quest[5])
			else:
				Global.sparty[2][0] = null
				Global.sparty[2][1] = null
			if quest[6] is int:
				Global.sparty[3][0] = int(quest[6])
				Global.sparty[3][1] = int(quest[7])
			else:
				Global.sparty[3][0] = null
				Global.sparty[3][1] = null
			Global.defeats = int(savefile[6])
			quest = savefile[7].rsplit(",", true, 21)
			Global.challenges = [int(quest[0]), int(quest[1]), int(quest[2]), int(quest[3]), int(quest[4]), int(quest[5]), int(quest[6]), int(quest[7]), int(quest[8]), int(quest[9]), int(quest[10]), int(quest[11]), int(quest[12]), int(quest[13]), int(quest[14]), int(quest[15]), int(quest[16]), int(quest[17]), int(quest[18]), int(quest[19])]
			quest = savefile[8].rsplit(",", true, 21)
			Global.level = [int(quest[0]), int(quest[1]), int(quest[2]), int(quest[3]), int(quest[4]), int(quest[5]), int(quest[6]), int(quest[7]), int(quest[8]), int(quest[9]), int(quest[10]), int(quest[11]), int(quest[12]), int(quest[13]), int(quest[14]), int(quest[15]), int(quest[16]), int(quest[17]), int(quest[18]), int(quest[19])]
			Global.gold = int(savefile[9])
	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	#var save_nodes = get_tree().get_nodes_in_group("Persist")
	#for i in save_nodes:
	#	i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	else:
		#Global.firstrun = true
		var saveinit = "0,1,1,"+str(Time.get_unix_time_from_datetime_dict(Time.get_datetime_dict_from_system(true)))+",0"
		var file = File.new()
		file.open("user://userprefs", File.WRITE)
		file.store_string(saveinit)
		file.close()
		saveinit = "0,0,<null>,<null>,<null>,<null>,<null>,<null>\n0\n0\n1,11,19\n0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\n<null>,<null>,<null>,<null>,<null>,<null>,<null>,<null>\n0\n0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\n1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1\n0"
		file = File.new()
		file.open("user://slot1", File.WRITE)
		file.store_string(saveinit)
		file.close()
		file = File.new()
		file.open("user://slot2", File.WRITE)
		file.store_string(saveinit)
		file.close()
		file = File.new()
		file.open("user://slot3", File.WRITE)
		file.store_string(saveinit)
		file.close()
		file = File.new()
		file.open("user://slot4", File.WRITE)
		file.store_string(saveinit)
		file.close()
		file = File.new()
		file.open("user://slot5", File.WRITE)
		file.store_string(saveinit)
		file.close()
		file = File.new()
		file.open("user://slot6", File.WRITE)
		file.store_string(saveinit)
		file.close()
		file = File.new()
		file.open("user://slot7", File.WRITE)
		file.store_string(saveinit)
		file.close()
		file = File.new()
		file.open("user://slot8", File.WRITE)
		file.store_string(saveinit)
		file.close()
