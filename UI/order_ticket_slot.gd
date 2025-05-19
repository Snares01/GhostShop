extends Container
class_name OrderTicketSlot

const BIG_SIZE := Vector2(250.0, 400.0)
const SMALL_SIZE := Vector2(62.5, 100.0)

@export var big: bool

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data.has("ticket")


func _drop_data(at_position: Vector2, data: Variant) -> void:
	var ticket: OrderTicket = data["ticket"]
	add_ticket(ticket)


func add_ticket(ticket: OrderTicket) -> void:
	# Add to slot
	if ticket.get_parent():
		ticket.reparent(self)
	else:
		add_child(ticket)
	# Change ticket
	if big:
		ticket.custom_minimum_size = BIG_SIZE
		ticket.set_font_size(32)
	else:
		ticket.custom_minimum_size = SMALL_SIZE
		ticket.set_font_size(8)
