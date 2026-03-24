extends Control

@onready var main: Control = $Main
@onready var game: Control = $Game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	show_game(false)


func on_level_selected(level_setting: LevelSetting) -> void:
	show_game(true)
	
func show_game(should_show_game: bool) -> void:
	game.visible = should_show_game
	main.visible = !should_show_game
