extends CanvasLayer

@onready var steps_label = $MarginContainer/HBoxContainer/StepsLabel

func _ready() -> void:
	pass


func update(steps: int) -> void:
	steps_label.text =  "%s" % steps
