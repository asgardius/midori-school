extends Node

var live = 0
var time
var spkmode
var origmpos
var mousepos
var timelimit = 15000
var exitgame = false
var wait = 0
var bossready = false
var playerx
var playery
var ccutscene = null
var difdamage = 0
const cutscenes = [["res://levels/Cutscenes/opening/aboutkaizo.tscn", "res://levels/Cutscenes/opening/midorihello.tscn", 18, false], ["res://levels/Cutscenes/opening/midorihello.tscn", "res://levels/Cutscenes/opening/fearlessmidori.tscn", 18, false], ["res://levels/Cutscenes/opening/fearlessmidori.tscn", "res://levels/Cutscenes/opening/midoriwaterfall.tscn", 0, false], ["res://levels/Cutscenes/opening/midoriwaterfall.tscn", "res://levels/Cutscenes/opening/midorireading.tscn", 0, false], ["res://levels/Cutscenes/opening/midorireading.tscn", "res://levels/Cutscenes/opening/boomboomtorofi.tscn", 0, false], ["res://levels/Cutscenes/opening/boomboomtorofi.tscn", "res://levels/ui/gameplay.tscn", 0, true], ["res://levels/Cutscenes/unfunaversary/punishment.tscn", "res://levels/Cutscenes/unfunaversary/sadness.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/sadness.tscn", "res://levels/Cutscenes/unfunaversary/r3.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/r3.tscn", "res://levels/Cutscenes/unfunaversary/firstclass.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/firstclass.tscn", "res://backgounds/result.tscn", 5, true], ["res://levels/Cutscenes/Honker Railway/forest.tscn", "res://levels/Cutscenes/Honker Railway/lordlytrashcan.tscn", 19, false], ["res://levels/Cutscenes/Honker Railway/lordlytrashcan.tscn", "res://levels/Cutscenes/Honker Railway/railway.tscn", 19, false], ["res://levels/Cutscenes/Honker Railway/railway.tscn", "res://levels/ui/gameplay.tscn", 19, true], ["res://levels/Cutscenes/Troublemaker/buildings.tscn", "res://levels/Cutscenes/Troublemaker/pamela.tscn", 18, false], ["res://levels/Cutscenes/Troublemaker/pamela.tscn", "res://levels/Cutscenes/Troublemaker/kungfu.tscn", 18, false], ["res://levels/Cutscenes/Troublemaker/kungfu.tscn", "res://levels/ui/gameplay.tscn", 6, true], ["res://levels/Cutscenes/Troublemakerp2/Lety.tscn", "res://levels/Cutscenes/Troublemakerp2/Fall.tscn", 18, false], ["res://levels/Cutscenes/Troublemakerp2/Fall.tscn", "res://levels/Cutscenes/Troublemakerp2/midori.tscn", 6, false], ["res://levels/Cutscenes/Troublemakerp2/midori.tscn", "res://levels/ui/gameplay.tscn", 6, true]]
const pcnames = ["Midori Asgardius", "Diana Asgardius", null, "Kimberly Arch", null, null, null, "Pamela Hashimoto", "Lety Hashimoto", "Natasha Dostoyevsky"]
const npcnames = ["Lily", "Railway Girl", null, "Kimberly Arch", null, null, null, null, null, "Natasha Dostoyevsky"]
const pcfaces = [["res://sprites/common/midori/face.png"], ["res://sprites/common/tuna/face.png"], [null], ["res://sprites/common/kimberly/face.png"], [null], [null], [null], ["res://sprites/ceres/pamela/face.png"], ["res://sprites/ceres/lety/face.png"], ["res://sprites/common/natasha/face.png"]]
const hudfaces = [["res://sprites/common/midori/facehud.png"], ["res://sprites/common/tuna/facehud.png"], [null], ["res://sprites/common/kimberly/facehud.png"], [null], [null], [null], ["res://sprites/ceres/pamela/facehud.png"], ["res://sprites/ceres/lety/facehud.png"], ["res://sprites/common/natasha/facehud.png"]]
const npcfaces = ["res://sprites/common/midori/face.png","res://sprites/ceres/railway/face.png", null, "res://sprites/common/kimberly/face.png", null, null, null, null, null, "res://sprites/common/natasha/face.png"]
const basestats = [[800, 200, 52, 12, 136, 25, 800], [1094, 200, 54, 7, 106, 48, 600], [null], [1143, 200, 59, 5, 117, 18, 650], [null], [null], [null], [null], [null], [1026, 200, 87, 7, 105, 49, 115]]
var cstats = [[800, 200, 52, 12, 136, 25, 800], [1094, 200, 54, 7, 106, 48, 600], [null], [1143, 200, 59, 5, 117, 18, 650], [null], [null], [null], [null], [null], [1026, 200, 87, 7, 105, 49, 115]]
var dstats = [[800, 200, 52, 12, 136, 25, 800], [1094, 200, 54, 7, 106, 48, 600], [null], [1143, 200, 59, 5, 117, 18, 650], [null], [null], [null], [null], [null], [1026, 200, 87, 7, 105, 49, 115]]
var mstats = [[null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null]]
var cdialog = []
const places = [[[["res://levels/Ceres/map.tscn", 5, false], [null, null, false]], [["res://levels/Testrooms/bullethell.tscn", 11, true], ["res://levels/Testrooms/lilytest.tscn", 6, false]], [["res://levels/Testrooms/dialogtest.tscn", 19, false], ["res://levels/Testrooms/testspawn.tscn", 2 ,false]]], [null, [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/troublemakers.tscn", 6, true]], [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/troublemakersp2.tscn", 6, true]], null, null, null, null, null, [null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/honkerrailway.tscn", 19, false]], null, null, [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/L20.tscn", 3, true]]]]
var cplace = [0,2,1]
var dplace = [null, null, null]
const pbbullets = ["res://sprites/common/bullet/fireball.tscn", "res://sprites/common/bullet/aero.tscn", null, "res://sprites/common/bullet/arrow.tscn", null, null, null, null, null, "res://sprites/common/bullet/snowflake.tscn"]
const pcspecialities = [1, 2, null, 3, null, null, null, null, null, 0]
const pchars = [["res://sprites/common/midori/sprite.png"], ["res://sprites/common/tuna/sprite.png"], [null], ["res://sprites/common/kimberly/sprite.png"], [null], [null], [null], [null], [null], ["res://sprites/common/natasha/sprite.png"]]
const npchars = ["res://sprites/common/midori/sprite.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/sprite.png"]
var cboss = [null, null, null]
var isboss
var party = [[0,0], [1,0], [9,0], [3,0]]
var sparty = [[null,null], [null,null], [null,null], [null,null]]
const specialities = [2, 0, 3, 1, 5, 4]
var dparty = [[0,0], [1,0], [3,0], [9,0]]
var level = [1,1,1,1,1,1,1,1,1,1]
var dlevel = [1,1,1,1,1,1,1,1,1,1]
var cpchar = 0
var result = [0, 0, 0, 0, 0]
var dificulty = 0
var dcpchar = 0
var mangohud = false
var cspawnarea = [null, null]
var owlocation = [[null, null], [null, null]]
const musictracks = ["res://music/midorinoyume.ogg", "res://music/seahorse.ogg", "res://music/chinesegoat.ogg", "res://music/doyoufeelold.ogg", "res://music/doyiuneedahealer.ogg", "res://music/adayatceres.ogg", "res://music/twintroublemakers.ogg", "res://music/easyquiz.ogg", "res://music/neowave.ogg", "res://music/multivectorsubmarines.ogg", "res://music/halfgeniegirls.ogg", "res://music/rusianmaverickfairy.ogg", "res://music/blacksmithofdestruction.ogg", "res://music/shininglikefireworks.ogg", "res://music/sadtrashcan.ogg", "res://music/akikonotegami.ogg", "res://music/asadcat.ogg", "res://music/lilydesire.ogg", "res://music/scholartrip.ogg", "res://music/quantumice.ogg", "res://music/unreeeal.ogg", "res://music/alsa.ogg", "res://music/silverblue.ogg"]
const sfxtracks = ["res://sfx/braindamage.wav", "res://sfx/gaugefill.wav", "res://sfx/boomboombakudan.wav"]
var debug = false
const release = "R0.3.2-beta"
var sk = false
var gamepad = 0
var quest = [0, 0, 0, 0, 0, 0]
var isresume = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
