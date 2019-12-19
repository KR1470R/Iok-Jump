extends Sprite
var alpha = 1.0
func _process(delta):
	modulate.a -= 0.5 * delta
