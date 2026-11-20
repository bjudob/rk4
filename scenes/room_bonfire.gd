extends Room

@onready var fire_sound = $FireSound

func _process(delta: float) -> void:
	super._process(delta)
	if !spawned():
		return
	var n_rooms = game.get_neighbor_rooms(place)
	for room in n_rooms:
		if room.is_burning:
			continue
		room.burn()

func reset():
	super.reset()
	$bonfire/StaticBody3D/CollisionShape3D.disabled = false

func _on_fire_sound_finished() -> void:
	fire_sound.play()

func unlock_fire():
	$bonfire/StaticBody3D/CollisionShape3D.disabled = true
