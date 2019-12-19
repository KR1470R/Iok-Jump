extends Control
var label
var coin = 0
var filepath = "user://coins.txt"
var ships = "user://ships.txt"
var file
var coins
var res
var cina_first = 350
var cina_second = 470
var cina_third = 650
var cina_four = 740
var cina_five = 850
var ships_r
var list = [1,0,0,0,0,0]
var file_w
var file_ships_w
var lst
var texture1 = false

func _ready():
#	OS.get_user_data_dir()
	file_ships_w = File.new()
	file_ships_w.open(ships,File.READ)
	lst = file_ships_w.get_line()

	var file_ships = File.new()
	file_ships.open(ships,File.READ)
	file_ships.close()
	
	var file = File.new()
	file.open(filepath,File.READ)
	coins = file.get_line()
	if coins == '':
		file_w = File.new()
		file_w.open(filepath,File.WRITE)
		file_w.seek_end()
		file_w.store_line(str(0))
		file_w.close()
	file.close()
	coins = int(coins)
func save():
	var file_ws = File.new()
	file_ws.open(ships,File.WRITE)
	file_ws.seek_end()
	file_ws.store_line(str(list))
	file_ws.close()
	
	file_w = File.new()
	file_w.open(filepath,File.WRITE)
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
	
	

