extends Room

@onready var melted = $Assets/Melted
@onready var snow = $Assets/Snow

func _ready() -> void:
	super._ready()
	melted.visible = false


func burn():
	super.burn()
	melted.visible = true
	snow.visible = false
