extends Control

const MEMORY_TILE = preload("uid://cql5xay1b52lu")
@onready var grid_container: GridContainer = $HB/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)

func on_level_selected(level_setting: LevelSetting) -> void:
	for i in range(level_setting.total_tiles):
		var new_tile = MEMORY_TILE.instantiate()
		grid_container.add_child(new_tile)
	
	print("game", level_setting)


func _on_exit_button_pressed() -> void:
	for tile in grid_container.get_children():
		tile.queue_free()
	SignalHub.emit_on_game_exit_pressed()
