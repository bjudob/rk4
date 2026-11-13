extends Interactable

@onready var interact_sound = $InteractSound
@export var music = load("res://music/Zenepuzzle.mp3")

func _ready():
	interact_sound.stream = music

func interact():
	interact_sound.play()
