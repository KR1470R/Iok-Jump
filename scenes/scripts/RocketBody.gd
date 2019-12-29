extends KinematicBody2D
var speed = 2
var score = 0
var TOP = Vector2(0, -1)
var BOTTOM = Vector2(0, 1)
var LEFT = Vector2(-1, 0)
var RIGHT = Vector2(1, 0)

var speed_right_left = 10
var screenSize = Vector2(0,0)

func _ready():
    var centerX = screenSize.x / 2 
    var centerY = screenSize.y / 2
var touch_left = false 
var touch_right = false 
var touch_boost = false 
var touch_down = false 
var choose_rocket_path = 'user://used_ship.bin'
var boost_cheker = "user://boost_cheker.bin"
func _physics_process(delta):
    var choose_rocket = File.new()
    choose_rocket.open_encrypted_with_pass(choose_rocket_path,File.READ,OS.get_unique_id())
    var rocket = choose_rocket.get_line()
    if self.position.y != get_viewport().size.y - 50:
        move_and_collide(BOTTOM*4)
        if rocket == '1':
           score += 0.001
        if rocket == '2':
           score += 0.010
        if rocket == '3':
            score += 0.015
        if rocket == '4':
            score += 0.017
        if rocket == '5':
            score += 0.020
        if rocket == '6':
            score += 0.025
    if Input.is_action_pressed("ui_down") or touch_down:
        move_and_collide(BOTTOM * speed)
        
    if Input.is_action_pressed("ui_left") or touch_left:
        move_and_collide(LEFT * speed_right_left) 
#        rotation-=1*delta
    if Input.is_action_pressed("ui_right") or touch_right:
        move_and_collide(RIGHT * speed_right_left)
#        rotation+=1*delta
    if Input.is_action_pressed("ui_accept") or touch_boost:
        move_and_collide(TOP * 5)
        if rocket == '1':
           score += 0.010
        if rocket == '2':
           score += 0.013        
        if rocket == '3':
           score += 0.016        
        if rocket == '4':
           score += 0.020        
        if rocket == '5':
           score += 0.023        
        if rocket == '6':
           score += 0.026
    var wx = OS.get_real_window_size().x
    var wy = OS.get_real_window_size().y
    if self.position.y >= wy or self.position.y <= -wy:
        self.position = Vector2(200,-100)
    if self.position.x >= wx+100 or self.position.x <= -wx:
        self.position = Vector2(200,-100)

#    if self.position.y >= 300:
#        self.position = Vector2(200,-100)
#    if self.position.y < -320:
#        self.position = Vector2(200,-100)
    pass
	
func _on_Left_pressed():
	touch_left = true

func _on_Right_pressed():
	touch_right = true


func _on_Boost_pressed():
	var f = File.new()
	f.open_encrypted_with_pass(boost_cheker,File.WRITE, OS.get_unique_id())
	f.seek_end()
	f.store_line(str(true))
	touch_boost = true


func _on_Left_released():
	touch_left = false 


func _on_Right_released():
	touch_right = false


func _on_Boost_released():
	var f2 = File.new()
	f2.open_encrypted_with_pass(boost_cheker,File.WRITE,OS.get_unique_id())
	f2.seek_end()
	f2.store_line(str(false))
	touch_boost = false


