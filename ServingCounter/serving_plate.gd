extends Control
class_name ServingPlate

# TODO: Make timers for disappearing that only counts down when not looking
# TODO: Implement dragging tickets onto orders

var ready_to_serve := false
var plate_info := {
	"cup": -1.0 # -1.0 = no cup, lower number is closer to right fill amount
	}

func _ready() -> void:
	$Ticket.hide()
	if plate_info["cup"] < 0.0:
		$Cup.hide()
	print(plate_info)


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data.has("ticket")


func _drop_data(at_position: Vector2, data: Variant) -> void:
	var ticket: OrderTicket = data["ticket"]
	if ticket.finished and not ready_to_serve:
		$Ticket.show()
		ticket.queue_free()
		ready_to_serve = true
	else:
		print("Ticket can't be added")
