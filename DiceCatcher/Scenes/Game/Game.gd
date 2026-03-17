extends Node2D

const DICE = preload("uid://c6wsbyjga68up")

const DICE_MARGIN = 80

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_dice()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_dice() -> void:
	
	var vpr: Rect2 = get_viewport_rect()
	var new_x: float = randf_range(
		vpr.position.x + DICE_MARGIN, 
		vpr.end.x - DICE_MARGIN
	)
	
	var new_dice: Dice = DICE.instantiate()
	new_dice.position = Vector2(new_x, -DICE_MARGIN)
	new_dice.game_over.connect(_on_dice_game_over)
	add_child(new_dice)

func _on_dice_game_over() -> void:
	print('SIGNALED GAME OVER TO GAME')
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	spawn_dice()
