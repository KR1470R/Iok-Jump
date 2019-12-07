extends Node2D
var screenSize = Vector2(0,0)
var rng = RandomNumberGenerator.new()
func _physics_process(delta):
	rng.randomize()
	get_node("AnimationPlayer").queue("New Anim")
	if $KinematicBody2D/Shape1.position.y >= 645 and $KinematicBody2D/AnimatedSprite.position.y >= 645:
		screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
		var rpos = rng.randf_range(0,screenSize.x-10)
		$KinematicBody2D.position.x = rpos
	