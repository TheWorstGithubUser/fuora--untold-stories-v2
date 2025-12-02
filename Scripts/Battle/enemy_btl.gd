extends Area2D
@onready var animatedSprite = $AnimatedSprite2D
@onready var rng = RandomNumberGenerator.new()

@export var abilityDict : Node
@export var positionID : int # Acceptable positions are 0, 1, and 2
var enemyID : int # TODO: ID must be pulled from somewhere else on battle start
@onready var battlePhase = false

var allied = false
var health = 10
var alive = true

func _ready() -> void:
	rng.randomize()
	if(enemyID != -1):
		EnemyDict.addToParty(enemyID, positionID)
		var enemy = EnemyDict.getEnemyAt(enemyID)
		animatedSprite.set_sprite_frames(enemy.animatedSprite)
		animatedSprite.play("Idle")
	else:
		# TODO: This enemies existence should be ignored
		# It shouldn't take damage, perform its turn, etc
		pass

@onready var timer = 0
var cooldown = 7
func _process(delta: float) -> void:
	if(health <= 0):
		EnemyDict.removeFromParty(positionID)
		queue_free()
	timer += delta
	if(timer >= cooldown and battlePhase == true):
		use_random_ability()
		timer = 0

func use_ability(ability: String) -> void:
	if(ability == "rain"):
		abilityDict.bullet_rain(Vector2(2300, -150))
		
func use_random_ability() -> void:
	var randomInt = rng.randi_range(0, 4)
	if(randomInt == 0):
		abilityDict.bullet_rain(Vector2(2300, -150))
	elif(randomInt == 1):
		abilityDict.bullet_tank(self.position)
	elif(randomInt == 2):
		abilityDict.bullet_explode(self.position)
	elif(randomInt == 3):
		abilityDict.bullet_explode(self.position)
	elif(randomInt == 4):
		abilityDict.bullet_rain(Vector2(2300, -150))
		

func _on_signal_bus_btl_battle_phase_change() -> void:
	battlePhase = !battlePhase
	if(battlePhase == true):
		use_ability("rain")
		#abilityDict.bullet_tank(self.position)
		#abilityDict.abilityTest(Vector2(position.x,position.y))

func _on_body_entered(body: Node2D) -> void:
	if(body.allied == true):
		health -= body.health
		body.health -= 999
		#body.queue_free()
