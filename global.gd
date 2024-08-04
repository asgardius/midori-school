extends Node

var live = 0
var time
var spkmode
var origmpos
var mousepos
var timelimit = 15000
var exitgame = false
var wait
var bossready = false
var playerx
var playery
var ccutscene = null
const cutscenes = [["res://levels/Cutscenes/opening/aboutkaizo.tscn", "res://levels/Cutscenes/opening/midorihello.tscn", 18, false], ["res://levels/Cutscenes/opening/midorihello.tscn", "res://levels/Cutscenes/opening/fearlessmidori.tscn", 18, false], ["res://levels/Cutscenes/opening/fearlessmidori.tscn", "res://levels/Cutscenes/opening/midoriwaterfall.tscn", 0, false], ["res://levels/Cutscenes/opening/midoriwaterfall.tscn", "res://levels/Cutscenes/opening/midorireading.tscn", 0, false], ["res://levels/Cutscenes/opening/midorireading.tscn", "res://levels/Cutscenes/opening/boomboomtorofi.tscn", 0, false], ["res://levels/Cutscenes/opening/boomboomtorofi.tscn", "res://levels/ui/gameplay.tscn", 0, true], ["res://levels/Cutscenes/unfunaversary/punishment.tscn", "res://levels/Cutscenes/unfunaversary/sadness.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/sadness.tscn", "res://levels/Cutscenes/unfunaversary/r3.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/r3.tscn", "res://levels/Cutscenes/unfunaversary/firstclass.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/firstclass.tscn", "res://backgounds/result.tscn", 5, true]]
const pcnames = ["Midori Asgardius", "Diana Asgardius", null, "Kimberly Arch", null, null, null, null, null, "Natasha Dostoyevsky"]
const npcnames = ["Lily", null, null, "Kimberly Arch", null, null, null, null, null, "Natasha Dostoyevsky"]
const pcfaces = [["res://sprites/common/midori/face.png"], ["res://sprites/common/tuna/face.png"], [null], ["res://sprites/common/kimberly/face.png"], [null], [null], [null], [null], [null], ["res://sprites/common/natasha/face.png"]]
const hudfaces = [["res://sprites/common/midori/facehud.png"], ["res://sprites/common/tuna/facehud.png"], [null], ["res://sprites/common/kimberly/facehud.png"], [null], [null], [null], [null], [null], ["res://sprites/common/natasha/facehud.png"]]
const npcfaces = ["res://sprites/common/midori/face.png",null, null, "res://sprites/common/kimberly/face.png", null, null, null, null, null, "res://sprites/common/natasha/face.png"]
const basestats = [[800, 200, 52, 12, 136, 25, 800], [1094, 200, 54, 7, 106, 48, 600], [null], [1143, 200, 59, 5, 117, 18, 650], [null], [null], [null], [null], [null], [1026, 200, 87, 7, 105, 49, 115]]
var cstats = [[800, 200, 52, 12, 136, 25, 800], [1094, 200, 54, 7, 106, 48, 600], [null], [1143, 200, 59, 5, 117, 18, 650], [null], [null], [null], [null], [null], [1026, 200, 87, 7, 105, 49, 115]]
var dstats = [[800, 200, 52, 12, 136, 25, 800], [1094, 200, 54, 7, 106, 48, 600], [null], [1143, 200, 59, 5, 117, 18, 650], [null], [null], [null], [null], [null], [1026, 200, 87, 7, 105, 49, 115]]
var mstats = [[null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null]]
var cdialog = []
const places = [[[["res://levels/Ceres/map.tscn", 5, false], [null, null, false]], [["res://levels/Testrooms/bullethell.tscn", 11, true], ["res://levels/Testrooms/lilytest.tscn", 6, false]], [["res://levels/Testrooms/dialogtest.tscn", 19, false], ["res://levels/Testrooms/testspawn.tscn", 2 ,false]]], [null, null, null, null, null, null, null, null, null, null, null, [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/L20.tscn", 3, true]]]]
var cplace = [0,2,1]
var dplace = [null, null, null]
const pbbullets = ["res://sprites/common/bullet/fireball.tscn", "res://sprites/common/bullet/sword.tscn", null, "res://sprites/common/bullet/arrow.tscn", null, null, null, null, null, "res://sprites/common/bullet/snowflake.tscn"]
const pcspecialities = [1, 2, null, 3, null, null, null, null, null, 0]
const pchars = [["res://sprites/common/midori/sprite.png"], ["res://sprites/common/tuna/sprite.png"], [null], ["res://sprites/common/kimberly/sprite.png"], [null], [null], [null], [null], [null], ["res://sprites/common/natasha/sprite.png"]]
const npchars = ["res://sprites/common/midori/sprite.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/sprite.png"]
var cboss = [null, null, null]
var isboss
var party = [[0,0], [1,0], [9,0], [3,0]]
const specialities = [2, 0, 3, 1, 5, 4]
var dparty = [[0,0], [1,0], [9,0], [3,0]]
var level = [1,1,1,1,1,1,1,1,1,1]
var dlevel = [1,1,1,1,1,1,1,1,1,1]
var cpchar = 0
var dificulty = 0
var dcpchar = 0
var mangohud = false
var cspawnarea = [null, null]
var owlocation = [[null, null], [null, null]]
var hiscoresfile = "user://hiscores.save"
var gamelevel
var levelmax
var firstrun
const musictracks = ["res://music/midorinoakuma.wav", "res://music/seahorse.wav", "res://music/chinesegoat.wav", "res://music/doyoufeelold.wav", "res://music/doyiuneedahealer.wav", "res://music/adayatceres.wav", "res://music/twintroublemakers.wav", "res://music/easyquiz.wav", "res://music/neowave.wav", "res://music/multivectorsubmarines.wav", "res://music/halfgeniegirls.wav", "res://music/rusianmaverickfairy.wav", "res://music/blacksmithofdestruction.wav", "res://music/shininglikefireworks.wav", "res://music/sadtrashcan.wav", "res://music/akikoletter.wav", "res://music/asadcat.wav", "res://music/lilydesire.wav", "res://music/scholartrip.wav", "res://music/quantumice.wav", "res://music/unreeeal.wav", "res://music/alsa.wav", "res://music/silverblue.wav"]
const sfxtracks = ["res://sfx/braindamage.wav", "res://sfx/gaugefill.wav", "res://sfx/boomboombakudan.wav"]
var debug = false
const release = "R0.1.11-dev"
var sk = false
var xm = 0
var ym = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
