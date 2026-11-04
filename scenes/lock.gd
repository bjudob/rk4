extends Node3D

@export var lock_name = "noname"
@export var solution = "6 6 6 6 "

@onready var display = $Display
@onready var lock_symbol = $Locked
@onready var unlock_symbol = $Unlock
@onready var solution_sound = $SolutionSound
var solved = false

var nrs = [1, 1, 1, 1]

func _ready() -> void:
	unlock_symbol.visible = false
	diplay_nrs()

func solve():
	display.text = solution
	solved = true
	lock_symbol.visible = false
	unlock_symbol.visible = true
	solution_sound.play()

func add_number(nr: int, up: bool):
	if solved:
		return
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
	if s == solution:
		get_parent().solve_lock(true)
