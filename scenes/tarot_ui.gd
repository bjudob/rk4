extends CanvasLayer

@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var game = get_tree().get_nodes_in_group("game")[0]

@onready var new_tarot_sound = $NewTarotSound
@onready var hover_sound = $HoverSound
@onready var highlight_card = $HighlightCard
@onready var call_it_a_day = $MarginContainer/VBoxContainer/ButtonContainer/CallItADay
@onready var exit_game = $MarginContainer/VBoxContainer/ButtonContainer/ExitGame
var is_highlight = false
var just_highlighted = false

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
@onready var card7 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card7
@onready var card8 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card8
@onready var card9 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card9
@onready var card10 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row1/Card10
@onready var card11 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card11
@onready var card12 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card12
@onready var card13 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card13
@onready var card14 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card14
@onready var card15 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card15
@onready var card16 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card16
@onready var card17 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card17
@onready var card18 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card18
@onready var card19 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card19
@onready var card20 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card20
@onready var card21 = $MarginContainer/VBoxContainer/TarotContainer/Rows/Row2/Card21

var tarots = []
var tarot0 = load("res://assets/tarot/0_the_fool.png")
var tarot1 = load("res://assets/tarot/1_the_magician.png")
var tarot2 = load("res://assets/tarot/2_the_high_priestess.png")
var tarot3 = load("res://assets/tarot/3_the_empress.png")
var tarot4 = load("res://assets/tarot/4_the_emperor.png")
var tarot5 = load("res://assets/tarot/5_the_hierophant.png")
var tarot6 = load("res://assets/tarot/6_the_lovers.png")
var tarot7 = load("res://assets/tarot/7_the_chariot.png")
var tarot8 = load("res://assets/tarot/8_strength.png")
var tarot9 = load("res://assets/tarot/9_the_hermit.png")
var tarot10 = load("res://assets/tarot/10_the_wheel_of_fortune.png")
var tarot11 = load("res://assets/tarot/11_justice.png")
var tarot12 = load("res://assets/tarot/12_the_hanged_man.png")

var tarots_found = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]

func _ready() -> void:
	visible = false
	highlight_card.visible = false
	
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
	tarots = [
		tarot0,
		tarot1,
		tarot2,
		tarot3,
		tarot4,
		tarot5,
		tarot6,
		tarot7,
		tarot8,
		tarot9,
		tarot10,
		tarot11,
		tarot12,
	]
	
	for i in cards.size():
		cards[i].mouse_entered.connect(_on_card_mouse_entered.bind(i))
		cards[i].mouse_exited.connect(_on_card_mouse_exited.bind(i))
		cards[i].gui_input.connect(_on_card_gui_input.bind(i))

func _process(delta: float) -> void:
	pass
	if is_highlight and Input.is_action_just_pressed("interact") and !just_highlighted:
		remove_highlight()
	just_highlighted = false

func new_tarot(i: int):
	show_ui()
	tarots_found[i] = true
	render(tarots_found)
	highlight_tarot(i)
	new_tarot_sound.play()

func render(new_tarots_found):
	tarots_found = new_tarots_found
	for i in len(tarots_found):
		if not tarots_found[i]:
			continue
		cards[i].texture = tarots[i]
		for tarot_card in get_tree().get_nodes_in_group("tarot"):
			if tarot_card.number == i:
				tarot_card.visible=false
			

func show_ui():
	visible = true
	player.lock_move()
	
func hide_ui():
	visible = false
	player.unlock_move()

func _on_card_gui_input(event: InputEvent, i: int):
	if not event is InputEventMouseButton or not event.pressed:
		return
	highlight_tarot(i)
	
func highlight_tarot(i: int):
	if is_highlight:
		return
	is_highlight = true
	just_highlighted = true
	highlight_card.visible = true
	highlight_card.texture = cards[i].texture
	
func remove_highlight():
	is_highlight = false
	highlight_card.visible = false

func _on_card_mouse_entered(i: int):
	cards[i].modulate = HOVER_COLOR
	hover_sound.play()
	
func _on_card_mouse_exited(i: int):
	cards[i].modulate = NORMAL_COLOR


func _on_call_it_a_day_mouse_entered() -> void:
	call_it_a_day.modulate = HOVER_COLOR
	hover_sound.play()


func _on_call_it_a_day_mouse_exited() -> void:
	call_it_a_day.modulate = NORMAL_COLOR


func _on_call_it_a_day_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		visible = false
		player.unlock_move()
		game.show_new_day_ui()


func _on_exit_game_mouse_entered() -> void:
	exit_game.modulate = HOVER_COLOR
	hover_sound.play()


func _on_exit_game_mouse_exited() -> void:
	exit_game.modulate = NORMAL_COLOR


func _on_exit_game_gui_input(event: InputEvent) -> void:
	pass # Replace with function body.
