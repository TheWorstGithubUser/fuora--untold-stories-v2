extends RigidBody2D
# Also used for bullet_python_tail
var head 
var target : Vector2
var direction : Vector2
var allied = true
@onready var speed = 500
var targetting_head = false

func _init() -> void:
	head = $".."

func _ready() -> void:
	head = $".."
	if(head.segments_active == 1):
		target = head.position
		head.segments_active += 1
		targetting_head = true
	else:
		target = head.body.position
		head.segments_active += 1

func _process(delta: float) -> void:
	if(targetting_head):
		target = head.position
	else:
		target = head.body.position
	if(!check_distances(target, self.position, 150)):
		direction = find_direction(target)
		look_at(target)
	self.position += direction.normalized() * speed * delta

func find_direction(target : Vector2) -> Vector2:
	return Vector2(target.x - self.position.x, target.y - self.position.y)
	
func check_distances(p1 : Vector2, p2 : Vector2, margin : int) -> bool:
	if(p1.x >= p2.x - margin and p1.x <= p2.x + margin):
		if(p1.y >= p2.y - margin and p1.y <= p2.y + margin):
			return true
	return false
