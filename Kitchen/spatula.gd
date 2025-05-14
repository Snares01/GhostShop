extends Sprite2D
class_name Spatula

func _process(delta: float) -> void:
	global_position = get_global_mouse_position() 
