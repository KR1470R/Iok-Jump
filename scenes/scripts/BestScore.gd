extends Label
var filepath_score = "user://score.bin"
var file_w
var label_text = 'Best Score %s'
func _ready():
		var file_r2 = File.new()
		file_r2.open_encrypted_with_pass(filepath_score,File.READ,OS.get_unique_id())
		var all_score = file_r2.get_line()
		if all_score == '':
			file_w = File.new()
			file_w.open(filepath_score,File.WRITE)
			file_w.seek_end()
			file_w.store_line(str(0))
			file_w.close()
		file_r2.close()
		var text = label_text % all_score
		self.text = str(text)
#		write_num = int(last_score) + int(coin)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass