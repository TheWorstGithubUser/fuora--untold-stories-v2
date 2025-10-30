extends Node

# Dictionary that also does the attacking for things
# The player will call upon this dictionary to destroy their opponents
#region bullet scenes
@export var bulletBasic : PackedScene
#endregion

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func fireAbility(ID : int, origin_position, mouse_position) -> void: # I don't think I ever used this
	if(ID == 0):
		abilityTest(origin_position, mouse_position)

# TODO: All bullets will be deleted at the end of a turn so long as they are a child of the Bullets node
#region abilities
func abilityTest(origin_position : Vector2, mouse_position : Vector2) -> void:
	# Spawn in a few bullets with some variance to their direction and slight timing differences
	var target = mouse_position
	var offset = 75
	var speed = 150
	# Spawn bullet 1
	var bullet1 = bulletBasic.instantiate()
	bullet1.position = origin_position
	target.y = target.y + offset
	bullet1.target = target
	bullet1.allied = true
	bullet1.speed = speed
	add_child(bullet1)
	# Wait a few seconds
	await get_tree().create_timer(0.6).timeout
	
	target = mouse_position # For every new bullet, reset target to mouse position
	target.y = target.y - offset
	# Spawn bullet 2
	var bullet2 = bulletBasic.instantiate()
	bullet2.position = origin_position
	bullet2.target = target 
	bullet2.allied = true
	bullet2.speed = speed
	add_child(bullet2)
	# Wait a few seconds
	await get_tree().create_timer(0.8).timeout
	
	target = mouse_position
	# Spawn bullet 3
	var bullet3 = bulletBasic.instantiate()
	bullet3.position = origin_position
	bullet3.target = target
	bullet3.allied = true
	bullet3.speed = speed
	add_child(bullet3)
#endregion
