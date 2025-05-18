extends Node2D
class_name SodaMinigame

signal ended()

const GOAL_LINE := 100.0
const WIDTH := 100.0

var fill_height := 0.0
var is_filling := false
var minigame_ended := false
var fill_speed := randf_range(200,400)


func _draw() -> void:
	draw_rect(Rect2(-WIDTH/2,0,WIDTH,-fill_height),Color.INDIGO)
	draw_line(Vector2(-WIDTH/2,-GOAL_LINE), Vector2(WIDTH/2,-GOAL_LINE), Color.WEB_MAROON,5)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and not minigame_ended:
		#print(fill_speed)
		#is_filling = not is_filling <-Michael really made a point why this was VERY necessary
		if is_filling:
			is_filling = false
			print(abs(GOAL_LINE - fill_height))
			minigame_ended = true
			await get_tree().create_timer(1).timeout
			ended.emit()
		else:
			is_filling = true

func _process(delta: float) -> void:
	if is_filling:
		fill_height += fill_speed * delta
		queue_redraw()
