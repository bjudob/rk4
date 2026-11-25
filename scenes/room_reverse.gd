extends Room

var paper_pieces = [false, false, false, false]
@onready var scroll = $Scroll

func _ready() -> void:
	super._ready()
	scroll.disable()

func _process(delta: float) -> void:
	super._process(delta)
	if !spawned():
		return
	var n_rooms = game.get_neighbor_rooms(place)
	for room in n_rooms:
		if room.is_reversed:
			continue
		room.reverse()
	if scroll.visible == false and paper_pieces[0] and paper_pieces[1] and paper_pieces[2] and paper_pieces[3]:
		scroll.enable()
		

func add_paper_piece(nr: int):
	if nr < 0:
		return
	paper_pieces[nr] = true
