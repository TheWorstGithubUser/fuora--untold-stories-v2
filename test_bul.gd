extends RigidBody2D
# This is supposed to be an enemy bullet, by the way

var soul_target_pos : Vector2

func _ready() -> void:
	soul_target_pos = Vector2(452, 528) # This is where it's at rn at least
	pass 

func _process(delta: float) -> void:
	pass

func fire(direction : Vector2) -> void:
	# make them go pew pew!!!!! >w<
	# most likely going to be called by enemy_btl
	pass
