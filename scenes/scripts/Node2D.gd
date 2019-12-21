extends Node2D

var health = 4
var coin = 0
var score = 0
var speed = 1
var other_coins
var filepath = "user://coins.txt"
var filepath_score = "user://last_score.txt"
var choose_rocket_path = 'user://used_ship.txt'
var write_num
onready var expl 

var base_rocket = load("res://texture_ui/game/characters/character.png")
var master_rocket = load("res://texture_ui/game/characters/pro_rocket_2.png")
var pro_rocket = load("res://texture_ui/game/characters/master_rockey_3.png")
var gold_rocket = load("res://texture_ui/game/characters/gold_rocket_4.png")
var node_rocket = load("res://texture_ui/game/characters/node_rocket_5.png")
var threed_rocket = load("res://texture_ui/game/characters/3d_rocket_7.png")

func _ready():	
	var choose_rocket = File.new()
	choose_rocket.open(choose_rocket_path,File.READ)
	var rocket = choose_rocket.get_line()
	if rocket == '1':
		$Rocket2/Area2D/character.set_texture(base_rocket)
	if rocket == '2':
		$Rocket2/Area2D/character.set_texture(master_rocket)	
	if rocket == '3':
		$Rocket2/Area2D/character.set_texture(pro_rocket)	
	if rocket == '4':
		$Rocket2/Area2D/character.set_texture(gold_rocket)
	if rocket == '5':
		$Rocket2/Area2D/character.set_texture(node_rocket)
	if rocket == '6':
		$Rocket2/Area2D/character.set_texture(threed_rocket)
func _process(delta):
	score = get_node("Rocket2").get("score")
	$Hud/LabelScore2/LabelScore.text = str(score)  
#	if int(score) % 10 == 0:
#		if float(score) / 10.000:
#			var get_boss = load("res://MenuScenes/Boss_Cryptor.tscn")
#			var cryptor = get_boss.instance()
#			get_node("NodeBoss").add_child(cryptor)
func _on_Area2D_body_entered(area): 
#	file.open(filepath, File.WRITE)
	get_node("ShakeScreen").queue("ScreenShake")
	get_node("ShakeLabel").queue("ShakeHealth")
	$Rocket2/Explosion/AnimationFrames.queue("ExplosionFrames")
	health -= 1
	$Hud/LabelHealth.text = str(health)
	if health <= 0:
		print("U lose")
		get_tree().change_scene("res://MenuScenes/LoseMenu.tscn")
		self.hide()
		var file_r = File.new()
		file_r.open(filepath,File.READ)
		other_coins = file_r.get_line()
		file_r.close()
		write_num = int(other_coins) + int(coin)
		
		var file_w = File.new()
		file_w.open(filepath,File.WRITE)
		file_w.seek_end()
		file_w.store_line(str(write_num))
		file_w.close()
		
		var file_score_w = File.new()
		file_score_w.open(filepath_score,File.WRITE)
		file_score_w.seek_end()
		file_score_w.store_line(str(score))
		file_score_w.close()
#		file.store_var(coin)
#		file.close()

func _on_AreaCoin_area_entered(area):
	get_node("ShakeLabel").queue("Shake")
	$Rocket2/CollisionPolygon2D2/ColorRect.show()
	$Rocket2/CollisionPolygon2D2/AnimationFlicker.queue("Flicker")
	print("+1")
	coin += 1
	$Hud/LabelCoin.text = str(coin)
	$Coin2.hide()
	if int(score) % 4 == 0:
		var new_meteor = load("res://MenuScenes/meteor.tscn")
		var meteor = new_meteor.instance()
		get_node("NodeMeteor").add_child(meteor)                            
	pass
#		new_coin.instance()
#		new_coin.add_child(new_coin)
#func _on_Rocket2_ready():
#    var score_path = $Rocket2
#    get_node("LabelScore").text = str(score_path.score)
#    print(score)





