extends KinematicBody2D

#var screenSize = Vector2(0,0)
#var rng = RandomNumberGenerator.new()
#var speed = 1
#func _physics_process(delta):
#	rng.randomize()
#	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
#	screenSize.y = get_viewport().get_visible_rect().size.y # Get Width
#	var rpos = rng.randf_range(0,screenSize.x-10)
#
#	self.position.y += 7*speed
#	if self.position.y >= screenSize.y+100:
#		self.position = Vector2(rpos,-50)
#		self.show()
#
