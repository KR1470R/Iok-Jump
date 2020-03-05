extends Control
var filepath = "user://coins.bin"
var ships = "user://ships.bin"
var coins
var res
var list = [1,0,0,0,0,0]
var file_w
var file_ships_w
var lst


func _ready():
	$Background/Main/Hud/LabelScore2.hide()
	$Background/Main/Coin2.hide()
	$Background/Main/Hud.get_child(0).hide()
	$Background/Main/Meteors.hide()
	$Background/Main/UFO.hide()
	$Background/Main/Hud/HealthProgress.hide()
	$Background/Main/Hud/LabelCoin.hide()
	
#	OS.get_user_data_dir()
	file_ships_w = File.new()
	file_ships_w.open_encrypted_with_pass(ships,File.READ,OS.get_unique_id())
	lst = file_ships_w.get_line()
	
	var file_ships = File.new()
	file_ships.open_encrypted_with_pass(ships,File.READ,OS.get_unique_id())
	file_ships.close()
	
	var file = File.new()
	file.open_encrypted_with_pass(filepath,File.READ,OS.get_unique_id())
	coins = file.get_line()
	if coins == '':
		file_w = File.new()
		file_w.open_encrypted_with_pass(filepath,File.WRITE,OS.get_unique_id())
		file_w.seek_end()
		file_w.store_line(str(0))
		file_w.close()
	file.close()
	coins = int(coins)
	
func save():
	var file_ws = File.new()
	file_ws.open_encrypted_with_pass(ships,File.WRITE,OS.get_unique_id())
	file_ws.seek_end()
	file_ws.store_line(str(list))
	file_ws.close()
	
	file_w = File.new()
	file_w.open_encrypted_with_pass(filepath,File.WRITE,OS.get_unique_id())
	file_w.seek_end()
	file_w.store_line(str(res))
	file_w.close()
#func _ready():
#	load_coins()
func _on_Exit_pressed():
	get_tree().quit()

func _on_Shop_pressed():
	get_tree().change_scene("res://MenuScenes/ShopMenu.tscn")

func _on_HomeButton_pressed():
	get_tree().change_scene("res://MenuScenes/MainMenu.tscn")

func _on_Play_pressed():
	get_tree().change_scene("res://MenuScenes/Node2D.tscn")
func _on_Rocket_icon_pressed():
	get_node("Elements/heart-logo-png-17").show()
	get_node("Elements/heart-logo-png-18").show()
	get_node("Elements/heart-logo-png-19").show()
	get_node("Elements/AnimationElements").queue("RocketShake")
	if get_node("Elements/AnimationElements").is_playing():
		print(true)
		get_node("Elements/heart-logo-png-17").show()
		get_node("Elements/heart-logo-png-18").show()
		get_node("Elements/heart-logo-png-19").show()
	

func _on_Home_pressed():
	get_tree().change_scene("res://MenuScenes/MainMenu.tscn")
