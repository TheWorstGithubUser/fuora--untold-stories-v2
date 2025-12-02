extends Node
# Global dictionary for storing relevant data for characters

class Character:
	var ID : int
	var abil_list : Array
	var maxHealth : int
	var health : int
	var mana : int
	var level = 1
	var animatedSprite : SpriteFrames
	var characterName : String
	var cooldown = float(0.0)

# Array for finding characters
var Characters = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] # holds Characters
var party = [1, 3, 2] # Holds character IDs
# Default value for party is -1, which means no character is currently using that slot

func _ready() -> void:
	# Characters made on ready are their default values (level 1, undamaged, etc)
	# GameDictionary.get_child(0) refers to the Characters node
	# GameDictionary.get_child(0).get_child(Character.ID) refers to the sprite child in characters
	#region characters
	var testKnightOurple = Character.new()
	testKnightOurple.ID = 0
	testKnightOurple.abil_list = [0,1,2,3,4]
	testKnightOurple.maxHealth = 100
	testKnightOurple.health = testKnightOurple.maxHealth
	testKnightOurple.mana = 100
	testKnightOurple.animatedSprite = GameDictionary.get_child(0).get_child(testKnightOurple.ID).get_sprite_frames() 
	testKnightOurple.characterName = "Ourple Knight"
	Characters.insert(testKnightOurple.ID, testKnightOurple)
	
	var testKnightBlue = Character.new()
	testKnightBlue.ID = 1
	testKnightBlue.abil_list = [0,1,2,3,4]
	testKnightBlue.maxHealth = 100
	testKnightBlue.health = testKnightBlue.maxHealth
	testKnightBlue.mana = 100
	testKnightBlue.animatedSprite = GameDictionary.get_child(0).get_child(testKnightBlue.ID).get_sprite_frames() 
	testKnightBlue.characterName = "Blue Knight"
	Characters.insert(testKnightBlue.ID, testKnightBlue)
	
	var testKnightGreen = Character.new()
	testKnightGreen.ID = 2
	testKnightGreen.abil_list = [0,1,2,3,4]
	testKnightGreen.maxHealth = 100
	testKnightGreen.health = testKnightGreen.maxHealth
	testKnightGreen.mana = 100
	testKnightGreen.animatedSprite = GameDictionary.get_child(0).get_child(testKnightGreen.ID).get_sprite_frames()
	testKnightGreen.characterName = "Green Knight"
	Characters.insert(testKnightGreen.ID, testKnightGreen)
	
	var kota = Character.new()
	kota.ID = 3
	kota.abil_list = [0,1,2,3,4]
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

func setCooldown(ID: int, cooldown: float) -> void:
	getCharacterAt(ID).cooldown = cooldown

var allPartyMembersDefeated = false
func _process(delta : float) -> void:
	allPartyMembersDefeated = true
	for CharacterID in self.party:
		var character = getCharacterAt(getCharacterInParty(CharacterID-1))
		if(character.health >= 0):
			allPartyMembersDefeated = false
		if(character.cooldown > 0):		# Note for programming: cooldown will only be 0 on frame 1, and then never again
			character.cooldown -= delta
	if(allPartyMembersDefeated):
		get_tree().change_scene_to_file("res://Scenes/Demo Scenes/GameOver.tscn")
		
