extends Node
func _init():
	var saveinit = Global.levelmax[0]+","+Global.levelmax[1]+","+Global.levelmax[2]+","+Global.levelmax[3]+","+Global.levelmax[4]+","+Global.levelmax[5]+","+Global.levelmax[6]
	var file = FileAccess.open(Global.hiscoresfile, FileAccess.WRITE)
	file.store_string(saveinit)
	file.close()
