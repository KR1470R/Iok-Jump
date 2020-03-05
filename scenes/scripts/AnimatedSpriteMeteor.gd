extends AnimatedSprite
var rng = RandomNumberGenerator.new()
onready var obj = get_node('AnimatedSprite')
func _process(delta):
	rng.randomize()
	var rpos = rng.randf_range(float(1),float(3))
	self.ext(Vector2(rpos,rpos))