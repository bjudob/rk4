extends Room

@onready var fire_sound = $FireSound

func _process(delta: float) -> void:
	super._process(delta)

func spawn(spawn_place: Vector2, direction: EntryDirection) -> void:
	super.spawn(spawn_place, direction)

func reset():
	super.reset()
	$bonfire/StaticBody3D/CollisionShape3D.disabled = false

func _on_fire_sound_finished() -> void:
	fire_sound.play()

func unlock_fire():
	$bonfire/StaticBody3D/CollisionShape3D.disabled = true
