extends Sprite2D
class_name Draggable

func _process(delta: float) -> void:
	global_position = get_global_mouse_position() 
