extends Node
var file
var fileslot
func _init(slot):
	if FileAccess.file_exists("user://userprefs"):
		
		
		file = FileAccess.open("user://userprefs", FileAccess.READ)
		var savefile = file.get_as_text().rsplit(",", true, 7)
		file.close()
		DisplayServer.window_set_vsync_mode(int(savefile[1]))
		DisplayServer.window_set_mode(int(savefile[2]))
		if slot == 0:
			fileslot = int(savefile[0])
		else:
			fileslot = slot
		if fileslot == 1:
			file = FileAccess.open("user://slot1", FileAccess.READ)
			savefile = file.get_as_text().rsplit("\n", true, 7)
			file.close()
		elif fileslot == 2:
			file = FileAccess.open("user://slot2", FileAccess.READ)
			savefile = file.get_as_text().rsplit("\n", true, 7)
			file.close()
		elif fileslot == 3:
			file = FileAccess.open("user://slot3", FileAccess.READ)
			savefile = file.get_as_text().rsplit("\n", true, 7)
			file.close()
		elif fileslot == 4:
			file = FileAccess.open("user://slot4", FileAccess.READ)
			savefile = file.get_as_text().rsplit("\n", true, 7)
			file.close()
		elif fileslot == 5:
			file = FileAccess.open("user://slot5", FileAccess.READ)
			savefile = file.get_as_text().rsplit("\n", true, 7)
			file.close()
		elif fileslot == 6:
			file = FileAccess.open("user://slot6", FileAccess.READ)
			savefile = file.get_as_text().rsplit("\n", true, 7)
			file.close()
		elif fileslot == 7:
			file = FileAccess.open("user://slot7", FileAccess.READ)
			savefile = file.get_as_text().rsplit("\n", true, 7)
			file.close()
		elif fileslot == 8:
			file = FileAccess.open("user://slot8", FileAccess.READ)
			savefile = file.get_as_text().rsplit("\n", true, 7)
			file.close()
		if fileslot != 0:
			Global.dificulty = int(savefile[2])
			var quest = savefile[4].rsplit(",", true, 7)
			Global.quest = [int(quest[0]), int(quest[1]), int(quest[2]), int(quest[3]), int(quest[4]), int(quest[5])]
			quest = savefile[3].rsplit(",", true, 7)
			Global.cplace = [int(quest[0]), int(quest[1]), int(quest[2])]
			Global.cpchar = int(savefile[1])
			quest = savefile[0].rsplit(",", true, 9)
			Global.party[0][0] = int(quest[0])
			Global.party[0][1] = int(quest[1])
			if quest[2].is_valid_int():
				Global.party[1][0] = int(quest[2])
				Global.party[1][1] = int(quest[3])
			else:
				Global.party[1][0] = null
				Global.party[1][1] = null
			if quest[4].is_valid_int():
				Global.party[2][0] = int(quest[4])
				Global.party[2][1] = int(quest[5])
			else:
				Global.party[2][0] = null
				Global.party[2][1] = null
			if quest[6].is_valid_int():
				Global.party[3][0] = int(quest[6])
				Global.party[3][1] = int(quest[7])
			else:
				Global.party[3][0] = null
				Global.party[3][1] = null
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
		var saveinit = "0,1,3"
		var file = FileAccess.open("user://userprefs", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
		saveinit = "0,0,<null>,<null>,<null>,<null>,<null>,<null>\n0\n0\n1,11,19\n0,0,0,0,0,0"
		file = FileAccess.open("user://slot1", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
		file = FileAccess.open("user://slot2", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
		file = FileAccess.open("user://slot3", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
		file = FileAccess.open("user://slot4", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
		file = FileAccess.open("user://slot5", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
		file = FileAccess.open("user://slot6", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
		file = FileAccess.open("user://slot7", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
		file = FileAccess.open("user://slot8", FileAccess.WRITE)
		file.store_string(saveinit)
		file.close()
