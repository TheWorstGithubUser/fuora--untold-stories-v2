extends RigidBody2D

@onready var animatedSprite = $AnimatedSprite2D
@export var ID : int

# Follow Player
var player : Node
var charSpeed : int
var charVelocity : Vector2

func _ready() -> void:
	# Define who this character is
	var character = CharacterDict.getCharacterAt(ID)
	animatedSprite.set_sprite_frames(character.animatedSprite)
	animatedSprite.play("Idle")
	if(CharacterDict.party[ID] == -1): # Decide if this character exists
		self.visible = false
	# Obtain player node
	player = get_node("../Player_ovw")


func _process(delta: float) -> void:
	charSpeed = player.speed
	if(ID == 0): # The first party member slot
		if charVelocity.length() > 0:
			#animatedSprite.animation = "Walk"
			#animatedSprite.play()
			pass
		else:
			#animatedSprite.animation = "Idle"
			#animatedSprite.play()
			pass
		var playerPos = player.position
		if(playerPos.distance_to(position) > 100):
			position += charSpeed * (playerPos - position).normalized() * delta
			pass
		# Flip sprite to follow direction
		animatedSprite.flip_h = -(playerPos - position).x < 0
	elif(ID == 1):
		# The second party member slot
		pass

# Teleport to player's position when moving to a new area. This will be done via signal most likely
