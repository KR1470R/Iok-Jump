extends KinematicBody2D
var screenSize = Vector2(0,0)
var rng = RandomNumberGenerator.new()
var BOTTOM = Vector2(0,1)
var speed = 4
var boost_cheker = "user://boost_cheker.bin"
var path_rocket = "user://used_ship.bin"
func _physics_process(delta):
	rng.randomize()
## boost cheker file get
	var fr = File.new()
	var check_fr = fr.file_exists(boost_cheker)
	if check_fr ==  true:
		fr.open_encrypted_with_pass(boost_cheker, File.READ, OS.get_unique_id())	
	else:
		fr.open_encrypted_with_pass(boost_cheker, File.WRITE, OS.get_unique_id())
		fr.seek_end()
		fr.store_line(str(true))
	var string = fr.get_line()
	
## rocket id get file
	var fr2 = File.new()
	var cheker_fr2 = fr.file_exists(path_rocket)
	if cheker_fr2 == true:
		fr2.open_encrypted_with_pass(path_rocket,File.READ, OS.get_unique_id())
	else:
		fr2.open_encrypted_with_pass(path_rocket,File.WRITE, OS.get_unique_id())
		fr2.seek_end()
		fr2.store_line(str(1))
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
	if self.position.y >= 950:
		screenSize.x = get_viewport().get_visible_rect().size.x # Get Width
		var rpos = rng.randf_range(0,screenSize.x-10)
		self.position.x = rpos
		self.position.y = screenSize.y - 300