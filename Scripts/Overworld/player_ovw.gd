extends RigidBody2D
# Animation
@onready var animatedSprite = $AnimatedSprite2D
var ID = 1

# Movement (WASD)
@export var speed = 400 # How fast the player will move (pixels/sec)
var velocity
var playerPosition : Vector2 # For use in other scripts

# Interaction (E)
var busy = false


func _ready() -> void:
	var character = CharacterDict.getCharacterAt(ID)
	animatedSprite.set_sprite_frames(character.animatedSprite)
	animatedSprite.play("Idle")
	# Add self to the party
	CharacterDict.party[0] = ID

func _process(delta: float) -> void:
	#region Controls
	velocity = Vector2.ZERO # The player's movement vector
	if Input.is_action_pressed("ui_right") && !busy:
		velocity.x += 1
	if Input.is_action_pressed("ui_left") && !busy:
		velocity.x -= 1
	if Input.is_action_pressed("ui_up") && !busy:
		velocity.y -= 1
	if Input.is_action_pressed("ui_down") && !busy:
		velocity.y += 1
	#endregion
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		#animatedSprite.animation = "Walk"
		#animatedSprite.play()
	else:
		#animatedSprite.animation = "Idle"
		#animatedSprite.play()
		pass
		
	position += velocity * delta
	playerPosition = position
	#position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		animatedSprite.flip_h = velocity.x < 0
