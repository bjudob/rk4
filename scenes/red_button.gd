extends Interactable

@onready var room_bonfire = get_tree().get_nodes_in_group("room_bonfire")[0]

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
	room_bonfire.unlock_fire()
	game.red_button_pushed()

func reset():
	pushed = false
	anim.play("RESET")
