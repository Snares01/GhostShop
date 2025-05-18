extends Scene
class_name Kitchen

@onready var soda_machine: SodaMachine = $SodaMachine
@onready var soda_minigame: SodaMinigame = $%SodaMinigame

func _ready() -> void:
	soda_machine.size_selected.connect(soda_minigame._on_game_start)
