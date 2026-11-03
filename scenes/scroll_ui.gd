extends CanvasLayer

@onready var scroll_image = $MarginContainer/ScrollImage

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		visible = false

func show_scroll(scroll: Texture):
	visible = true
	scroll_image.texture = scroll
