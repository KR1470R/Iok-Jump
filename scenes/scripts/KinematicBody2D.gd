extends KinematicBody2D
var screenSize = Vector2(0,0)
var rng = RandomNumberGenerator.new()
var BOTTOM = Vector2(0,1)
var speed = 4
onready var ass = get_node("/root/RocketBody")
var boost_cheker = "user://boost_cheker.txt"
var path_rocket = "user://used_ship.txt"
func _physics_process(delta):
	rng.randomize()
	var fr = File.new()
	fr.open(boost_cheker, File.READ)	
	var string = fr.get_line()
	
	var fr2 = File.new()
	fr2.open(path_rocket,File.READ)
	var string_rocket = fr2.get_line()
	
	if int(string_rocket) == 1:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed)
		if string == "True":
			move_and_collide(BOTTOM*speed*1.2)
		elif string == "False":
			move_and_collide(BOTTOM*speed)	
	if int(string_rocket) == 2:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed)
		if string == "True":
			move_and_collide(BOTTOM*speed*1.3)
		elif string == "False":
			move_and_collide(BOTTOM*speed)	
	if int(string_rocket) == 3:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed)
		if string == "True":
			move_and_collide(BOTTOM*speed*1.35)
		elif string == "False":
			move_and_collide(BOTTOM*speed)	
	if int(string_rocket) == 4:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed)
		if string == "True":
			move_and_collide(BOTTOM*speed*1.4)
		elif string == "False":
			move_and_collide(BOTTOM*speed)	
	if int(string_rocket) == 5:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed)
		if string == "True":
			move_and_collide(BOTTOM*speed*1.5)
		elif string == "False":
			move_and_collide(BOTTOM*speed)	
	if int(string_rocket) == 6:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed)
		if string == "True":
			move_and_collide(BOTTOM*speed*1.6)
		elif string == "False":
			move_and_collide(BOTTOM*speed)
#	get_node("AnimationPlayer").queue("New Anim")
	if self.position.y >= 645:
		screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
		var rpos = rng.randf_range(0,screenSize.x-10)
		self.position.x = rpos
		self.position.y = screenSize.y - 300