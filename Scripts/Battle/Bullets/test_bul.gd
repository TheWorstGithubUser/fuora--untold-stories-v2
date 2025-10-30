extends CharacterBody2D
# This is supposed to be an enemy bullet, by the way
# Pathing
var soul_target_pos : Vector2
@onready var elapsed_time = 0
var position_forward : Vector2
var allied = false

# Stats
@onready var health = 10


func _ready() -> void:
	soul_target_pos = Vector2(452, 528) # This is where the soul is at rn at least
	var x = self.position.x - 2000
	position_forward = Vector2(x,self.position.y)
	
func _physics_process(delta):
	if(elapsed_time >= 6):
		velocity = position.direction_to(soul_target_pos) * 100
		look_at(soul_target_pos)
		move_and_slide()
	else:
		velocity = position.direction_to(position_forward) * 100
		# look_at(soul_target_pos)
		move_and_slide()
		elapsed_time += 1 * delta
	
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
