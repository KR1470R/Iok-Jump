extends Control
var filepath_lastscore = "user://last_score.bin"
var last_score
var filepath_score = "user://score.bin"
var boost_cheker = "user://boost_cheker.bin"
func _ready():
	var fr = File.new()
	fr.open_encrypted_with_pass(boost_cheker,File.WRITE,OS.get_unique_id())
	fr.seek_end()
	fr.store_line(str('False'))
	fr.close()
	
	var file_r = File.new()
	file_r.open_encrypted_with_pass(filepath_lastscore,File.READ,OS.get_unique_id())
	last_score = file_r.get_line()
	file_r.close()
	$Labelscore.text = str(last_score)
	
	var file_r2 = File.new()
	file_r2.open_encrypted_with_pass(filepath_score,File.READ,OS.get_unique_id())
	var all_score = file_r2.get_line()
	file_r2.close()
	if int(last_score) > int(all_score):
		print(true)
		var file_w =File.new()
		file_w.open_encrypted_with_pass(filepath_score,File.WRITE, OS.get_unique_id())
		file_w.seek_end()
		file_w.store_line(str(last_score))
	else:
		print(false)
func _on_Play_pressed():
	if get_tree().change_scene("res://MenuScenes/Node2D.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")


func _on_Restart_pressed():
	get_tree().change_scene("res://MenuScenes/Node2D.tscn")
	
func _on_Exit_pressed():
	if get_tree().change_scene("res://MenuScenes/MainMenu.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")
   
