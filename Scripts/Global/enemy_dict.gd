extends Node
# Global(?) dictionary for storing relevant data for enemies

class Enemy:
	var ID : int
	var abil_list : ItemList
	var maxHealth : int
	var health : int
	var animatedSprite : SpriteFrames

var Enemies = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] # idk how to size arrays 
var enemyParty = [-1, -1, -1]

func _ready() -> void:
	#region enemies
	var Malhound = Enemy.new()
	Malhound.ID = 0
	Malhound.maxHealth = 100
	Malhound.health = Malhound.maxHealth
	Malhound.animatedSprite = GameDictionary.get_child(2).get_child(Malhound.ID).get_sprite_frames() 
	Enemies.insert(Malhound.ID, Malhound)
	
	#endregion

func _process(delta: float) -> void:
	pass
	
func getEnemyAt(ID : int) -> Enemy:
	return Enemies[ID]
