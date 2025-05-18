extends Node2D
class_name GameManager

@onready var ui: UI = $UILayer/UI

func _ready() -> void:
	($Scenes/Ouija as Ouija).update_order.connect(_on_order_update)


func _on_order_update(text: String, finished: bool) -> void:
	ui.update_order(text, finished)
