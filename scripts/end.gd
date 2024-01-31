extends Area2D

@onready var game_manager = $"../GameManager"

func _on_body_entered(body):
	if body.name == "Character":
		print("Congratulations ! You finished the game !")
		print("You got a score of : ", game_manager.score)
