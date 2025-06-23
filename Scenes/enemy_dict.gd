extends Node
# Global(?) dictionary for storing relevant data for characters

class Enemy:
	var ID : int
	var abil_list : ItemList
	var maxHealth : int
	var health : int
	var animatedSprite : SpriteFrames

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass
