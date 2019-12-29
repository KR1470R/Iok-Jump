extends Sprite
var speed = 2
var touch_boost = false
func _process(delta):
	self.position.y += 20
	if Input.is_key_pressed(KEY_SPACE) or touch_boost:
		self.position.y += 10*speed
#	if Input.is_key_pressed(KEY_DOWN):
#		self.position.y -= 5
	if self.position.y >= 650:
		self.position = Vector2(1000,-50)

func _on_Boost_pressed():
	touch_boost = true

func _on_Boost_released():
	touch_boost = false