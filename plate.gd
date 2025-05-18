extends Area2D
class_name Plate

var is_mouse_hovering: bool = false

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
			ItemManager.drop_and_delete()
			print("balls:3")
		else:
			print("penis:P")
			$Confirm.show()

func _on_yes_pressed() -> void:
	$Confirm.hide()
	$Cup.hide()
	
func _on_no_pressed() -> void:
	$Confirm.hide()
