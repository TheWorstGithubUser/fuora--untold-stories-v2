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
var allEnemiesDefeated = false

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
	allEnemiesDefeated = true
	for enemies in enemyParty:
		if(enemies != -2):
			allEnemiesDefeated = false
	if(allEnemiesDefeated):
		allEnemiesDefeated = false
		for enemies in enemyParty:
			enemyParty[enemies] = -1
		get_tree().change_scene_to_file("res://Scenes/Demo Scenes/Victory.tscn")

func getEnemyAt(ID : int) -> Enemy:
	return Enemies[ID]

func removeFromParty(position : int) -> void:
	if(position >= 3 or position <= -1):
		print("Invalid enemy member position. Valid inputs are 0, 1, and 2.")
	else:
		enemyParty[position] = -2

func addToParty(ID : int, position : int) -> void:
	if(position >= 3 or position <= -1):
		print("Invalid enemy member position. Valid inputs are 0, 1, and 2.")
	else:
		enemyParty[position] = ID
