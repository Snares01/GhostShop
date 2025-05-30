extends Area2D
class_name SodaMachine

signal size_selected(size: Size)

const CUP := preload("res://Kitchen/cup.tscn")
var is_mouse_hovering: bool = false
var is_cup_ready: bool = false
var cup_rating: float
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
	$Cup.hide()
 
func _on_mouse_entered() -> void:
	is_mouse_hovering = true

func _on_mouse_exited() -> void:
	is_mouse_hovering = false

func _process(delta: float) -> void:
	if is_mouse_hovering and Input.is_action_just_pressed("select"):
		if is_cup_ready:
			$Cup.hide()
			var instance := CUP.instantiate()
			instance.rating = cup_rating
			add_child(instance)
			is_cup_ready = false
			ItemManager.hold_item(instance)
		else:
			$SizeOptions.show()

func _on_small_selected() -> void:
	size_selected.emit(Size.SMALL)
	$SizeOptions.hide()

func _on_medium_selected() -> void:
	size_selected.emit(Size.MEDIUM)
	$SizeOptions.hide()

func _on_large_selected() -> void:
	size_selected.emit(Size.LARGE)
	$SizeOptions.hide()

func _on_game_end(distance: float) -> void:
	is_cup_ready = true
	cup_rating = distance
	$Cup.show()
