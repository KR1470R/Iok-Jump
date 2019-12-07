extends Label
var filepath = "user://coins.txt"
var label 

func _ready():
	print(OS.get_user_data_dir())
	var file = File.new()
	file.open(filepath,File.READ)
	label = file.get_line()
	file.close()
	self.text = str(label)
