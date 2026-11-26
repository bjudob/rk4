extends Node3D

@export var solution = "a a a a a b "

@export var options_1 = ["a", "b", "c", "d"]
@export var options_2 = ["a", "b", "c", "d"]
@export var options_3 = ["a", "b", "c", "d"]
@export var options_4 = ["a", "b", "c", "d"]
@export var options_5 = ["a", "b", "c", "d"]
@export var options_6 = ["a", "b", "c", "d"]

@onready var display = $Display
@onready var lock_symbol = $Locked
@onready var unlock_symbol = $Unlock
@onready var solution_sound = $SolutionSound

@onready var options = [
	options_1,
	options_2,
	options_3,
	options_4,
	options_5,
	options_6
]

var solved = false

var nrs = [0, 0, 0, 0, 0, 0]

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

	if nrs[nr] >= options[nr].size():
		nrs[nr] = options[nr].size() - 1
	if nrs[nr] < 0:
		nrs[nr] = 0

	diplay_nrs()

func diplay_nrs():
	var s = ""
	for i in range(nrs.size()):
		s += options[i][nrs[i]]
		s += " "

	display.text = s
	if s == solution:
		get_parent().solve_lock(true)
