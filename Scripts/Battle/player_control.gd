extends Node

# TODO: will need access to an ability dictionary for party members

# Signals
signal battlePhaseStart()

# UI
@onready var party1SelectUI = $"../AbilitySelectPhase/Control/Party 1 Select"
@onready var party2SelectUI = $"../AbilitySelectPhase/Control/Party 2 Select"
@onready var party3SelectUI = $"../AbilitySelectPhase/Control/Party 3 Select"
@onready var abilitySelectUI = $"../AbilitySelectPhase/Control/AbilitySelect"
@onready var battleInfoUI = $"../AbilitySelectPhase/Control/Battle info"
@onready var bottomBarUI = $"../AbilitySelectPhase/Control/ReferenceRect"

# Logic
@onready var currentlySelecting = 1 # used to define who is currently being selected in UI
@onready var battlePhase = false # false means player is selecting their abilities


func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if(battlePhase):
		# Player can change which party member is selected
		
		pass
	
# Sets the ability for this character to be using
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

# Party member 1
func _on_attack_button_pressed() -> void:
	party1SelectUI.set_visible(false) # Make party 1's selection invisible
	party2SelectUI.set_visible(true) # Make party 2's selection visible
	print("ATTACKK!!!!")
	# TODO: Set party member 1's selection to attack

func _on_special_button_pressed() -> void:
	print("Special!!")
	currentlySelecting = 1
	# Allow player to choose a special move
	abilitySelectUI.set_visible(true) # Make ability select visible
	party1SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

func _on_item_button_pressed() -> void:
	print("Item...")
	currentlySelecting = 1
	# Allow player to choose an item
		# Access player's stored items TODO: make that
		# If there's more than 4 items, create two arrows to cycle through them
	abilitySelectUI.set_visible(true) # Make ability select visible
	party1SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

# Party member 2
func _on_attack_button_2_pressed() -> void:
	party2SelectUI.set_visible(false) # Make party 2's selection invisible
	party3SelectUI.set_visible(true) # Make party 3's selection visible
	print("ATTACKK!!!!")
	# TODO: Set party member 2's selection to attack

func _on_special_button_2_pressed() -> void:
	print("Special!!")
	currentlySelecting = 2
	# Allow player to choose a special move
	abilitySelectUI.set_visible(true) # Make ability select visible
	party2SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

func _on_item_button_2_pressed() -> void:
	print("Item...")
	currentlySelecting = 2
	# Allow player to choose an item
		# Access player's stored items TODO: make that
		# If there's more than 4 items, create two arrows to cycle through them
	abilitySelectUI.set_visible(true) # Make ability select visible
	party2SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

# Party member 3
func _on_attack_button_3_pressed() -> void:
	party3SelectUI.set_visible(false) # Make party 3's selection invisible
	print("ATTACKK!!!!")
	battlePhase = true # might be redundant
	battlePhaseStart.emit()
	battleInfoUI.set_visible(false)
	bottomBarUI.set_visible(false)
	# TODO: Set party member 1's selection to attack

func _on_special_button_3_pressed() -> void:
	print("Special!!")
	currentlySelecting = 3
	# Allow player to choose a special move
	abilitySelectUI.set_visible(true) # Make ability select visible
	party3SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

func _on_item_button_3_pressed() -> void:
	print("Item...")
	currentlySelecting = 3
	# Allow player to choose an item
		# Access player's stored items TODO: make that
		# If there's more than 4 items, create two arrows to cycle through them
	abilitySelectUI.set_visible(true) # Make ability select visible
	party3SelectUI.set_visible(false) # Make party 1's selection invisible
	battleInfoUI.set_visible(false)

# Ability/Item select
func _on_ability_1_pressed() -> void:
	# Set ability/item 1 as this party members choice
	if(currentlySelecting == 1):
		party2SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
	elif(currentlySelecting == 2):
		party3SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
	elif(currentlySelecting == 3):
		abilitySelectUI.set_visible(false) # Make ability select invisible
		bottomBarUI.set_visible(false)
		# end of selection phase
		battlePhase = true # might be redundant
		battlePhaseStart.emit()
	

func _on_ability_2_pressed() -> void:
	# Set ability/item 1 as this party members choice
	if(currentlySelecting == 1):
		party2SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
	elif(currentlySelecting == 2):
		party3SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
	elif(currentlySelecting == 3):
		abilitySelectUI.set_visible(false) # Make ability select invisible
		bottomBarUI.set_visible(false)
		# end of selection phase
		battlePhase = true # might be redundant
		battlePhaseStart.emit()

func _on_ability_3_pressed() -> void:
	# Set ability/item 1 as this party members choice
	if(currentlySelecting == 1):
		party2SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
	elif(currentlySelecting == 2):
		party3SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
	elif(currentlySelecting == 3):
		abilitySelectUI.set_visible(false) # Make ability select invisible
		bottomBarUI.set_visible(false)
		# end of selection phase
		battlePhase = true # might be redundant
		battlePhaseStart.emit()

func _on_ability_4_pressed() -> void:
	# Set ability/item 1 as this party members choice
	if(currentlySelecting == 1):
		party2SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
	elif(currentlySelecting == 2):
		party3SelectUI.set_visible(true) # Make party 2's selection visible
		abilitySelectUI.set_visible(false) # Make ability select invisible
		battleInfoUI.set_visible(true)
	elif(currentlySelecting == 3):
		abilitySelectUI.set_visible(false) # Make ability select invisible
		bottomBarUI.set_visible(false)
		# end of selection phase
		battlePhase = true # might be redundant
		battlePhaseStart.emit()
