extends Area2D
class_name SodaMachine

const CUP := preload("res://Kitchen/cup.tscn")
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
		var instance := CUP.instantiate()
		add_child(instance)
		

		
