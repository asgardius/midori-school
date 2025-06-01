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
var charswitch = 0
const pcharfull = [["res://sprites/common/midori/fullbody.png"], ["res://sprites/common/tuna/fullbody.png"], [null], ["res://sprites/common/kimberly/fullbody.png"], ["res://sprites/common/chowchow/fullbody.png"], ["res://sprites/common/tanaka/fullbody.png"], ["res://sprites/common/foxian/fullbody.png"], ["res://sprites/ceres/pamela/fullbody.png"], ["res://sprites/ceres/lety/fullbody.png"], ["res://sprites/common/natasha/fullbody.png"], ["res://sprites/common/principal/fullbody.png"], ["res://sprites/common/anonymous/fullbody.png"]]
const cutscenes = [["res://levels/Cutscenes/opening/aboutkaizo.tscn", "res://levels/Cutscenes/opening/midorihello.tscn", 18, false], ["res://levels/Cutscenes/opening/midorihello.tscn", "res://levels/Cutscenes/opening/fearlessmidori.tscn", 18, false], ["res://levels/Cutscenes/opening/fearlessmidori.tscn", "res://levels/Cutscenes/opening/midoriwaterfall.tscn", 0, false], ["res://levels/Cutscenes/opening/midoriwaterfall.tscn", "res://levels/Cutscenes/opening/midorireading.tscn", 0, false], ["res://levels/Cutscenes/opening/midorireading.tscn", "res://levels/Cutscenes/opening/boomboomtorofi.tscn", 0, false], ["res://levels/Cutscenes/opening/boomboomtorofi.tscn", "res://levels/ui/gameplay.tscn", 0, true], ["res://levels/Cutscenes/unfunaversary/punishment.tscn", "res://levels/Cutscenes/unfunaversary/sadness.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/sadness.tscn", "res://levels/Cutscenes/unfunaversary/r3.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/r3.tscn", "res://levels/Cutscenes/unfunaversary/firstclass.tscn", 1, false], ["res://levels/Cutscenes/unfunaversary/firstclass.tscn", "res://backgounds/result.tscn", 5, true], ["res://levels/Cutscenes/Honker Railway/forest.tscn", "res://levels/Cutscenes/Honker Railway/lordlytrashcan.tscn", 19, false], ["res://levels/Cutscenes/Honker Railway/lordlytrashcan.tscn", "res://levels/Cutscenes/Honker Railway/railway.tscn", 19, false], ["res://levels/Cutscenes/Honker Railway/railway.tscn", "res://levels/ui/gameplay.tscn", 19, true], ["res://levels/Cutscenes/Troublemaker/buildings.tscn", "res://levels/Cutscenes/Troublemaker/pamela.tscn", 18, false], ["res://levels/Cutscenes/Troublemaker/pamela.tscn", "res://levels/Cutscenes/Troublemaker/kungfu.tscn", 18, false], ["res://levels/Cutscenes/Troublemaker/kungfu.tscn", "res://levels/ui/gameplay.tscn", 6, true], ["res://levels/Cutscenes/Troublemakerp2/Lety.tscn", "res://levels/Cutscenes/Troublemakerp2/Fall.tscn", 18, false], ["res://levels/Cutscenes/Troublemakerp2/Fall.tscn", "res://levels/Cutscenes/Troublemakerp2/midori.tscn", 6, false], ["res://levels/Cutscenes/Troublemakerp2/midori.tscn", "res://levels/ui/gameplay.tscn", 6, true], ["res://levels/Cutscenes/Endoffirstday/Destroyedhouse.tscn", "res://levels/Cutscenes/Endoffirstday/Returntohome.tscn", 1, false], ["res://levels/Cutscenes/Endoffirstday/Returntohome.tscn", "res://levels/Cutscenes/Endoffirstday/Timetosleep.tscn", 1, false], ["res://levels/Cutscenes/Endoffirstday/Timetosleep.tscn", "res://backgounds/result.tscn", 1, true], ["res://levels/Cutscenes/secondchallenge/Treasure.tscn", "res://levels/Cutscenes/secondchallenge/Alone.tscn", 19, false], ["res://levels/Cutscenes/secondchallenge/Alone.tscn", "res://levels/Cutscenes/secondchallenge/Knives.tscn", 19, false], ["res://levels/Cutscenes/secondchallenge/Knives.tscn", "res://levels/ui/gameplay.tscn", 3, true], ["res://levels/Cutscenes/smugface/Smugface.tscn", "res://levels/Cutscenes/smugface/Following.tscn", 3, false], ["res://levels/Cutscenes/smugface/Following.tscn", "res://levels/Cutscenes/smugface/Alice.tscn", 3, false], ["res://levels/Cutscenes/smugface/Alice.tscn", "res://backgounds/result.tscn", 3, true]]
const pcnames = ["Midori Asgardius", "Diana Asgardius", null, "Kimberly Arch", "Hu Wei", "Gurukōsu Tanaka", "Momo Tanaka", "Pamela Hashimoto", "Lety Hashimoto", "Natasha Dostoyevsky", "Page Asgardius", "Emily Asgardius"]
const npcnames = ["Lily", "Railway Girl", null, "Kimberly Arch", null, null, null, null, null, "Natasha Dostoyevsky"]
const pcfaces = [["res://sprites/common/midori/face.png"], ["res://sprites/common/tuna/face.png"], [null], ["res://sprites/common/kimberly/face.png"], ["res://sprites/common/chowchow/face.png"], ["res://sprites/common/tanaka/face.png"], ["res://sprites/common/foxian/face.png"], ["res://sprites/ceres/pamela/face.png"], ["res://sprites/ceres/lety/face.png"], ["res://sprites/common/natasha/face.png"], ["res://sprites/common/principal/face.png"], ["res://sprites/common/anonymous/face.png"]]
const hudfaces = [["res://sprites/common/midori/facehud.png"], ["res://sprites/common/tuna/facehud.png"], [null], ["res://sprites/common/kimberly/facehud.png"], ["res://sprites/common/chowchow/facehud.png"], ["res://sprites/common/tanaka/facehud.png"], ["res://sprites/common/foxian/facehud.png"], ["res://sprites/ceres/pamela/facehud.png"], ["res://sprites/ceres/lety/facehud.png"], ["res://sprites/common/natasha/facehud.png"], ["res://sprites/common/principal/facehud.png"], ["res://sprites/common/anonymous/facehud.png"]]
const npcfaces = ["res://sprites/common/midori/face.png","res://sprites/ceres/railway/face.png", null, "res://sprites/common/kimberly/face.png", null, null, null, null, null, "res://sprites/common/natasha/face.png"]
const basestats = [[2077, 200, 63, 12, 136, 25, 800], [2811, 200, 54, 7, 106, 48, 600], [null], [2967, 200, 59, 5, 117, 18, 650], [2061, 200, 140, 15, 104, 39, 600], [2095, 200, 115, 15, 104, 36, 600], [2525, 200, 72, 15, 104, 54, 600], [2077, 200, 72, 12, 136, 25, 700], [2077, 200, 65, 12, 136, 25, 750], [1266, 200, 87, 27, 105, 49, 115]]
var cstats = [[2077, 200, 63, 12, 136, 25, 800], [2811, 200, 54, 7, 106, 48, 600], [null], [2967, 200, 59, 5, 117, 18, 650], [2061, 200, 140, 15, 104, 39, 600], [2095, 200, 115, 15, 104, 36, 600], [2525, 200, 72, 15, 104, 54, 600], [2077, 200, 75, 12, 136, 25, 700], [2077, 200, 65, 12, 136, 25, 750], [1266, 200, 87, 27, 105, 49, 115]]
var dstats = [[2077, 200, 63, 12, 136, 25, 800], [2811, 200, 54, 7, 106, 48, 600], [null], [2967, 200, 59, 5, 117, 18, 650], [2061, 200, 140, 15, 104, 39, 600], [2095, 200, 115, 15, 104, 36, 600], [2525, 200, 72, 15, 104, 54, 600], [2077, 200, 75, 12, 136, 25, 700], [2077, 200, 65, 12, 136, 25, 750], [1266, 200, 87, 27, 105, 49, 115]]
var mstats = [[null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null], [null, null, null, null, null, null, null]]
var cdialog = []
const places = [[[["res://levels/Ceres/map.tscn", 5, false], [null, null, false]], [["res://levels/Testrooms/bullethell.tscn", 11, true], ["res://levels/Testrooms/lilytest.tscn", 6, false]], [["res://levels/Testrooms/dialogtest.tscn", 19, false], ["res://levels/Testrooms/testspawn.tscn", 2 ,false]]], [null, [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/troublemakers.tscn", 6, true]], [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/troublemakersp2.tscn", 6, true]], null, [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/huwei.tscn", 6, true]], [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/dust.tscn", 6, true]], null, null, [null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/honkerrailway.tscn", 19, false], null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/yourhome.tscn", 1, false]], null, null, [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, ["res://levels/Ceres/L20.tscn", 3, true]]]]
var cplace = [0,2,1]
var dplace = [null, null, null]
const pbbullets = ["res://sprites/common/bullet/fireball.tscn", "res://sprites/common/bullet/aero.tscn", null, "res://sprites/common/bullet/arrow.tscn", "res://sprites/common/bullet/jian.tscn", "res://sprites/common/bullet/lynx.tscn", "res://sprites/common/bullet/sk.tscn", "res://sprites/common/bullet/tnt.tscn", "res://sprites/common/bullet/fireball.tscn", "res://sprites/common/bullet/snowflake.tscn"]
const pcspecialities = [1, 2, null, 3, 3, 4, 5, 1, 1, 0, 1, 1]
const pchars = [["res://sprites/common/midori/sprite.png"], ["res://sprites/common/tuna/sprite.png"], [null], ["res://sprites/common/kimberly/sprite.png"], ["res://sprites/common/chowchow/sprite.png"], ["res://sprites/common/tanaka/sprite.png"], ["res://sprites/common/foxian/sprite.png"], ["res://sprites/ceres/pamela/sprite.png"], ["res://sprites/ceres/lety/sprite.png"], ["res://sprites/common/natasha/sprite.png"], ["res://sprites/common/principal/sprite.png"], ["res://sprites/common/anonymous/sprite.png"]]
const npchars = ["res://sprites/common/midori/sprite.png", null, null, null, null, null, null, null, null, "res://sprites/common/natasha/sprite.png"]
var cboss = [null, null, null]
var isboss
var party = [[0,0], [null,null], [null,null], [null,null]]
var sparty = [[null,null], [null,null], [null,null], [null,null]]
const specialities = [2, 0, 3, 1, 5, 4]
var dparty = [[0,0], [4,0], [5,0], [6,0]]
var level = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
var dlevel = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
var cpchar = 0
var result = [0, 0, 0, 0, 0]
var dificulty = 0
var dcpchar = 0
var mangohud = false
var cspawnarea = [null, null]
var owlocation = [[null, null], [null, null]]
#const musictracks = ["res://music/midorinoyume.ogg", "res://music/seahorse.ogg", "res://music/chinesegoat.ogg", "res://music/doyoufeelold.ogg", "res://music/doyiuneedahealer.ogg", "res://music/adayatceres.ogg", "res://music/twintroublemakers.ogg", "res://music/easyquiz.ogg", "res://music/neowave.ogg", "res://music/multivectorsubmarines.ogg", "res://music/halfgeniegirls.ogg", "res://music/rusianmaverickfairy.ogg", "res://music/blacksmithofdestruction.ogg", "res://music/shininglikefireworks.ogg", "res://music/sadtrashcan.ogg", "res://music/akikonotegami.ogg", "res://music/asadcat.ogg", "res://music/lilydesire.ogg", "res://music/scholartrip.ogg", "res://music/quantumice.ogg", "res://music/unreeeal.ogg", "res://music/alsa.ogg", "res://music/silverblue.ogg"]
const musictrackc = ["res://music/c/reloaded.ogg", "res://music/c/jellyfish.ogg", "res://music/c/getabrain.ogg", "res://music/c/oskars.ogg", "res://music/c/extralife.ogg", "res://music/c/layers.ogg", "res://music/c/caramel.ogg", "res://music/c/edzesss.ogg", "res://music/c/shakeshark.ogg", "res://music/c/zubmarine.ogg", "res://music/c/crammin.ogg", "res://music/c/func.ogg", "res://music/c/kaveh.ogg", "res://music/c/rock.ogg", "res://music/c/milkyway.ogg", "res://music/c/sweetener.ogg", "res://music/c/tooold.ogg", "res://music/c/portello.ogg", "res://music/c/songbirds.ogg", "res://music/c/gotanda.ogg", "res://music/c/caramel.ogg", "res://music/c/alsa.ogg", "res://music/c/eternity.ogg"]
const musictrackfl = ["res://music/fl/reloaded.ogg", "res://music/fl/jellyfish.ogg", "res://music/fl/getabrain.ogg", "res://music/fl/oskars.ogg", "res://music/fl/extralife.ogg", "res://music/fl/layers.ogg", "res://music/fl/caramel.ogg", "res://music/fl/edzesss.ogg", "res://music/fl/shakeshark.ogg", "res://music/fl/zubmarine.ogg", "res://music/fl/crammin.ogg", "res://music/fl/func.ogg", "res://music/fl/kaveh.ogg", "res://music/fl/rock.ogg", "res://music/fl/milkyway.ogg", "res://music/fl/sweetener.ogg", "res://music/fl/tooold.ogg", "res://music/fl/portello.ogg", "res://music/fl/songbirds.ogg", "res://music/fl/gotanda.ogg", "res://music/fl/caramel.ogg", "res://music/fl/alsa.ogg", "res://music/fl/eternity.ogg"]
const musictrackfr = ["res://music/fr/reloaded.ogg", "res://music/fr/jellyfish.ogg", "res://music/fr/getabrain.ogg", "res://music/fr/oskars.ogg", "res://music/fr/extralife.ogg", "res://music/fr/layers.ogg", "res://music/fr/caramel.ogg", "res://music/fr/edzesss.ogg", "res://music/fr/shakeshark.ogg", "res://music/fr/zubmarine.ogg", "res://music/fr/crammin.ogg", "res://music/fr/func.ogg", "res://music/fr/kaveh.ogg", "res://music/fr/rock.ogg", "res://music/fr/milkyway.ogg", "res://music/fr/sweetener.ogg", "res://music/fr/tooold.ogg", "res://music/fr/portello.ogg", "res://music/fr/songbirds.ogg", "res://music/fr/gotanda.ogg", "res://music/fr/caramel.ogg", "res://music/fr/alsa.ogg", "res://music/fr/eternity.ogg"]
const musictrackrl = ["res://music/rl/reloaded.ogg", "res://music/rl/jellyfish.ogg", "res://music/rl/getabrain.ogg", "res://music/rl/oskars.ogg", "res://music/rl/extralife.ogg", "res://music/rl/layers.ogg", "res://music/rl/caramel.ogg", "res://music/rl/edzesss.ogg", "res://music/rl/shakeshark.ogg", "res://music/rl/zubmarine.ogg", "res://music/rl/crammin.ogg", "res://music/rl/func.ogg", "res://music/rl/kaveh.ogg", "res://music/rl/rock.ogg", "res://music/rl/milkyway.ogg", "res://music/rl/sweetener.ogg", "res://music/rl/tooold.ogg", "res://music/rl/portello.ogg", "res://music/rl/songbirds.ogg", "res://music/rl/gotanda.ogg", "res://music/rl/caramel.ogg", "res://music/rl/alsa.ogg", "res://music/rl/eternity.ogg"]
const musictrackrr = ["res://music/rr/reloaded.ogg", "res://music/rr/jellyfish.ogg", "res://music/rr/getabrain.ogg", "res://music/rr/oskars.ogg", "res://music/rr/extralife.ogg", "res://music/rr/layers.ogg", "res://music/rr/caramel.ogg", "res://music/rr/edzesss.ogg", "res://music/rr/shakeshark.ogg", "res://music/rr/zubmarine.ogg", "res://music/rr/crammin.ogg", "res://music/rr/func.ogg", "res://music/rr/kaveh.ogg", "res://music/rr/rock.ogg", "res://music/rr/milkyway.ogg", "res://music/rr/sweetener.ogg", "res://music/rr/tooold.ogg", "res://music/rr/portello.ogg", "res://music/rr/songbirds.ogg", "res://music/rr/gotanda.ogg", "res://music/rr/caramel.ogg", "res://music/rr/alsa.ogg", "res://music/rr/eternity.ogg"]
const sfxtracks = ["res://sfx/braindamage.wav", "res://sfx/gaugefill.wav", "res://sfx/boomboombakudan.wav"]
var debug = false
const release = "R0.3.10-beta"
var sk = false
var gamepad = 0
var quest = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var isresume = false
var xm = 0
var ym = 0
var spboost = 0
var defeats = 0
var challenges = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var gold = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
