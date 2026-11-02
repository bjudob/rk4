extends Interactable

@onready var anim = $"../AnimationPlayer"

var pushed = false

func _ready():
	anim.play("focus")

func interact():
	if pushed:
		return
	pushed = true
	anim.play("push")

func reset():
	pushed = false
	anim.play("RESET")
