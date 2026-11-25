extends Interactable

@onready var timer = $Timer

func _ready():
	$Tarot.disable()

func interact():
	pass

func focus():
	if !timer.time_left > 0:
		timer.start()

func unfocus():
	super.unfocus()
	timer.stop()

func _on_timer_timeout() -> void:
	$Tarot.enable()
