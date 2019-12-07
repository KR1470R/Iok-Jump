extends Node2D
func _physics_process(delta):
	get_node("AnimationPlayer").queue("New Anim Reverse")
	get_node("AnimationPlayer").queue("New Anim")




