extends Area2D
@onready var animatedSprite = $AnimatedSprite2D
# TODO: ID must be pulled from somewhere else
@export var positionID : int # Acceptable positions are 0, 1, and 2
var characterID : int
@onready var alive = true
@onready var battlePhase = false
var allied = true

# UI
@onready var party1Health = $"../../AbilitySelectPhase/Control/Party1Info/Party1Health"
@onready var party2Health = $"../../AbilitySelectPhase/Control/Party2Info/Party2Health"
@onready var party3Health = $"../../AbilitySelectPhase/Control/Party3Info/Party3Health"

func _ready() -> void:
	characterID = CharacterDict.party[positionID]
	if(characterID != -1):
		var character = CharacterDict.getCharacterAt(characterID)
		animatedSprite.set_sprite_frames(character.animatedSprite)
		animatedSprite.play("Idle")
		self.name = CharacterDict.getCharacterAt(characterID).characterName
	else:
		# TODO: This characters existence should be ignored
		# It shouldn't take damage, perform its turn, etc
		pass

func _process(delta: float) -> void:
	_setHealth()

func _setHealth() -> void:
	if(positionID == 0):
		party1Health.set_value(CharacterDict.getCharacterAt(characterID).health)
	if(positionID == 1):
		party2Health.set_value(CharacterDict.getCharacterAt(characterID).health)
	if(positionID == 2):
		party3Health.set_value(CharacterDict.getCharacterAt(characterID).health)

func _on_signal_bus_btl_health_check() -> void:
	# Signal bus is requesting this character check their current health
	if(CharacterDict.getCharacterAt(characterID).health <= 0):
		if(alive):
			print(self.name + " has died")
			alive = false

func _on_signal_bus_btl_battle_phase_change() -> void:
	battlePhase = !battlePhase
