extends Node3D

@onready var display = $Display

var nrs = [1, 1, 1, 1]

func _ready() -> void:
	diplay_nrs()

func add_number(nr: int, up: bool):
	if up:
		nrs[nr] = nrs[nr] + 1
	else:
		nrs[nr] = nrs[nr] - 1
		
	if nrs[nr] > 9:
		nrs[nr] = 9
	if nrs[nr] < 0:
		nrs[nr] = 0
		
	diplay_nrs()
		
func diplay_nrs():
	var s = ""
	for nr in nrs:
		s += str(nr)
		s += " "
	
	display.text = s
