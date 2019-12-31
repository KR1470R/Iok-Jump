extends Node2D

var health = 134
var damage = 15
var coin = 0
var score = 0
var speed = 1
var other_coins
var filepath = "user://coins.bin"
var filepath_score = "user://last_score.bin"
var choose_rocket_path = 'user://used_ship.bin'
var write_num
onready var expl 
onready var health_bar = $Hud/HealthProgress

var base_rocket = load("res://texture_ui/game/characters/character.png")
var master_rocket = load("res://texture_ui/game/characters/pro_rocket_2.png")
var pro_rocket = load("res://texture_ui/game/characters/master_rockey_3.png")
var gold_rocket = load("res://texture_ui/game/characters/gold_rocket_4.png")
var node_rocket = load("res://texture_ui/game/characters/node_rocket_5.png")
var threed_rocket = load("res://texture_ui/game/characters/3d_rocket_7.png")

var boost_cheker = 'user://boost_cheker.bin'


export (Color) var green_color = Color.green
export (Color) var yellow_color = Color.yellow
export (Color) var red_color = Color.red

func _ready():
	health_bar.value = health
	var choose_rocket = File.new()
	choose_rocket.open_encrypted_with_pass(choose_rocket_path,File.READ,OS.get_unique_id())
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
	if health_bar.value <= 30:
		get_node("Hud/HealthProgress/AnimationPlayer").queue('New Anim')
func _on_Area2D_body_entered(area): 
#	file.open(filepath, File.WRITE)
	health = health - damage
	health_bar.value = health
	get_node("ShakeScreen").queue("ScreenShake")
	$Rocket2/Explosion/AnimationFrames.queue("ExplosionFrames")
	get_node("Hud/HealthProgress/AnimationPlayer").queue("New Anim (2)")
	if health_bar.value <= 70 and health_bar.value >= 51:
		health_bar.tint_progress = yellow_color
	elif health_bar.value <= 50:
		health_bar.tint_progress = red_color
	elif health_bar.value >= 71:
		health_bar.tint_progress = green_color
	if health <= 0:
		print("U lose")
		
		$Hud/LabelScore2.hide()
		$Hud/Gamepad.hide()
		
		$PauseCanvas/LoseMenu/ColorRect.show()
		$PauseCanvas/LoseMenu/Label.show()
		$PauseCanvas/LoseMenu/VBoxContainer.show()
		$PauseCanvas/LoseMenu/AnimationPlayer.queue("New Anim")
		
		Engine.time_scale = 0.3
		get_tree().paused = true
		
		var file_r = File.new()
		file_r.open_encrypted_with_pass(filepath,File.READ,OS.get_unique_id())
		other_coins = file_r.get_line()
		file_r.close()
		write_num = int(other_coins) + int(coin)

		var file_w = File.new()
		file_w.open_encrypted_with_pass(filepath,File.WRITE,OS.get_unique_id())
		file_w.seek_end()
		file_w.store_line(str(write_num))
		file_w.close()
			
		var file_score_w = File.new()
		file_score_w.open_encrypted_with_pass(filepath_score,File.WRITE,OS.get_unique_id())
		file_score_w.seek_end()
		file_score_w.store_line(str(score))
		file_score_w.close()
		
		
		var all_score = File.new()
		all_score.open_encrypted_with_pass('user://score.bin', File.READ, OS.get_unique_id())
		var string = all_score.get_line()
		all_score.close()
		if score>float(string):
			all_score = File.new()
			all_score.open_encrypted_with_pass('user://score.bin',File.WRITE,OS.get_unique_id())
			all_score.seek_end()
			all_score.store_line(str(score))
			all_score.close()
		else:
			pass
	#		file.store_var(coin)
	#		file.close

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


func _on_Restart_pressed():
	get_tree().change_scene("res://MenuScenes/Node2D.tscn")
	Engine.time_scale = 1
	get_tree().paused = false

func _on_Exit_pressed():
	get_tree().change_scene("res://MenuScenes/MainMenu.tscn")
	Engine.time_scale = 1
	get_tree().paused = false
