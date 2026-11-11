extends Interactable

@onready var interact_sound = $InteractSound

func interact():
	interact_sound.play()
	visible = false
	collision.disabled = true
	game.add_candies(1)
