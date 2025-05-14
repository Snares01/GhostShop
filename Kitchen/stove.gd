extends Area2D
class_name Stove

const SPATULA := preload("res://Kitchen/spatula.tscn")
var is_mouse_hovering: bool = false

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	 
func _on_mouse_entered() -> void:
	is_mouse_hovering = true
	
	
func _on_mouse_exited() -> void:
	is_mouse_hovering = false
	
func _process(delta: float) -> void:
	if is_mouse_hovering and Input.is_action_just_pressed("select"):
		if not ItemManager.is_holding():
			var instance := SPATULA.instantiate()
			add_child(instance)
			ItemManager.hold_item(instance)
