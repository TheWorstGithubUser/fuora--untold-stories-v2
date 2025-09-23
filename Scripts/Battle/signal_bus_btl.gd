extends Node

signal healthCheck() # Tell's every party member to check their health
signal battlePhaseChange() # Clear's UI, begins enemy attacks, and allows player to use their selected abilities

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_fervent_soul_damage_taken(nextMoron: int, damage: int) -> void:
		CharacterDict.getCharacterAt(nextMoron).health -= damage # deal damage
		healthCheck.emit()
