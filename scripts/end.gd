extends Area2D

@onready var game_manager = $"../GameManager"

func _on_body_entered(body):
	if body.name == "Character":
		game_manager._on_game_win()
		print("Congratulations ! You finished the game !")
		print("You got a score of : ", game_manager.get_points())
