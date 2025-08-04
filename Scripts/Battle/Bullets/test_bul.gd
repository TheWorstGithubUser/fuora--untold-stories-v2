extends Area2D
# This is supposed to be an enemy bullet, by the way

# but it ended up being unused. Oh well.
# TODO: Delete this script once it's been fully replaced

var soul_target_pos : Vector2

func _ready() -> void:
	soul_target_pos = Vector2(452, 528) # This is where the soul is at rn at least
	

func _physics_process(delta: float) -> void:
	# go zoom
	position -= transform.x * 50 * delta
	print(position)
