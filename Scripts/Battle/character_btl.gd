extends Area2D
@onready var animatedSprite = $AnimatedSprite2D

# TODO: ID must be pulled from somewhere else
@export var positionID : int # Acceptable positions are 0, 1, and 2
var characterID : int

func _ready() -> void:
	characterID = CharacterDict.party[positionID]
	if(characterID != -1):
		var character = CharacterDict.getCharacterAt(characterID)
		animatedSprite.set_sprite_frames(character.animatedSprite)
		animatedSprite.play("Idle")
	else:
		# TODO: This characters existence should be ignored
		# It shouldn't take damage, perform its turn, etc
		pass

func _process(delta: float) -> void:
	pass

func _on_signal_bus_btl_health_check() -> void:
	# Signal bus is requesting this character check their current health
	if(CharacterDict.getCharacterAt(characterID).health <= 0):
		print("I'm PROBABLY dead!!")
