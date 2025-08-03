extends Area2D
# This is supposed to be an enemy bullet, by the way

# but it ended up being unused. Oh well.
# TODO: Delete this script once it's been fully replaced

var soul_target_pos : Vector2

var animatedSprite2D : AnimatedSprite2D
var collisionShape2D : CollisionShape2D

func _ready() -> void:
	soul_target_pos = Vector2(452, 528) # This is where it's at rn at least
	animatedSprite2D = $AnimatedSprite2D
	collisionShape2D = $CollisionShape2D
	self.add_child(animatedSprite2D)
	self.add_child(collisionShape2D)

func _physics_process(delta: float) -> void:
	# go zoom
	self.position.x -= 50 * delta
	print(position)
	pass
