extends Node2D
class_name ServingPlate

# TODO: Make timers for disappearing that only counts down when not looking
# TODO: Implement dragging tickets onto orders

var plate_info := {
	"cup": -1.0 # -1.0 = no cup, lower number is closer to right fill amount
	}

func _ready() -> void:
	if plate_info["cup"] < 0.0:
		$Cup.hide()
	print(plate_info)
