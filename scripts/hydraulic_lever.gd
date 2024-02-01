extends Area2D

@onready var game_manager = $"../GameManager"
@onready var animated_sprite_2d = $AnimatedSprite2D

# If the player is in the area of the lever and has enough points
var activatable = false
var activated = false
var needed_points = 10
var needed_level = 0
var build_name = "hydro-turbine"

func _on_body_entered(body):
	if body.name == "Character":
		if not activated:
			if game_manager.get_level() >= needed_level:
				if game_manager.get_points() >= needed_points:
					activatable = true
					print("Press E to repair and activate the ", build_name, " !")
				else:
					print("Not enough points. You need at least ", needed_points, " points to activate the ", build_name, ".")
			else:
				print("You don't have the level to complete this build. You need to be level ", (needed_level+1), ".")


func _on_body_exited(body):
	if body.name == "Character":
		activatable = false


func activate_energy_source():
	game_manager.add_level()
	game_manager.remove_points(needed_points)
	animated_sprite_2d.animation = "active"
	activated = true
	print("The ", build_name, " is now active !")


func _process(delta):
	if activatable and Input.is_action_just_pressed("interact"):
		activate_energy_source()
