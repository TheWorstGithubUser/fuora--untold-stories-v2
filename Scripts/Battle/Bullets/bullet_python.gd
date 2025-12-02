extends RigidBody2D

var segment : String 
var cursorPosition : Vector2
var speed = 750
var allied = true # constant
var direction : Vector2
var health = 999 # Actually just serves as damage to other nodes... oopsie
var damage = 999
var head
var body
var tail
@onready var animtedsprite2D = $AnimatedSprite2D

func _ready() -> void:
	if(segment == "Head"):
		animtedsprite2D.play("Head")
	elif(segment == "Body"):
		animtedsprite2D.play("Body")
	elif(segment == "Tail"):
		animtedsprite2D.play("Tail")

func _process(delta: float) -> void:
	if(segment == "Head"):
		cursorPosition = get_viewport().get_mouse_position()
		if(!check_distances(cursorPosition, self.position, 100)):
			direction = find_direction(cursorPosition)
			look_at(cursorPosition)
		self.position += direction.normalized() * speed * delta
	elif(segment == "Body"):
		if(!check_distances(head.position, self.position, 100)):
			direction = find_direction(head.position)
		look_at(head.position)
		self.position += direction.normalized() * speed * delta
	elif(segment == "Tail"):
		if(!check_distances(body.position, self.position, 100)):
			direction = find_direction(body.position)
		look_at(body.position)
		self.position += direction.normalized() * speed * delta

func find_direction(target : Vector2) -> Vector2:
	return Vector2(target.x - self.position.x, target.y - self.position.y)
	
func check_distances(p1 : Vector2, p2 : Vector2, margin : int) -> bool:
	if(p1.x >= p2.x - margin and p1.x <= p2.x + margin):
		if(p1.y >= p2.y - margin and p1.y <= p2.y + margin):
			return true
	return false

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Collision with enemies/players is done elsewhere
	if(body.allied == true):
		# Check if this bullet is allied
		if(self.allied == false):
			get_parent().health -= body.damage
	elif(self.allied == true):
		get_parent().health -= body.damage

func _on_area_2d_area_entered(area: Area2D) -> void:
	# Check if this is an enemy or player
	if(area.is_in_group("BattleHitbox") && area.allied == false):
		get_parent().health -= 999
