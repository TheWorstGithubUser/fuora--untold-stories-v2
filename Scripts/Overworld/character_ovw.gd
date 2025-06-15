extends RigidBody2D

@onready var animatedSprite = $AnimatedSprite2D
@export var ID : int

# Follow Player
var playerPosition : Vector2
var player : Node
var playerSpeed : int

func _ready() -> void:
	var character = CharacterDict.getCharacterAt(ID)
	animatedSprite.set_sprite_frames(character.animatedSprite)
	animatedSprite.play("Idle")
	player = get_node("../Player_ovw")
	playerSpeed = player.speed / 57
	if(CharacterDict.party[ID] == -1):
		self.visible = false

func _process(delta: float) -> void:
	playerPosition = player.playerPosition
	if(ID == 0):
		# The first party member slot
		if(playerPosition.distance_to(position) > 70):
			position = position + (playerPosition - position).normalized() * playerSpeed
		pass
	elif(ID == 1):
		# The second party member slot
		pass
