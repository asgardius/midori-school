extends Control

var player := AudioStreamPlayer.new()
var infobox

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	add_child(player)
	$"BoxContainer/VBoxContainer/Title Screen".grab_focus()
	infobox = $Info

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _level():
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	get_tree().change_scene_to_file("res://backgounds/disclaimer.tscn")
		#Global.live = 1
		#Global.gamelevel = randi() % 3
		#if Global.gamelevel == 0:
		#	get_tree().change_scene_to_file("res://backgounds/galaxy.tscn")
		#elif Global.gamelevel == 1:
		#	get_tree().change_scene_to_file("res://backgounds/wormhole.tscn")
		#else:
		#	get_tree().change_scene_to_file("res://backgounds/abstract.tscn")
		#get_tree().root.add_child(title)
		#get_tree().root.remove_child(boot)
		#boot.queue_free()

func _input(event):
   # Mouse in viewport coordinates.
	if Input.is_action_just_pressed("ui_cancel"):
		_on_back_pressed()
	if Input.is_action_just_pressed("stopmusic"):
		infobox.set_text("")
		player.stop()
		#print("Mouse Click/Unclick at: ", event.position)
#		if highlighted == 1:
#			_on_debug_pressed()
#		if highlighted == 2:
#			_on_exit_pressed()
#		else:
#			_on_start_pressed()
#	elif Input.is_action_pressed("ui_up"):
#		focus_next
			



func _on_back_pressed():
	get_tree().change_scene_to_file("res://levels/ui/soundtest.tscn")


func _on_title_screen_pressed():
	player.stream = load(Global.musictracks[0])
	infobox.set_text("RELOADED\nRELOADED THEME\nMidori is now RELOADED")
	player.play(0)

func _on_disclaimer_settings_stores_pressed():
	player.stream = load(Global.musictracks[1])
	infobox.set_text("Vince Kaichan\nJellies in the Sea\nA relaxing sea music to prepare you for this explosive Action RPG")
	player.play(0)




func _on_testrooms_pressed():
	player.stream = load(Global.musictracks[2])
	infobox.set_text("Fearofdark\nGet A Brain Morans\nMeme Music for a meme themed stage.\nYou can enter here using Test Milk and\nget something interesting")
	player.play(0)


func _on_friendly_challenge_pressed():
	player.stream = load(Global.musictracks[3])
	infobox.set_text("MrGamer\nOskars Skarmslackare\nPlayer Piano and Mechanical Drummer makes a great duo\nCenturies pass in the blink of an eye\nDo you feel old with this song? I too")
	player.play(0)


func _on_school_nursery_pressed():
	player.stream = load(Global.musictracks[4])
	infobox.set_text("JosSs\nExtra Life\nDo you want an Extra Life?\nYou need them")
	player.play(0)


func _on_overworld_ceres_pressed():
	player.stream = load(Global.musictracks[5])
	infobox.set_text("Ceekayed\nLayers\nGame graphics are made with a lot of texture layers\nmerged inside a single canvas")
	player.play(0)


func _on_boss_fight_ceres_pressed():
	player.stream = load(Global.musictracks[6])
	infobox.set_text("ko0x\ncaramel condition\nPamela stole your candy using her Kung Fu Powers\nYou have a better weapon: Fireballs")
	player.play(0)


func _on_result_pressed():
	player.stream = load(Global.musictracks[7])
	infobox.set_text("JosSs\nXs EdzesSs\nMost players can be confused by\nthe ways to earn experience in this game")
	player.play(0)


func _on_overworld_earth_pressed():
	player.stream = load(Global.musictracks[8])
	infobox.set_text("Vince Kaichan\nShakeshack Galaxy\nA song composed at Earth made to spread across the Galaxy\nYour father can give you an asteroid to achieve that")
	player.play(0)


func _on_the_zubmarine_zone_pressed():
	player.stream = load(Global.musictracks[9])
	infobox.set_text("Vince Kaichan\nThe Zubmarine Zone\nA militar base fill with Zubmarines and fire weapons\nYou can find a lot of Heavy Machine Guns here")
	player.play(0)


func _on_radioactive_desert_pressed():
	player.stream = load(Global.musictracks[10])
	infobox.set_text("Vince Kaichan\ncrammin jammin\nDesert radiation can kill humans instantly\nBut you can stay here without issues\nAt June 2, 2002 a Half Genie Girl born here\nIf you think that this game has an unique humour\nhere is the answer")
	player.play(0)

func _on_natashas_theme_pressed():
	player.stream = load(Global.musictracks[11])
	infobox.set_text("Vince Kaichan\nThe Func\nYou are fighting against a Maverick Fairy with a sad past\nand a hate against humans.\nA Lunate Elf like you can change her mind\nbecause that fairy also has pointy ears")
	player.play(0)


func _on_dungeon_of_destruction_pressed():
	player.stream = load(Global.musictracks[12])
	infobox.set_text("xerxes\nKaveh's theme\nThe Blacksmith of Destruction gave his name to a former untitled theme\nHe can give you the best weapon set from the universe,\nbut you must earn them\nThe Chosen One has a harder life that normal people")
	player.play(0)


func _on_final_boss_fight_pressed():
	player.stream = load(Global.musictracks[13])
	infobox.set_text("ko0x\nzenon\nYou trained for this\nIt's time to shine like Zenon Lights\nand make you final explosion")
	player.play(0)


func _on_ending_theme_pressed():
	player.stream = load(Global.musictracks[14])
	infobox.set_text("Vince Kaichan\nMilky Way\nWe won, but at what cost?")
	player.play(0)


func _on_credits_1_pressed():
	player.stream = load(Global.musictracks[15])
	infobox.set_text("Funky Fish and raina\nartificial sweetener\nThat candy was a fake one?\nNow that you are dead doesn't matter")
	player.play(0)


func _on_credits_2_pressed():
	player.stream = load(Global.musictracks[16])
	infobox.set_text("tj technoiZ\ntoo old\nI'm too old to see my daughter dying")
	player.play(0)


func _on_credits_3_pressed():
	player.stream = load(Global.musictracks[17])
	infobox.set_text("motherchip\nportello\nI said that you are dead?\nForget it\nThis is the true beggining")
	player.play(0)




func _on_the_magic_school_pressed():
	player.stream = load(Global.musictracks[18])
	infobox.set_text("Vince Kaichan\nsongbirds playground\nA happy song to forget that Kimberly will pull your ears\nwhen classes end\nYou know, that way to punish naughty elves like you")
	player.play(0)


func _on_deep_forest_pressed():
	player.stream = load(Global.musictracks[19])
	infobox.set_text("Vince Kaichan\nGotanda Lights\nThis forest is under the effect of quantum ice\nGo further and you will find a frozen lake\n and the origin of that quamtum ice")
	player.play(0)


func _on_boss_fight_earth_pressed():
	player.stream = load(Global.musictracks[20])
	infobox.set_text("rez-kenet\nunreeeal superhero 3\nReal superheroes are too mainstream\nYou can be somebody better")
	player.play(0)
