extends Node

# Signals & Dictionary
signal battlePhaseStart()
@onready var abil_dict = $player_abil_dict

# UI
@onready var party1SelectUI = $"../AbilitySelectPhase/Control/Party 1 Select"
@onready var party2SelectUI = $"../AbilitySelectPhase/Control/Party 2 Select"
@onready var party3SelectUI = $"../AbilitySelectPhase/Control/Party 3 Select"
@onready var abilitySelectUI = $"../AbilitySelectPhase/Control/AbilitySelect"
@onready var battleInfoUI = $"../AbilitySelectPhase/Control/Battle info"
@onready var bottomBarUI = $"../AbilitySelectPhase/Control/battle info ref rect"
@onready var battleSelectionUI = $"../AbilitySelectPhase/Control/CurrentSelectionRefRect"

# Logic
var currentlySelecting = 1 # used to define who is currently being selected in UI
var battlePhase = false # false means player is selecting their abilities
var currentActiveParty = 1
var timer = 0
var party1Selection = -1 # 1 - 4 = Special 1 - 4
var party2Selection = -1 # 5 = Basic attack
var party3Selection = -1 # 6 = Item was used
var partyMemberIsAttacking = false
# party positions (must be edited manually if moved)
var party1Position = Vector2(151,198)
var party2Position = Vector2(157, 527)
var party3Position = Vector2(149, 878)
# Input
var cursorPosition : Vector2
# Animations
@onready var anim_controller = $"../AnimationController"

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	cursorPosition = get_viewport().get_mouse_position() # Mouse input
	if(battlePhase):
		var currentPartyMember = CharacterDict.getCharacterAt(CharacterDict.getCharacterInParty(currentActiveParty-1))
		if(partyMemberIsAttacking and currentPartyMember.cooldown <= 0): # Z (A party member is now ready to attack, and player cannot choose another character)
				anim_controller.changeAnimation(currentActiveParty, "Selected")
				if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
					# TODO: Find which ability is associated with the selection player made
					if(currentActiveParty == 1):
						#region party1Selection
						if(party1Selection == 1): # Special 1
							# find the ability, fire it, and reset
							var abilityID = currentPartyMember.abil_list[0]
							abil_dict.fireAbility(abilityID, party1Position, cursorPosition)
							partyMemberIsAttacking = false
							currentPartyMember.cooldown = 5
							anim_controller.changeAnimation(currentActiveParty, "Attack")
						elif(party1Selection == 2): # Special 2
							# find the ability, fire it, and reset
							var abilityID = currentPartyMember.abil_list[1]
							abil_dict.fireAbility(abilityID, party1Position, cursorPosition)
							partyMemberIsAttacking = false
							currentPartyMember.cooldown = 5
							anim_controller.changeAnimation(currentActiveParty, "Attack")
						elif(party1Selection == 3): # Special 3
							# find the ability, fire it, and reset
							var abilityID = currentPartyMember.abil_list[2]
							abil_dict.fireAbility(abilityID, party1Position, cursorPosition)
							partyMemberIsAttacking = false
							currentPartyMember.cooldown = 5
							anim_controller.changeAnimation(currentActiveParty, "Attack")
						elif(party1Selection == 4): # Special 4
							# find the ability, fire it, and reset
							var abilityID = currentPartyMember.abil_list[3]
							abil_dict.fireAbility(abilityID, party1Position, cursorPosition)
							partyMemberIsAttacking = false
							currentPartyMember.cooldown = 5
							anim_controller.changeAnimation(currentActiveParty, "Attack")
						elif(party1Selection == 5): # Basic attack
							pass
						elif(party1Selection == 6): # Item
							pass
						#endregion
					elif(currentActiveParty == 2):
						pass
					elif(currentActiveParty == 3):
						pass
					pass
		else:
			battleSelectionUI.set_visible(true)
			timer += delta
			# Player can change which party member is selected
			# There needs to be a delay so that the selection doesnt change every frame
			if(timer >= 0.15):
				#region input control
				if(Input.is_action_pressed("ui_up")):
					currentActiveParty = currentActiveParty - 1
					timer = 0
				if(Input.is_action_pressed("ui_down")):
					currentActiveParty = currentActiveParty + 1
					timer = 0
				# clamp between 1 - 3, sorta
				if(currentActiveParty <= 0):
					currentActiveParty = 3
				if(currentActiveParty >= 4):
					currentActiveParty = 1
				
				if(Input.is_action_pressed("ui_select")): # Z (A party member is now ready to attack, and player cannot choose another character)
					print(str(currentActiveParty) + " is attacking or something")
					partyMemberIsAttacking = true
					#TODO: Put this party member on a cooldown so they cannot attack again
				#endregion
			#region UI
			if(currentActiveParty == 1):
				battleSelectionUI.position = Vector2(97, 107)
			elif(currentActiveParty == 2):
				battleSelectionUI.position = Vector2(97, 434)
			elif(currentActiveParty == 3):
				battleSelectionUI.position = Vector2(97, 779)
			#endregion
			
	elif(battlePhase == false):
		battleSelectionUI.set_visible(false)


# TODO: Sets the ability for this character to be using
func _setAbility(positionID: int, selection: int) -> void:
	if(selection == 0): # Basic attack
		pass
	if(selection == 1): # Ability 1
		pass
	if(selection == 2): # Ability 2
		pass
	if(selection == 3): # Ability 3
		pass
	if(selection == 4): # Ability 4
		pass

#region ability select phase
# Party member 1
func _on_attack_button_pressed() -> void:
	party1SelectUI.set_visible(false) # Make party 1's selection invisible
	party2SelectUI.set_visible(true) # Make party 2's selection visible
	print("Party1 has selected a basic attack")
	party1Selection = 5

func _on_special_button_pressed() -> void:
	print("Party1 is choosing a special ability")
	currentlySelecting = 1
	# Allow player to choose a special move
	abilitySelectUI.set_visible(true) # Make ability select visible
	party1SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

func _on_item_button_pressed() -> void:
	print("Party1 is choosing an item")
	currentlySelecting = 1
	# Allow player to choose an item
		# Access player's stored items TODO: make that
		# If there's more than 4 items, create two arrows to cycle through them
	abilitySelectUI.set_visible(true) # Make ability select visible
	party1SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)
	party1Selection = 6

# Party member 2
func _on_attack_button_2_pressed() -> void:
	party2SelectUI.set_visible(false) # Make party 2's selection invisible
	party3SelectUI.set_visible(true) # Make party 3's selection visible
	print("Party2 has selected a basic attack")
	party2Selection = 5

func _on_special_button_2_pressed() -> void:
	print("Party2 is choosing a special ability")
	currentlySelecting = 2
	# Allow player to choose a special move
	abilitySelectUI.set_visible(true) # Make ability select visible
	party2SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

func _on_item_button_2_pressed() -> void:
	print("Party2 is choosing an item")
	currentlySelecting = 2
	# Allow player to choose an item
		# Access player's stored items TODO: make that
		# If there's more than 4 items, create two arrows to cycle through them
	abilitySelectUI.set_visible(true) # Make ability select visible
	party2SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)
	party2Selection = 6

# Party member 3
func _on_attack_button_3_pressed() -> void:
	party3SelectUI.set_visible(false) # Make party 3's selection invisible
	print("Party3 has selected a basic attack")
	battlePhase = true # might be redundant
	battlePhaseStart.emit()
	battleInfoUI.set_visible(false)
	bottomBarUI.set_visible(false)
	party3Selection = 5

func _on_special_button_3_pressed() -> void:
	print("Party3 is choosing a special ability")
	currentlySelecting = 3
	# Allow player to choose a special move
	abilitySelectUI.set_visible(true) # Make ability select visible
	party3SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

func _on_item_button_3_pressed() -> void:
	print("Party3 is choosing an item")
	currentlySelecting = 3
	# Allow player to choose an item
		# Access player's stored items TODO: make that
		# If there's more than 4 items, create two arrows to cycle through them
	abilitySelectUI.set_visible(true) # Make ability select visible
	party3SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)
	party1Selection = 6

# Ability/Item select
func _on_ability_1_pressed() -> void:
	# Set ability/item 1 as this party members choice
	if(currentlySelecting == 1):
		party2SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
		party1Selection = 1
	elif(currentlySelecting == 2):
		party3SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
		party2Selection = 1
	elif(currentlySelecting == 3):
		abilitySelectUI.set_visible(false) # Make ability select invisible
		bottomBarUI.set_visible(false)
		party3Selection = 1
		# end of selection phase
		battlePhase = true # might be redundant
		battlePhaseStart.emit()
	

func _on_ability_2_pressed() -> void:
	# Set ability/item 1 as this party members choice
	if(currentlySelecting == 1):
		party2SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
		party1Selection = 2
	elif(currentlySelecting == 2):
		party3SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
		party2Selection = 2
	elif(currentlySelecting == 3):
		abilitySelectUI.set_visible(false) # Make ability select invisible
		bottomBarUI.set_visible(false)
		party3Selection = 2
		# end of selection phase
		battlePhase = true # might be redundant
		battlePhaseStart.emit()

func _on_ability_3_pressed() -> void:
	# Set ability/item 1 as this party members choice
	if(currentlySelecting == 1):
		party2SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
		party1Selection = 3
	elif(currentlySelecting == 2):
		party3SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
		party2Selection = 3
	elif(currentlySelecting == 3):
		abilitySelectUI.set_visible(false) # Make ability select invisible
		bottomBarUI.set_visible(false)
		party3Selection = 3
		# end of selection phase
		battlePhase = true # might be redundant
		battlePhaseStart.emit()

func _on_ability_4_pressed() -> void:
	# Set ability/item 1 as this party members choice
	if(currentlySelecting == 1):
		party2SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
		party1Selection = 4
	elif(currentlySelecting == 2):
		party3SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
		party2Selection = 4
	elif(currentlySelecting == 3):
		abilitySelectUI.set_visible(false) # Make ability select invisible
		bottomBarUI.set_visible(false)
		party3Selection = 4
		# end of selection phase
		battlePhase = true # might be redundant
		battlePhaseStart.emit()
#endregion
