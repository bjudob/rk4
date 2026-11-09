extends CanvasLayer

@onready var days_label = $MarginContainer/HBoxContainer/StepsContainer/DaysLabel
@onready var steps_label = $MarginContainer/HBoxContainer/StepsContainer/StepsLabel
@onready var candies_label = $MarginContainer/HBoxContainer/GemsContainer/CandiesLabel
@onready var keys_label = $MarginContainer/HBoxContainer/GemsContainer/KeysLabel
@onready var dices_label = $MarginContainer/HBoxContainer/GemsContainer/DicesLabel

func _ready() -> void:
	pass


func update(days: int, steps: int, gems: int, keys: int, dices: int) -> void:
	days_label.text = "%s" % days
	steps_label.text =  "%s" % steps
	candies_label.text = "%s" % gems
	keys_label.text = "%s" % keys
	dices_label.text = "%s" % dices
