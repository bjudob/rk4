class_name Walls
extends Node3D

@onready var wall_left = $WallLeft
@onready var wall_right = $WallRight
@onready var wall_forward = $WallForward

enum Type {
	ALL,
	LEFT_FORWARD,
	RIGHT_FORWARD,
	LEFT_RIGHT,
	FORWARD,
	LEFT,
	RIGHT,
	DEAD_END,
}

var wall_type: Type = Type.ALL

func _ready():
	block(wall_left)
	block(wall_right)
	block(wall_forward)
	

func set_type(wt: Type):
	wall_type = wt
	
	match wall_type:
		Type.ALL:
			door(wall_left)
			door(wall_right)
			door(wall_forward)
		Type.LEFT_FORWARD:
			door(wall_left)
			door(wall_forward)
		Type.RIGHT_FORWARD:
			door(wall_right)
			door(wall_forward)
		Type.LEFT_RIGHT:
			door(wall_left)
			door(wall_right)
		Type.FORWARD:
			door(wall_forward)
		Type.LEFT:
			door(wall_left)
		Type.RIGHT:
			door(wall_right)
		Type.DEAD_END:
			pass
	
func block(wall: CSGBox3D):
	wall.visible = true
	wall.use_collision = true

func door(wall: CSGBox3D):
	wall.visible = false
	wall.use_collision = false
