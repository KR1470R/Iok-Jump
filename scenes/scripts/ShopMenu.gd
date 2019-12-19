extends Control
var label
var coin = 0
var filepath = "user://coins.txt"
var ships = "user://ships.txt"
var used_ship = "user://used_ship.txt"
var file
var coins = 0
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
var write_ship2
var file_used_ship
var for_read_use_ship
var ship_condition
func _ready():
#	OS.get_user_data_dir()
	## Ship File
	
	file_ships_w = File.new()
	file_ships_w.open(ships,File.READ)
	lst = file_ships_w.get_line()
	if lst == '':
		write_ship2 = File.new()
		write_ship2.open(ships,File.WRITE)
		write_ship2.seek_end()
		write_ship2.store_line(str(list))
		write_ship2.close()		
	else:
		pass
		
	for_read_use_ship = File.new()
	for_read_use_ship.open(used_ship,File.READ)
	ship_condition = for_read_use_ship.get_line()
	print(ship_condition)
	
		
	## Condition for ships buttons
	if int(lst[4]) == 1:
		if ship_condition == '2':
			print('test')
			$ScrollContainer/VBoxContainer/Pro_Rocket/BuyButton.set_text('Used')
		else:
			$ScrollContainer/VBoxContainer/Pro_Rocket/BuyButton.set_text('Use')
	else:
		$ScrollContainer/VBoxContainer/Pro_Rocket/BuyButton.set_text('350$')	
		
	if int(lst[7]) == 1:
		if ship_condition == '3':
			print('test')
			$ScrollContainer/VBoxContainer/Master_Rocket/BuyButton3.set_text('Used')
		else:
			$ScrollContainer/VBoxContainer/Master_Rocket/BuyButton3.set_text('Use')
	else:
		$ScrollContainer/VBoxContainer/Master_Rocket/BuyButton3.set_text('470$')	
		
	if int(lst[10]) == 1:
		if ship_condition == '4':
			print('test')
			$ScrollContainer/VBoxContainer/Gold_Rocket/BuyButton4.set_text('Used')
		else:
			$ScrollContainer/VBoxContainer/Gold_Rocket/BuyButton4.set_text('Use')
	else:
		$ScrollContainer/VBoxContainer/Gold_Rocket/BuyButton4.set_text('550$')
	###############
	## Coin Files 
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
	################
func _on_HomeButton_pressed():
	get_tree().change_scene("res://MenuScenes/MainMenu.tscn")	
	
## save all there
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
## buttons
func _on_BuyButton_pressed():
	var text = $ScrollContainer/VBoxContainer/Pro_Rocket/BuyButton.get_text()
	if text == 'Used':
		print('I used it')
	else:
		if text == 'Use':
			print(true)
			file_used_ship = File.new()
			file_used_ship.open(used_ship,File.WRITE)
			file_used_ship.seek_end()
			file_used_ship.store_line(str(2))
			$ScrollContainer/VBoxContainer/Pro_Rocket/BuyButton.set_text('Used')
		else:
			if coins >= 350:
				print(true)
				$ScrollContainer/VBoxContainer/Pro_Rocket/BuyButton.set_text('Use')
				res = int(coins) - int(cina_first)
				$Elements/LabelCoin.text = str(res)
				list.remove(1)
				list.insert(1,1)
				save()
				print(list)
			else:
				$CanvasNotMoney/not_enought_money.show()
				$CanvasNotMoney/AnimationPlayer.play("New Anim")

func _on_BuyButton3_pressed():
	var text = $ScrollContainer/VBoxContainer/Master_Rocket/BuyButton3.get_text()
	if text == 'Used':
		print('I used it')
	else:
		if text == 'Use':
			print(true)
			file_used_ship = File.new()
			file_used_ship.open(used_ship,File.WRITE)
			file_used_ship.seek_end()
			file_used_ship.store_line(str(3))
			$ScrollContainer/VBoxContainer/Master_Rocket/BuyButton3.set_text('Used')
		else:
			if coins >= 470:
				print(true)
				$ScrollContainer/VBoxContainer/Master_Rocket/BuyButton3.set_text('Use')
				res = int(coins) - int(cina_first)
				$Elements/LabelCoin.text = str(res)
				list.remove(1)
				list.insert(2,1)
				save()
				print(list)
			else:
				$CanvasNotMoney/not_enought_money.show()
				$CanvasNotMoney/AnimationPlayer.play("New Anim")


func _on_BuyButton4_pressed():
	var text = $ScrollContainer/VBoxContainer/Gold_Rocket/BuyButton4.get_text()
	if text == 'Used':
		print('I used it')
	else:
		if text == 'Use':
			print(true)
			file_used_ship = File.new()
			file_used_ship.open(used_ship,File.WRITE)
			file_used_ship.seek_end()
			file_used_ship.store_line(str(4))
			$ScrollContainer/VBoxContainer/Gold_Rocket/BuyButton4.set_text('Used')
		else:
			if coins >= 550:
				print(true)
				$ScrollContainer/VBoxContainer/Gold_Rocket/BuyButton4.set_text('Use')
				res = int(coins) - int(cina_first)
				$Elements/LabelCoin.text = str(res)
				list.remove(3)
				list.insert(3,1)
				save()
				print(list)
			else:
				$CanvasNotMoney/not_enought_money.show()
				$CanvasNotMoney/AnimationPlayer.play("New Anim")
