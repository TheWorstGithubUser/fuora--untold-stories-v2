extends Node

signal healthCheck()

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_fervent_soul_damage_taken(nextMoron: int, damage: int) -> void:
		CharacterDict.getCharacterAt(nextMoron).health -= damage # deal damage
		# Tell character to check if they are still alive
		healthCheck.emit()
