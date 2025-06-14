extends Area2D
@export var AreaID : int # ID of the area this load zone will teleport the player to.
@export var dictionary : Node2D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Player")):
		print("Warp player somewhere else")
	pass
