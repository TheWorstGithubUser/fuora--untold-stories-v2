extends RigidBody2D
# bullet that fires in a straight line but is big and takes more hits

# Stats
var health = 5
var speed = 50
var target : Vector2
var allied : bool
var direction : Vector2

func find_direction() -> Vector2:
	return Vector2(target.x - self.position.x, target.y - self.position.y)

func _ready() -> void:
	target = Vector2(452, 528)
	direction = find_direction()
	look_at(target)

func _physics_process(delta):
		self.position += direction.normalized() * speed * delta
		if(global_position.x < -100): # will make some abilities not work if fired from the left 
			queue_free()					# but why would you ever do that
		if(health <= 0): # Die
			queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Collision with enemies/players is done elsewhere
	# Destroy this bullet if colliding with an opposing bullet
	if(body.allied == true):
		# Check if this bullet is allied
		if(self.allied == false):
			health -= body.health
	elif(self.allied == true):
		health -= body.health
