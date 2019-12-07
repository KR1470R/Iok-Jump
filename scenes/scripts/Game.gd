extends Node2D
var health = 4

func _on_RocketArea_body_entered(body):
	health -= 1
	$LabelHealth.text = str(health)
	if health <= 0:
		print("U lose")
#		get_tree().change_scene("res://menu/LoseMenu.tscn")
		self.hide()
