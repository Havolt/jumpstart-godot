extends Area2D

class_name Fox

@export var speed: float = 200.0
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var move: float = Input.get_axis("ui_left", "ui_right")
	#if Input.is_action_pressed("ui_left"):
		#move -= speed
	#elif Input.is_action_pressed("ui_right"):
		#move += speed
		
	if !is_zero_approx(move):	
		sprite_2d.flip_h = move > 0.0
		
	position.x += move * delta * speed
		
	
