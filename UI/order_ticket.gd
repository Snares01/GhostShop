extends PanelContainer
class_name OrderTicket


func _ready() -> void:
	theme_type_variation = &"UnsolvedOrderTicket"


func update_text(text: String, finished: bool) -> void:
	$Label.text = text
	if finished:
		# Remove red border
		theme_type_variation = &"OrderTicket"
