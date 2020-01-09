extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var choose_rocket_path = 'user://used_ship.bin'
var boost_cheker = "user://boost_cheker.bin"
var choose_rocket
var base_rocket = load("res://texture_ui/game/characters/character.png")
var master_rocket = load("res://texture_ui/game/characters/pro_rocket_2.png")
var pro_rocket = load("res://texture_ui/game/characters/master_rockey_3.png")
var gold_rocket = load("res://texture_ui/game/characters/gold_rocket_4.png")
var node_rocket = load("res://texture_ui/game/characters/node_rocket_5.png")
var threed_rocket = load("res://texture_ui/game/characters/3d_rocket_7.png")
# Called when the node enters the scene tree for the first time.
func _ready():
    set_process(true)
    choose_rocket = File.new()
    choose_rocket.open_encrypted_with_pass(choose_rocket_path,File.READ,OS.get_unique_id())
    var rocket = choose_rocket.get_line()
    if rocket == '1':
        self.set_texture(base_rocket)
    if rocket == '2':
        self.set_texture(master_rocket)
    if rocket == '3':
        self.set_texture(pro_rocket)
    if rocket == '4':
        self.set_texture(gold_rocket)
    if rocket == '5':
        self.set_texture(node_rocket)
    if rocket == '6':
        self.set_texture(threed_rocket)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
