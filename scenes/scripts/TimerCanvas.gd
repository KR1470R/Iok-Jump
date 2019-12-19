extends CanvasLayer
func _ready():
	get_tree().paused = true
	get_node("TimerCount").queue("Counter")
#	print(get_node("TimerCount").is_play())
##	if get_node("TimerCount").is_playing(false ):
##		get_tree().paused = false
func _on_TimerCount_animation_finished(ss):
	get_tree().paused = false
