extends Interactable

@onready var anim = $"../AnimationPlayer"

var pushed = false

func interact():
	if pushed:
		return
	pushed = true
	anim.play("push")

#func focus():
	#if pushed:
		#return
	#anim.play("focus")
