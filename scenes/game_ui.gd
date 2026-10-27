extends CanvasLayer

@onready var steps_label = $MarginContainer/HBoxContainer/StepsContainer/StepsLabel
@onready var gems_label = $MarginContainer/HBoxContainer/GemsContainer/GemsLabel
@onready var keys_label = $MarginContainer/HBoxContainer/GemsContainer/KeysLabel
@onready var dices_label = $MarginContainer/HBoxContainer/GemsContainer/DicesLabel

func _ready() -> void:
	pass


func update(steps: int, gems: int, keys: int, dices: int) -> void:
	steps_label.text =  "%s" % steps
	gems_label.text = "%s" % gems
	keys_label.text = "%s" % keys
	dices_label.text = "%s" % dices
