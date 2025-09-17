extends Area2D

@onready var random = RandomNumberGenerator.new()
var nextCharID : int
var lastCharID : int

signal damageTaken(nextMoron : int, damage : int)

func _ready() -> void:
	nextCharID = random.randi_range(0,2)
	lastCharID = -1

func _process(delta: float) -> void:
	pass

# TODO: Perform check on morons to make sure they arent dead before selecting them for damage
# TODO: Pull damage from bullets instead of nowhere
func _on_body_entered(body: Node2D) -> void:
	damageTaken.emit(nextCharID, 34) # 34 is a test value
	lastCharID = nextCharID
	nextCharID = random.randi_range(0,2)
	if(nextCharID == lastCharID):
		if(nextCharID == 0):
			nextCharID == 1
		elif(nextCharID == 1):
			nextCharID == 2
		else:
			nextCharID = 0
	body.queue_free()
