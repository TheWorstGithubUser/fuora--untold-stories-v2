extends Node

# Dictionary that also does the attacking for things
# Enemies will call upon this dictionary to destroy their opponents

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

#func _integrate_forces(state: PhysicsDirectBodyState2D)

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
	#region setParams
	#var bullet = Area2D.new()
	#var bullet_col = CollisionShape2D.new()
	#var bullet_anim = GameDictionary.get_child(1).get_child(0)
	#bullet.add_child(bullet_col)
	#bullet.add_child(bullet_anim)
	#bullet_anim.play("Idle")
	#bullet.position = origin_position
	#bullet_col.position = bullet.position
	#bullet_anim.position = bullet.position
	#bullet.set_script("res://Scripts/Battle/Bullets/test_bul.gd")
	#bullet.set_process(true)
	
	var bullet = preload("res://Scenes/Battle/Bullets/bullet_test.tscn")
	bullet.position = origin_position
	#endregion

#endregion
