extends RigidBody2D
# bullet that travels a definite distance rather than infinite
# Pathing
var elapsed_time = 0
var elapsed_time2 = 0

# Stats
@onready var health = 10
var speed = 300
var target : Vector2
var time_to_travel = 3.5

func _ready() -> void:
	add_constant_force(target.normalized() * speed)
	self.linear_damp = 0
	look_at(target)
	
func _physics_process(delta):
		elapsed_time += delta
		elapsed_time2 += delta * 10
		# Bullet should gradually slow-down
		if(elapsed_time2 >= time_to_travel / elapsed_time):
			self.linear_damp += 1
			elapsed_time2 = 0
		
		if(elapsed_time >= time_to_travel):
			queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Collision with enemies/players is done elsewhere
	# Destroy this bullet if colliding with an opposing bullet
	print("collision")
	if(body.allied == true):
		# Check if this bullet is allied
		if(self.allied == false):
			queue_free()
	elif(self.allied == true):
		queue_free()
