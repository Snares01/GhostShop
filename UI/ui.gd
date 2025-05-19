extends Control
class_name UI

signal scene_switched(scene: int)

const ORDER_TICKET := preload("res://UI/order_ticket.tscn")

var current_order: OrderTicket = null

func _ready() -> void:
	($%Ouija as Button).pressed.connect(_on_ouija_pressed)
	($%Kitchen as Button).pressed.connect(_on_kitchen_pressed)
	($%ServingCounter as Button).pressed.connect(_on_serving_counter_pressed)


func update_order(text: String, finished: bool) -> void:
	if not current_order:
		current_order = ORDER_TICKET.instantiate()
		($%BigTicketSlot as OrderTicketSlot).add_ticket(current_order)
	# TODO: Move ticket to big slot if not there already
	current_order.update_text(text, finished)

func _on_ouija_pressed() -> void:
	scene_switched.emit(Scene.OUIJA)

func _on_kitchen_pressed() -> void:
	scene_switched.emit(Scene.KITCHEN)

func _on_serving_counter_pressed() -> void:
	scene_switched.emit(Scene.SERVING_COUNTER)
