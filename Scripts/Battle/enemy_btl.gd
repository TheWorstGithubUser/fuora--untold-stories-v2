extends Area2D
@onready var animatedSprite = $AnimatedSprite2D

@export var abilityDict : Node
@export var positionID : int # Acceptable positions are 0, 1, and 2
var enemyID : int # TODO: ID must be pulled from somewhere else on battle start

func _ready() -> void:
	if(enemyID != -1):
		var enemy = EnemyDict.getEnemyAt(enemyID)
		animatedSprite.set_sprite_frames(enemy.animatedSprite)
		animatedSprite.play("Idle")
		#abilityDict.abilityTest(self.position)
		#abilityDict.bullet_rain(Vector2(2300, -150))
		#abilityDict.bullet_explode(self.position)
	else:
		# TODO: This enemies existence should be ignored
		# It shouldn't take damage, perform its turn, etc
		pass

func _process(delta: float) -> void:
	pass
