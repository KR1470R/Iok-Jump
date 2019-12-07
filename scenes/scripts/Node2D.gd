extends Node2D
###Comming soon
#var delay = 5
#onready var timer = get_node("Timer")
#func _ready():
##	timer = Timer.new()
#	timer.set_wait_timer(1)
#	timer.start()
##	timer.connect("timeout",self,"on_timeout_complete")
##
##	set_process_input(true)
##	set_process(true)
#
#
#func _on_Timer_timeout():
#	delay -= 1
var health = 4
var coin = 0
var other_coins
var filepath = "user://coins.txt"
var write_num
onready var expl 
func _on_Area2D_body_entered(area):
#	var file = File.new()
#	file.open(filepath, File.WRITE)
#
	get_node("ShakeScreen").queue("ScreenShake")
	get_node("ShakeLabel").queue("ShakeHealth")
	$Rocket2/Explosion/AnimationFrames.queue("ExplosionFrames")
	health -= 1
	$LabelHealth.text = str(health)
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
		
#		file.store_var(coin)
#		file.close()

func _on_AreaCoin_area_entered(area):
	get_node("ShakeLabel").queue("Shake")
#	$Rocket2/CoinShine/AnimationFrames.queue("ShineFrames")
	$Rocket2/CollisionPolygon2D2/ColorRect.show()
	$Rocket2/CollisionPolygon2D2/AnimationFlicker.queue("Flicker")
	
	print("+1")
	coin += 1
	$LabelCoin.text = str(coin)
	$Coin2.hide()
	if coin % 5 == 0:
		var new_meteor = load("res://MenuScenes/meteor.tscn")
		var meteor = new_meteor.instance()
		get_node("Meteors").add_child(meteor)
		

func _on_Area2D_area_entered(area):
	pass # Replace with function body.
