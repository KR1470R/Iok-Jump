extends Control
var label
var coin = 0

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
	
#func load_coins():
#	var file = File.new()
#	if not file.file_exists(filepath):return
#	file.open(filepath,File.READ)
#	coin = file.get_var()
#	file.close()
#func save_coins():
#	var file = File.new()
#	file.open(filepath, File.WRITE)
#	file.store_var(coin)
#	file.close()
#func set_coin(new_value):
#	coin = new_value
#	$Elements/LabelCoin.text = str(new_value)
#	save_coins()
	

func _on_Rocket_icon_pressed():
	get_node("Elements/AnimationElements").queue("RocketShake")
