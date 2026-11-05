extends CanvasLayer

@onready var hover_sound = $HoverSound

const NORMAL_COLOR = Color(1, 1, 1, 1)
const HOVER_COLOR = Color(0.4, 0.4, 0.4, 1)

var cards = []
@onready var card0 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card0
@onready var card1 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card1
@onready var card2 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card2
@onready var card3 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card3
@onready var card4 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card4
@onready var card5 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card5
@onready var card6 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card6
@onready var card7 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card7
@onready var card8 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card8
@onready var card9 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card9
@onready var card10 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card10
@onready var card11 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card11
@onready var card12 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card12
@onready var card13 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card13
@onready var card14 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row3/Card14
@onready var card15 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row3/Card15
@onready var card16 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row3/Card16
@onready var card17 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row3/Card17
@onready var card18 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row3/Card18
@onready var card19 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row3/Card19
@onready var card20 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row3/Card20



func _ready() -> void:
	visible = false
	
	cards = [
		card0,
		card1,
		card2,
		card3,
		card4,
		card5,
		card6,
		card7,
		card8,
		card9,
		card10,
		card11,
		card12,
		card13,
		card14,
		card15,
		card16,
		card17,
		card18,
		card19,
		card20,
	]
	
	for i in cards.size():
		cards[i].mouse_entered.connect(_on_card_mouse_entered.bind(i))
		cards[i].mouse_exited.connect(_on_card_mouse_exited.bind(i))

func _process(delta: float) -> void:
	pass

func show_ui():
	visible = true
	
func _on_card_mouse_entered(i: int):
	cards[i].modulate = HOVER_COLOR
	hover_sound.play()
	
func _on_card_mouse_exited(i: int):
	cards[i].modulate = NORMAL_COLOR
