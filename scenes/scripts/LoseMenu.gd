 extends Control
func _on_Play_pressed():
	if get_tree().change_scene("res://MenuScenes/Node2D.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")


func _on_Exit_pressed():
	if get_tree().change_scene("res://MenuScenes/MainMenu.tscn") != OK:
		print ("An unexpected error occured when trying to switch to the Readme scene")
