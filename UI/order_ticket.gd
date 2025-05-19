extends PanelContainer
class_name OrderTicket

const ORDER_TICKET := preload("res://UI/order_ticket.tscn")
const THEME := preload("res://UI/default_theme.tres")
const PREVIEW_SIZE := Vector2(125.0, 200.0)

var finished := false

func _ready() -> void:
	theme_type_variation = &"UnsolvedOrderTicket"


func update_text(text: String, finished: bool) -> void:
	$Label.text = text
	if finished:
		# Remove red border
		theme_type_variation = &"OrderTicket"
		self.finished = true


func set_font_size(font_size: int) -> void:
	$Label.label_settings.font_size = font_size


func _get_drag_data(at_position: Vector2) -> Variant:
	var preview := ORDER_TICKET.instantiate()
	preview.custom_minimum_size = PREVIEW_SIZE
	preview.theme = THEME
	preview.theme_type_variation = &"OrderTicket"
	preview.get_node("Label").text = $Label.text
	preview.modulate = Color(1, 1, 1, 0.5)
	set_drag_preview(preview)
	
	return {"ticket": self}
