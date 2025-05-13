extends Marker2D
class_name OuijaLetter
# Node name is expected to be a character
signal hovered(letter: String)

const FONT := preload("res://RulerGold.ttf")
const FONT_SIZE := 32

var is_highlighted := false

func _process(delta: float) -> void:
	# Check for mouse hover
	if is_highlighted and get_global_mouse_position().distance_to(global_position) < FONT_SIZE:
		hovered.emit(name)
		_unhighlight()


func _draw() -> void:
	draw_char(FONT, Vector2.ZERO + Vector2(-FONT_SIZE / 4, FONT_SIZE / 4), name, FONT_SIZE)
	if is_highlighted:
		draw_circle(Vector2.ZERO, FONT_SIZE / 2, Color(1, 1, 1, 0.5))

# Called by Ouija
func highlight() -> void:
	print(name + " highlight")
	is_highlighted = true
	queue_redraw()


func _unhighlight() -> void:
	is_highlighted = false
	queue_redraw()
