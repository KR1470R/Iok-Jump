extends KinematicBody2D

var screenSize = Vector2(0,0)
var rng = RandomNumberGenerator.new()
var speed = 1
var boost_cheker = "user://boost_cheker.bin"
var path_rocket = "user://used_ship.bin"

var BOTTOM = Vector2(0,1)
func _physics_process(delta):
	rng.randomize()
	
	var fr = File.new()
	fr.open_encrypted_with_pass(boost_cheker,File.READ,OS.get_unique_id())
	var string = fr.get_line()
	
	var fr2 = File.new()
	fr2.open_encrypted_with_pass(path_rocket,File.READ,OS.get_unique_id())
	var string_rocket = fr2.get_line()
	
	screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
	screenSize.y = get_viewport().get_visible_rect().size.y # Get Width
	var rpos = rng.randf_range(0,screenSize.x-10)

	if int(string_rocket) == 1:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed*4.7)
		if string == "True":
			move_and_collide(BOTTOM*speed*5)
		elif string == "False":
			move_and_collide(BOTTOM*speed*5)
	if int(string_rocket) == 2:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed*4.8)
		if string == "True":
			move_and_collide(BOTTOM*speed*5)
		elif string == "False":
			move_and_collide(BOTTOM*speed*4.8)
	if int(string_rocket) == 3:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed*4.85)
		if string == "True":
			move_and_collide(BOTTOM*speed*5)
		elif string == "False":
			move_and_collide(BOTTOM*speed*4.85)
	if int(string_rocket) == 4:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed*4.9)
		if string == "True":
			move_and_collide(BOTTOM*speed*5)
		elif string == "False":
			move_and_collide(BOTTOM*speed*4.9)
	if int(string_rocket) == 5:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed*5)
		if string == "True":
			move_and_collide(BOTTOM*speed*5)
		elif string == "False":
			move_and_collide(BOTTOM*speed*5)
	if int(string_rocket) == 6:
		if self.position.y != get_viewport().size.y - 50:
			move_and_collide(BOTTOM*speed*5)
		if string == "True":
			move_and_collide(BOTTOM*speed*6)
		elif string == "False":
			move_and_collide(BOTTOM*speed*5)
	if self.position.y >= screenSize.y+100:
		self.position = Vector2(rpos,-50)
		self.show()

