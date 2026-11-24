extends Interactable

@export var number = -1
@onready var tarot_ui = get_tree().get_nodes_in_group("tarot_ui")[0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	disable()
	tarot_ui.new_tarot(number)

func disable():
	visible = false
	$CollisionShape3D.disabled = true

func enable():
	visible = true
	$CollisionShape3D.disabled = false
