extends TextureButton

@export var level_setting: LevelSetting
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = level_setting._to_string()


func _on_pressed() -> void:
	SignalHub.emit_on_level_selected(level_setting)
