extends Label
var filepath = "user://coins.bin"
var label 

func _ready():
	print(OS.get_user_data_dir())
	var file = File.new()
	file.open_encrypted_with_pass(filepath,File.READ,OS.get_unique_id())
	label = file.get_line()
	file.close()
	self.text = str(label)
