extends Node2D
# Non-editable variables
@export var bullet_basicScene : PackedScene
@onready var rng = RandomNumberGenerator.new()
@onready var elapsed_time = 0
var soul_target_pos : Vector2
var target_direction : Vector2
# editable variables
var bullet_cooldown = 5
var bullet_speed = 75
var y_offset = 700


func _ready() -> void:
	soul_target_pos = Vector2(452, 528) # This is where the soul is at rn at least
	target_direction = Vector2((soul_target_pos.x - global_position.x),((soul_target_pos.y + y_offset) - global_position.y))
	rng.randomize()

func _process(delta: float) -> void:
	elapsed_time += delta
	if(elapsed_time >= bullet_cooldown):
		# reset time
		elapsed_time = 0
		# Gemerate random spawn around the bullet rain
		var x = rng.randi_range(-400, 400)
		var y = rng.randi_range(-400, 400)
		if(x >= 0):
			x += 100
		else:
			x -= 100
		if(y >= 0):
			y += 100
		else:
			y -= 100
		var bullet_spawn_pos = Vector2(global_position.x + x, global_position.y + y)
		# Spawn a bullet that copies the angle from bullet_rain to the soul
		var bullet_basic = bullet_basicScene.instantiate()
		bullet_basic.position = bullet_spawn_pos
		bullet_basic.target = target_direction
		bullet_basic.speed = bullet_speed
		bullet_basic.health = 1
		bullet_basic.allied = false
		add_sibling(bullet_basic)
