extends Scene
class_name ServingCounter

const OFFSET_DIFFERENCE := 80.0

var plate_offset := Vector2(-OFFSET_DIFFERENCE * 3.0, 0.0)

func _ready() -> void:
	Globals.serve_plate.connect(_on_plate_served)


func _on_plate_served(plate: ServingPlate) -> void:
	add_child(plate)
	plate.position = plate_offset
	plate_offset.x += OFFSET_DIFFERENCE
