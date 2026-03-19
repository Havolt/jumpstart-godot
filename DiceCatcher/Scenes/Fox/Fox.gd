extends Area2D

class_name Fox

signal point_scored

@export var speed: float = 200.0
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sounds: AudioStreamPlayer2D = $Sounds

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
		
	


func _on_area_entered(area: Area2D) -> void:
	if area is Dice: 
		sounds.play()
		area.queue_free()
		point_scored.emit()
