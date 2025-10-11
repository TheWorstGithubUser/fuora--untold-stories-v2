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
	var characterName : String

# Array for finding characters
var Characters = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] # idk how to set array lengths
var party = [1, 3, 2] # Holds character IDs
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
	testKnightOurple.characterName = "Ourple Knight"
	Characters.insert(testKnightOurple.ID, testKnightOurple)
	
	var testKnightBlue = Character.new()
	testKnightBlue.ID = 1
	testKnightBlue.maxHealth = 100
	testKnightBlue.health = testKnightBlue.maxHealth
	testKnightBlue.mana = 100
	testKnightBlue.animatedSprite = GameDictionary.get_child(0).get_child(testKnightBlue.ID).get_sprite_frames() 
	testKnightBlue.characterName = "Blue Knight"
	Characters.insert(testKnightBlue.ID, testKnightBlue)
	
	# TODO: Replace with something else because its using the same anims as blue
	var testKnightGreen = Character.new()
	testKnightGreen.ID = 2
	testKnightGreen.maxHealth = 100
	testKnightGreen.health = testKnightGreen.maxHealth
	testKnightGreen.mana = 100
	testKnightGreen.animatedSprite = GameDictionary.get_child(0).get_child(testKnightGreen.ID).get_sprite_frames()
	testKnightGreen.characterName = "Green Knight"
	Characters.insert(testKnightGreen.ID, testKnightGreen)
	#ababababababababababa
	
	var kota = Character.new()
	kota.ID = 3
	kota.maxHealth = 100
	kota.health = kota.maxHealth
	kota.mana = 100
	kota.animatedSprite = GameDictionary.get_child(0).get_child(kota.ID).get_sprite_frames()
	kota.characterName = "Kota"
	Characters.insert(kota.ID, kota)
	
	#endregion

func getCharacterAt(ID : int) -> Character:
	return Characters[ID]
	
func getCharacterInParty(ID : int) -> int:
	return party[ID]
	
func getPartyID(ID : int) -> int:
	for i in range(3):
		if(ID == getCharacterInParty(i)):
			return i
	print("Error: Party member not in the party. Selected ID was " + str(ID))
	return -1
