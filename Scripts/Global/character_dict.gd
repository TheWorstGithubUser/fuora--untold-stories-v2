extends Node
# Global dictionary for storing relevant data for characters

class Character:
	var ID : int
	var abil_list : ItemList
	var maxHealth : int
	var health : int
	var mana : int
	var level = 1
	var animatedSprite : SpriteFrames

# Array for finding characters
var Characters = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var party = [-1, 0, 2] # Holds character IDs
# Default value for party is -1, which means no character is currently using that slot

func _ready() -> void:
	# Characters made on ready are their default values (level 1, undamaged, etc)
	# GameDictionary.get_child(0) refers to the Characters node
	# GameDictionary.get_child(0).get_child(Character.ID) refers to the sprite child in characters
	#region characters
	var testKnightOurple = Character.new()
	testKnightOurple.ID = 0
	testKnightOurple.maxHealth = 100
	testKnightOurple.health = testKnightOurple.maxHealth
	testKnightOurple.mana = 100
	testKnightOurple.animatedSprite = GameDictionary.get_child(0).get_child(testKnightOurple.ID).get_sprite_frames() 
	Characters.insert(testKnightOurple.ID, testKnightOurple)
	
	var testKnightBlue = Character.new()
	testKnightBlue.ID = 1
	testKnightBlue.maxHealth = 100
	testKnightBlue.health = testKnightBlue.maxHealth
	testKnightBlue.mana = 100
	testKnightBlue.animatedSprite = GameDictionary.get_child(0).get_child(testKnightBlue.ID).get_sprite_frames() 
	Characters.insert(testKnightBlue.ID, testKnightBlue)
	
	# TODO: Replace with something else because its using the same anims as blue
	var testKnightGreen = Character.new()
	testKnightGreen.ID = 2
	testKnightGreen.maxHealth = 100
	testKnightGreen.health = testKnightGreen.maxHealth
	testKnightGreen.mana = 100
	testKnightGreen.animatedSprite = GameDictionary.get_child(0).get_child(testKnightGreen.ID).get_sprite_frames()
	Characters.insert(testKnightGreen.ID, testKnightGreen)
	#ababababababababababa
	
	#endregion

func getCharacterAt(ID : int) -> Character:
	return Characters[ID]
	
func getCharacterInParty(ID : int) -> Character:
	return party[ID]
