extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	CharacterDict.getCharacterAt(3).health = 100
	CharacterDict.getCharacterAt(2).health = 100
	CharacterDict.getCharacterAt(1).health = 100
	CharacterDict.resetting = false
	get_tree().change_scene_to_file("res://Scenes/Battle/battle.tscn")
