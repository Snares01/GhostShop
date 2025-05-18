extends Node2D
class_name GameManager

@onready var ui: UI = $UILayer/UI

func _ready() -> void:
	($Scenes/Ouija as Ouija).update_order.connect(_on_order_update)
	ui.scene_switched.connect(_on_scene_switched)


func _on_order_update(text: String, finished: bool) -> void:
	ui.update_order(text, finished)


func _on_scene_switched(scene: int) -> void:
	$%Ouija.hide()
	$%Kitchen.hide()
	$%ServingCounter.hide()
	match scene:
		Scene.OUIJA:
			$%Ouija.show()
		Scene.KITCHEN:
			$%Kitchen.show()
		Scene.SERVING_COUNTER:
			$%ServingCounter.show()
