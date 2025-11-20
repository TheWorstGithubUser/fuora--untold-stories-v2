extends Area2D

@onready var random = RandomNumberGenerator.new()
var nextCharID : int
var lastCharID : int


signal damageTaken(nextMoron : int, damage : int)

func _ready() -> void:
	nextCharID = random.randi_range(0,2)
	nextCharID = CharacterDict.getCharacterInParty(nextCharID)
	lastCharID = -1

func _process(delta: float) -> void:
	pass

func selectionValidityCheck(nextCharID: int, lastCharID: int) -> int:
	if(nextCharID == lastCharID || CharacterDict.getCharacterAt(nextCharID).health <= 0):
		var partyPosition = CharacterDict.getPartyID(nextCharID)
		if(partyPosition == 0):
			partyPosition = random.randi_range(1,2)
			if(CharacterDict.getCharacterInParty(partyPosition) == lastCharID 
			|| CharacterDict.getCharacterAt(CharacterDict.getCharacterInParty(partyPosition)).health <= 0):
				if(partyPosition == 1):
					return CharacterDict.getCharacterInParty(2)
			else:
				nextCharID = CharacterDict.getCharacterInParty(partyPosition)
				return nextCharID
		if(partyPosition == 1):
			# Select random number 0 or 2
			partyPosition = random.randi_range(0,1)
			if(partyPosition == 1):
				partyPosition = 2
			
			if(CharacterDict.getCharacterInParty(partyPosition) == lastCharID 
			|| CharacterDict.getCharacterAt(CharacterDict.getCharacterInParty(partyPosition)).health <= 0):
				if(partyPosition == 0):
					return CharacterDict.getCharacterInParty(2)
			else:
				nextCharID = CharacterDict.getCharacterInParty(partyPosition)
				return nextCharID
		if(partyPosition == 2):
			partyPosition = random.randi_range(1,2)
			if(CharacterDict.getCharacterInParty(partyPosition) == lastCharID 
			|| CharacterDict.getCharacterAt(CharacterDict.getCharacterInParty(partyPosition)).health <= 0):
				if(partyPosition == 1):
					return CharacterDict.getCharacterInParty(2)
			else:
				nextCharID = CharacterDict.getCharacterInParty(partyPosition)
				return nextCharID
	return nextCharID

func _on_body_entered(body: Node2D) -> void:
	if(body.allied == false):
		#print("dealing damage to " + CharacterDict.getCharacterAt(nextCharID).characterName)
		damageTaken.emit(nextCharID, 10) # 10 is a test value # TODO: Pull damage from bullets instead of nowhere
		lastCharID = nextCharID
		nextCharID = random.randi_range(0,2) # random number 0 - 2
		nextCharID = CharacterDict.getCharacterInParty(nextCharID) # actual ID of party member
		nextCharID = selectionValidityCheck(nextCharID, lastCharID)
		body.queue_free()

func _on_signal_bus_btl_battle_phase_change() -> void:
	self.visible = !self.visible
