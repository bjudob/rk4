extends Interactable

@onready var game = get_tree().get_nodes_in_group("game")[0]

@onready var anim = $"../AnimationPlayer"
@onready var sound = $"../RedButtonPushSound"

var pushed = false

func _ready():
	anim.play("focus")

func interact():
	if pushed:
		return
	pushed = true
	anim.play("push")
	sound.play()

func reset():
	pushed = false
	anim.play("RESET")
