extends Node2D
class_name Ouija

signal update_order(text: String, finished: bool)

const LETTERS := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

var riddle := "I'm thirsty now, so hear my plea;\nFill up a cup that's tall for me"
var current_pos := 0 # Position in riddle string
var prev_char: String

@onready var board: Node2D = get_node("%Board")

func _ready() -> void:
	for child: OuijaLetter in board.get_children():
		child.hovered.connect(_on_letter_hovered)
	# Highlight first character to start
	#update_board()
	var first_char := riddle.left(1).to_upper()
	var char_node: OuijaLetter = board.get_node(first_char)
	char_node.highlight()

# Signal
func _on_letter_hovered(letter: String) -> void:
	# Reveal the riddle up to this letter
	_move_to_letter(letter)
	
	# Check if riddle is done
	if current_pos >= riddle.length():
		# Riddle finished
		update_order.emit(riddle, true)
		return
	else:
		update_order.emit(riddle.left(current_pos), false)
	# Highlight the next letter
	var next_letter := _get_next_letter()
	var char_node: OuijaLetter = board.get_node(next_letter)
	
	char_node.highlight()


func _get_next_letter() -> String:
	var cur_pos := current_pos
	var next_char := riddle.substr(cur_pos, 1).to_upper()
	# Make sure next char is a valid letter
	while (LETTERS.find(next_char) == -1 and cur_pos < riddle.length() - 1):
		cur_pos += 1
		next_char = riddle.substr(cur_pos, 1).to_upper()
	return next_char

# Changes current_pos
func _move_to_letter(letter: String) -> void:
	current_pos += 1
	var next_char := riddle.substr(current_pos, 1).to_upper()
	# Make sure next char is a valid letter
	while (LETTERS.find(next_char) == -1 and current_pos < riddle.length() - 1):
		current_pos += 1
		next_char = riddle.substr(current_pos, 1).to_upper()
