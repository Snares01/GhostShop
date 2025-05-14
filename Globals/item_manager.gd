extends Node

var held_item: Node = null

func is_holding() -> bool:
	return held_item != null

func hold_item(item: Node) -> void:
	held_item = item

func _input(event):
	if event.is_action_pressed("cancel"):  # Right-click
		drop_and_delete()

func drop_and_delete():
	if held_item:
		held_item.queue_free()
		release_item()

func release_item() -> void:
	held_item = null
