extends Control
class_name UI

# TODO: Keep past orders around, let player hang them up top like Papa's Pizzeria
# For now, just keep order that is being worked on
var current_order: OrderTicket

func _ready() -> void:
	current_order = $SidePanel/OrderTicket


func update_order(text: String, finished: bool) -> void:
	if current_order:
		current_order.update_text(text, finished)
