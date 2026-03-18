extends Node2D

const DICE = preload("uid://c6wsbyjga68up")

const DICE_MARGIN = 80

const STOPPABLE_GROUP: String = 'stoppable'
@onready var spawn_timer: Timer = $SpawnTimer

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
	
func pause_all() -> void:
	var to_stop: Array[Node] = get_tree().get_nodes_in_group(STOPPABLE_GROUP)
	for stoppable_node in to_stop:
		print(stoppable_node)
		stoppable_node.set_physics_process(false)

func _on_dice_game_over() -> void:
	print('SIGNALED GAME OVER TO GAME')
	pause_all()
	spawn_timer.stop()
	


func _on_timer_timeout() -> void:
	spawn_dice()
