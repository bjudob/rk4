extends Interactable

@onready var key_sound = $KeySound

func interact():
	key_sound.play()
	visible = false
	collision.disabled = true
	game.add_keys(1)
