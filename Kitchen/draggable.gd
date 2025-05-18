extends Sprite2D
class_name Draggable

enum Type {
	CUP,
	SPATULA
}

@export var type: Type

func _process(delta: float) -> void:
	global_position = get_global_mouse_position() 
