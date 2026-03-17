extends Area2D

class_name Dice

signal game_over

const SPEED = 40.0
const ROTATION_SPEED = 5.0
var ROTATION_DIRECTION = 1 if randi() % 2 else -1

@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y += SPEED * delta
	sprite_2d.rotate(ROTATION_SPEED * ROTATION_DIRECTION * delta)
	check_game_over()
	
func check_game_over() -> void:
	if get_viewport_rect().end.y < position.y:
		game_over.emit()
		queue_free()
	
