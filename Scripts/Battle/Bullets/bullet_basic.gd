extends RigidBody2D
# bullet that fires in a straight line
# Pathing
var position_forward : Vector2

# Stats
@onready var health = 10
var speed = 50
var target : Vector2
var allied : bool

func find_direction() -> Vector2:
	return Vector2(target.x - self.position.x, target.y - self.position.y)

func _ready() -> void:
	add_constant_force(find_direction().normalized() * speed)
	self.linear_velocity = Vector2(find_direction().normalized() * speed)
	look_at(target)

func _physics_process(delta):
		if(global_position.x < -100): # will make some abilities not work if fired from the left 
			queue_free()					# but why would you ever do that

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
