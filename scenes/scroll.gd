extends Interactable


@export var scroll = load("res://assets/scrolls/scroll_hexa_6.png")

func interact():
	scroll_ui.show_scroll(scroll)
