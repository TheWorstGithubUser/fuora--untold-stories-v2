extends Area2D

@onready var random = RandomNumberGenerator.new()
var nextMoronToTakeDamage : int
var lastMoronThatTookDamage : int

signal damageTaken(nextMoron : int, damage : int)

func _ready() -> void:
	nextMoronToTakeDamage = random.randi_range(0,2)
	lastMoronThatTookDamage = -1

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	damageTaken.emit(nextMoronToTakeDamage, 10) # 10 is a test value
	lastMoronThatTookDamage = nextMoronToTakeDamage
	nextMoronToTakeDamage = random.randi_range(0,2)
	if(nextMoronToTakeDamage == lastMoronThatTookDamage):
		if(nextMoronToTakeDamage == 0):
			nextMoronToTakeDamage == 1
		elif(nextMoronToTakeDamage == 1):
			nextMoronToTakeDamage == 2
		else:
			nextMoronToTakeDamage = 0
	body.queue_free()
