extends Control
class_name UI

signal scene_switched(scene: int)

# TODO: Keep past orders around, let player hang them up top like Papa's Pizzeria
# For now, just keep order that is being worked on
var current_order: OrderTicket

func _ready() -> void:
	current_order = $%OrderTicket
	($%Ouija as Button).pressed.connect(_on_ouija_pressed)
	($%Kitchen as Button).pressed.connect(_on_kitchen_pressed)
	($%ServingCounter as Button).pressed.connect(_on_serving_counter_pressed)


func update_order(text: String, finished: bool) -> void:
	if current_order:
		current_order.update_text(text, finished)

func _on_ouija_pressed() -> void:
	scene_switched.emit(Scene.OUIJA)

func _on_kitchen_pressed() -> void:
	scene_switched.emit(Scene.KITCHEN)

func _on_serving_counter_pressed() -> void:
	scene_switched.emit(Scene.SERVING_COUNTER)
