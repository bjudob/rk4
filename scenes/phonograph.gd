extends Interactable

@onready var interact_sound = $InteractSound

func interact():
	interact_sound.play()
