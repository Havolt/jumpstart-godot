extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = ImageManager.get_random_item_image()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
