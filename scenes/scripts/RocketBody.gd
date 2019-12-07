extends KinematicBody2D

var speed = 2

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

func _physics_process(delta):
    
    if self.position.y != get_viewport().size.y - 50:
        move_and_collide(BOTTOM*4)
		
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
    if self.position.x >= 520 or self.position.x <= -500:
        print("test")
        self.position = Vector2(200,-100)
    if self.position.y >= 300:
        self.position = Vector2(200,-100)
    if self.position.y < -320:
        self.position = Vector2(200,-100)
    pass
	
func _on_Left_pressed():
	touch_left = true

func _on_Right_pressed():
	touch_right = true


func _on_Boost_pressed():
	touch_boost = true



func _on_Left_released():
	touch_left = false 


func _on_Right_released():
	touch_right = false


func _on_Boost_released():
	touch_boost = false


