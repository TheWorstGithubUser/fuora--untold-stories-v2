extends Node

# Dictionary that also does the attacking for things
# Enemies will call upon this dictionary to destroy their opponents
#region bullet scenes
@export var testBulletScene : PackedScene
#endregion

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func fireAbility(ID : int) -> void:
	pass
	
func teleport(rb : RigidBody2D, target : Transform2D) -> void:
	rb.linear_velocity = Vector2.ZERO
	rb.angular_velocity = 0.0
	rb.global_transform = target
	PhysicsServer2D.body_set_state(rb.get_rid(), PhysicsServer2D.BODY_STATE_TRANSFORM, target)
	rb.reset_physics_interpolation()
	

# TODO: All bullets will be deleted at the end of a turn so long as they are a child of the Bullets node
#region abilities
func abilityTest(origin_position : Vector2) -> void:
	# Spawn in a few bullets with some time in between each shot
	# Spawn bullet 1
	var bullet1 = testBulletScene.instantiate()
	bullet1.position = origin_position
	add_child(bullet1)
	# Wait a few seconds
	await get_tree().create_timer(3.4).timeout
	
	# Spawn bullet 2
	var bullet2 = testBulletScene.instantiate()
	bullet2.position = origin_position
	add_child(bullet2)
	# Wait a few seconds
	await get_tree().create_timer(3.4).timeout
	
	# Spawn bullet 3
	var bullet3 = testBulletScene.instantiate()
	bullet3.position = origin_position
	add_child(bullet3)


#endregion
