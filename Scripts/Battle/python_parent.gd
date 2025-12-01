extends Node

# Holds Python's information, updated by each segment of Python
var health = 10

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if(health <= 0):
		queue_free()
