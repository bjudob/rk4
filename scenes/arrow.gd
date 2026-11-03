extends Interactable

var lock

@export var nr = 0
@export var up = true

func _ready() -> void:
	lock = get_parent()

func interact():
	lock.add_number(nr, up)
