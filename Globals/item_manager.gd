extends Node

var _held_item: Draggable = null

func is_holding() -> bool:
	return _held_item != null

func hold_item(item: Draggable) -> void:
	if _held_item:
		drop_and_delete()
	_held_item = item

func _input(event):
	if event.is_action_pressed("cancel"):  # Right-click
		drop_and_delete()

func drop_and_delete():
	if _held_item:
		_held_item.queue_free()
		release_item()

func release_item() -> void:
	_held_item = null

func get_item_type() -> Draggable.Type:
	return _held_item.type
