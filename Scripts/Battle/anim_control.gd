extends Node
# Party members animated sprites
var party1 : AnimatedSprite2D
var party2 : AnimatedSprite2D
var party3 : AnimatedSprite2D

# Timers for returning to idle animation
var p1Timer = 2.0
var p2Timer = 2.0
var p3Timer = 2.0

func _ready() -> void:
	party1 = $"../Party/character_btl/AnimatedSprite2D"
	party2 = $"../Party/character_btl2/AnimatedSprite2D"
	party3 = $"../Party/character_btl3/AnimatedSprite2D"

func _process(delta: float) -> void:
	if(party1.animation == "Attack"):
		p1Timer -= delta
	if(party2.animation == "Attack"):
		p2Timer -= delta
	if(party3.animation == "Attack"):
		p3Timer -= delta
	
	if(p1Timer <= 0):
		party1.play("Idle")
		p1Timer = 2.0
	if(p2Timer <= 0):
		party2.play("Idle")
		p2Timer = 2.0
	if(p3Timer <= 0):
		party3.play("Idle")
		p3Timer = 2.0
		

func changeAnimation(partyNum : int, animation : String) -> void:
	if(partyNum == 1):
		party1.play(animation)
	if(partyNum == 2):
		party2.play(animation)
	if(partyNum == 3):
		party3.play(animation)
