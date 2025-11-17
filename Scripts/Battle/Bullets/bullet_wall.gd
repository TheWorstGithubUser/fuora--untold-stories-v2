extends RigidBody2D
# bullet that fires in a straight line

# Stats
var health = 5
var fadeTime = 10 # Seconds
var speed = 150
var afterSpeed = 30
var allied : bool
# Pathing
var target : Vector2
var direction : Vector2
var hit_target = false

func find_direction() -> Vector2:
	return Vector2(target.x - self.position.x, target.y - self.position.y)

func _ready() -> void:
	direction = find_direction()
	look_at(target)

func _physics_process(delta):
	if(!check_distances(self.position, target, 1) and fadeTime >= 5 and hit_target == false):
		self.position += direction.normalized() * speed * delta
	else:
		self.position += direction.normalized() * afterSpeed * delta
		hit_target = true
	fadeTime -= delta
	if(global_position.x < -100): # will make some abilities not work if fired from the left 
		queue_free()					# but why would you ever do that
	if(health <= 0): # Die
		queue_free()
	if(fadeTime <= 0): # Die
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Collision with enemies/players is done elsewhere
	# Damage this bullet if colliding with an opposing bullet
	if(body.allied == true):
		# Check if this bullet is allied
		if(self.allied == false):
			health -= body.health
	elif(self.allied == true):
		health -= body.health
		
func check_distances(p1 : Vector2, p2 : Vector2, margin : int) -> bool:
	if(p1.x >= p2.x - margin and p1.x <= p2.x + margin):
		if(p1.y >= p2.y - margin and p1.y <= p2.y + margin):
			return true
	return false
