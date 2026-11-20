extends Room

func _process(delta: float) -> void:
	super._process(delta)
	if !spawned():
		return
	var n_rooms = game.get_neighbor_rooms(place)
	for room in n_rooms:
		if room.is_reversed:
			continue
		room.reverse()
