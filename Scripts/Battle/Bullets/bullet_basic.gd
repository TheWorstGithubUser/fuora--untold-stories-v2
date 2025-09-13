extends RigidBody2D
# Enemy bullet that fires in a straight line
# Pathing
var position_forward : Vector2

# Stats
@onready var health = 10
var speed = 50
var target_offset = 50
var target : Vector2

func _ready() -> void:
	#target = Vector2(452, 528)
	add_constant_force(target.normalized() * speed)
	look_at(target)
	
func _physics_process(delta):
		#look_at(target)
		pass
