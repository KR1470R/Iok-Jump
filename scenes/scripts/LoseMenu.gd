extends Control
var filepath_lastscore = "user://last_score.txt"
var last_score
var filepath_score = "user://score.txt"
func _ready():
	var file_r = File.new()
	file_r.open(filepath_lastscore,File.READ)
	last_score = file_r.get_line()
	file_r.close()
	$Labelscore.text = str(last_score)
	
	var file_r2 = File.new()
	file_r2.open(filepath_score,File.READ)
	var all_score = file_r2.get_line()
	file_r2.close()
	if int(last_score) > int(all_score):
		print(true)
		var file_w =File.new()
		file_w.open(filepath_score,File.WRITE)
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
   
