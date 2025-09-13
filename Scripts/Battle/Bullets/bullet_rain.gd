extends Node2D

@onready var elapsed_time = 0
var soul_target_pos : Vector2
var target_direction : Vector2
@export var bullet_basicScene : PackedScene

func _ready() -> void:
	soul_target_pos = Vector2(452, 528) # This is where the soul is at rn at least
	target_direction = Vector2((soul_target_pos.x - global_position.x),(soul_target_pos.y - global_position.y))


func _process(delta: float) -> void:
	elapsed_time += delta
	if(elapsed_time >= 1):
		# reset time
		elapsed_time = 0
		# Gemerate random spawn around the bullet rain
		var x = randi() % 250 - 250
		var y = randi() % 750 - 750
		var bullet_spawn_pos = Vector2(global_position.x + x, global_position.y + y)
		# Spawn a bullet that copies the angle from bullet_rain to the soul
		var bullet_basic = bullet_basicScene.instantiate()
		bullet_basic.position = bullet_spawn_pos
		bullet_basic.target = target_direction
		add_sibling(bullet_basic)
