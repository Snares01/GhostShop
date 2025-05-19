extends Area2D
class_name Plate

const SERVING_PLATE := preload("res://ServingCounter/serving_plate.tscn")

var is_mouse_hovering: bool = false
var plate_info := { # Lines up with ServingPlate (could be its own class but meh)
	"cup": -1.0 # -1.0 = no cup, lower number is closer to right fill amount
	}

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	$Cup.hide()
	$Confirm.hide()
	$%Yes.pressed.connect(_on_yes_pressed)
	$%No.pressed.connect(_on_no_pressed)
 
func _on_mouse_entered() -> void:
	is_mouse_hovering = true

func _on_mouse_exited() -> void:
	is_mouse_hovering = false

func _process(delta: float) -> void:
	if is_mouse_hovering and Input.is_action_just_pressed("select"):
		if ItemManager.is_holding():
			match ItemManager.get_item_type():
				Draggable.Type.CUP:
					$Cup.show()
					plate_info["cup"] = ItemManager.get_item_rating()
			ItemManager.drop_and_delete()
		else:
			$Confirm.show()

func _on_yes_pressed() -> void:
	$Confirm.hide()
	$Cup.hide()
	# Make order & emit
	var instance := SERVING_PLATE.instantiate()
	instance.plate_info = plate_info
	Globals.serve_plate.emit(instance)
	plate_info = {"cup": -1.0}

func _on_no_pressed() -> void:
	$Confirm.hide()
