extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)

func on_level_selected(level_setting: LevelSetting) -> void:
	print("game", level_setting)
