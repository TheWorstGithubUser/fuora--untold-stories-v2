extends RigidBody2D
# Enemy bullet that fires in a straight line and explodes into smaller bullets after a set time
# Chosen bullet
@export var bullet_miniScene : PackedScene
# Pathing
var elapsed_time = 0
@onready var rng = RandomNumberGenerator.new()
@onready var soul_target_pos = Vector2(452, 528)

# Stats
@onready var health = 10
var speed = 50
var target : Vector2
var time_to_travel = 5
var allied : bool


func _ready() -> void:
	# create offsets
	rng.randomize()
	var target_offsetx = rng.randi_range(-200, 200)
	var target_offsety = rng.randi_range(-200, 200)
	# choose direction to target
	target = Vector2((soul_target_pos.x - global_position.x),(soul_target_pos.y - global_position.y))
	target = Vector2(target.x + target_offsetx, target.y + target_offsety)
	add_constant_force(target.normalized() * speed)
	look_at(target)
	
	
func _physics_process(delta):
		elapsed_time += delta
		if(elapsed_time >= time_to_travel):
			# spawn 3 mini projectiles
			var bullet_spawn_pos = Vector2(global_position.x, global_position.y)
			# bullet 1
			var bullet1 = bullet_miniScene.instantiate()
			bullet1.position = bullet_spawn_pos
			# this one shoots directly up
			bullet1.target = Vector2(0,-3000)
			bullet1.allied = self.allied
			add_sibling(bullet1)
			# bullet 2
			var bullet2 = bullet_miniScene.instantiate()
			bullet2.position = bullet_spawn_pos
			# this one shoots down and to the left
			bullet2.target = Vector2(-3000,3000)
			bullet2.allied = self.allied
			add_sibling(bullet2)
			# bullet 3
			var bullet3_spawn_pos = Vector2(global_position.x, global_position.y)
			var bullet3 = bullet_miniScene.instantiate()
			bullet3.position = bullet_spawn_pos
			# this one shoots down and to the right
			bullet3.target = Vector2(3000,3000)
			bullet3.allied = self.allied
			add_sibling(bullet3)
			# and then die
			queue_free()
		
