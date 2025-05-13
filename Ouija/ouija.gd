extends Node2D
class_name Ouija

const LETTERS := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

var riddle := "I'mm thirsty now, so hear my plea\nFill up a cup that's tall for me"
var current_pos := 0 # Position in riddle string
var prev_char: String

@onready var revealed: Label = get_node("%Revealed")

func _ready() -> void:
	for child: OuijaLetter in get_node("%Letters").get_children():
		child.hovered.connect(_on_letter_hovered)
	# Highlight first character to start
	#update_board()
	var first_char := riddle.left(1).to_upper()
	var char_node: OuijaLetter = get_node("%Letters").get_node(first_char)
	char_node.highlight()

# Signal
func _on_letter_hovered(letter: String) -> void:
	# Reveal the riddle up to this letter
	_move_to_letter(letter)
	revealed.text = riddle.left(current_pos)
	# Highlight the next letter
	print("prev_letter: " + str(revealed.text.right(revealed.text.length() - 1)))
	var next_letter := _get_next_letter()
	print("next_letter: " + next_letter)
	var char_node: OuijaLetter = get_node("%Letters").get_node(next_letter)
	
	char_node.highlight()


func _get_next_letter() -> String:
	var cur_pos := current_pos
	var next_char := riddle.substr(cur_pos, 1).to_upper()
	# Make sure next char is a valid letter
	while (LETTERS.find(next_char) == -1 and cur_pos < riddle.length() - 1): # Not end of riddle
		cur_pos += 1
		next_char = riddle.substr(cur_pos, 1).to_upper()
	return next_char

# Changes current_pos
func _move_to_letter(letter: String) -> void:
	current_pos += 1
	var next_char := riddle.substr(current_pos, 1).to_upper()
	# Make sure next char is a valid letter
	while (LETTERS.find(next_char) == -1 and current_pos < riddle.length() - 1): # Not end of riddle
		current_pos += 1
		next_char = riddle.substr(current_pos, 1).to_upper()

# Reveals next character in riddle
# Returns true if riddle is finished
func update_board() -> bool:
	var next_char: String
	# Get next character in string
	# Skip repeated letters & non-letters, stop at end of string
	while (LETTERS.find(next_char) == -1 or next_char == prev_char) and current_pos < riddle.length() - 1:
		next_char = riddle.substr(current_pos, 1).to_upper()
		current_pos += 1
	# Update ouija board
	#print(next_char + ".")
	#prev_char = next_char
	if next_char:
		# Highlight new letter
		var char_node: OuijaLetter = get_node("%Letters").get_node(next_char)
		char_node.highlight()
		return false
	else:
		# End reached
		current_pos = riddle.length()
		return true
