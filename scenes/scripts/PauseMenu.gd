extends Control
func _ready():
	self.hide()
func _on_Exit_pressed():
	get_tree().paused = false 
	get_tree().change_scene("res://MenuScenes/MainMenu.tscn")

func _on_Pause_pressed():
	get_node("BlurTransition").queue("Transition")
	self.show()
	get_tree().paused = true

func _on_Resume_pressed():
	self.hide()
	get_tree().paused = false
