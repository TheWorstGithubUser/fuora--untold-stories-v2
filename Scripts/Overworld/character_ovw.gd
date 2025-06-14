extends RigidBody2D

@onready var animatedSprite = $AnimatedSprite2D

@export var ID : int

func _ready() -> void:
	var character = CharacterDict.getCharacterAt(ID)
	animatedSprite.set_sprite_frames(character.animatedSprite)
	animatedSprite.play("Idle")

func _process(delta: float) -> void:
	pass
