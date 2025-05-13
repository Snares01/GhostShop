extends Node2D
class_name Ouija

const LETTERS := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

var riddle := "I'm thirsty now, so hear my plea\nFill up a cup that's tall for me"
var current_pos := 0 # Position in riddle string

@onready var revealed: Label = get_node("%Revealed")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		var next_char: String
		# Get next character in string until we find a letter or reach the end
		while LETTERS.find(next_char) == -1 and current_pos < riddle.length() - 1:
			next_char = riddle.substr(current_pos, 1).to_upper()
			current_pos += 1
		# Update ouija board task
		if next_char:
			print(next_char) # TODO: Update ouija board, highlight new letter
		else:
			# End reached
			current_pos = riddle.length()
			print("Riddle solved!")
		# Update revealed riddle
		revealed.text = riddle.left(current_pos)
