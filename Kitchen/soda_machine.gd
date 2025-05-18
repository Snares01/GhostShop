extends Area2D
class_name SodaMachine

const CUP := preload("res://Kitchen/cup.tscn")
var is_mouse_hovering: bool = false
enum Size {
	SMALL,
	MEDIUM,
	LARGE
}

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	(get_node("%Small") as Button).pressed.connect(_on_small_selected)
	(get_node("%Medium") as Button).pressed.connect(_on_medium_selected)
	(get_node("%Large") as Button).pressed.connect(_on_large_selected)
 
func _on_mouse_entered() -> void:
	is_mouse_hovering = true

func _on_mouse_exited() -> void:
	is_mouse_hovering = false

func _process(delta: float) -> void:
	if is_mouse_hovering and Input.is_action_just_pressed("select"):
		$SizeOptions.show()

func _on_small_selected() -> void:
	_on_size_selected(Size.SMALL)

func _on_medium_selected() -> void:
	_on_size_selected(Size.MEDIUM)

func _on_large_selected() -> void:
	_on_size_selected(Size.LARGE)

func _on_size_selected(size: Size) -> void:
	pass
	
