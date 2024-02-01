extends Control

var score_decrease_speed: float = 70.0
signal game_over

func _ready():
	$TextureProgressBar.value = 100
	$TextureProgressBar.modulate = Color(0, 1, 0)

func _process(delta):
	pass

func _on_timer_timeout():
	$TextureProgressBar.value -= 0.3 * score_decrease_speed
	update_progress_color()
	if $TextureProgressBar.value <= 0:
		game_over.emit()

func update_progress_color():
	var percentage = $TextureProgressBar.value / 100

	if percentage < 0.25:
		$TextureProgressBar.modulate = Color(1, 0, 0)  # Rouge
	elif percentage < 0.5:
		$TextureProgressBar.modulate = Color(1, 0.270588, 0, 1)  # Orange
	elif percentage < 0.75:
		$TextureProgressBar.modulate = Color(1, 1, 0)  # Jaune
	else:
		$TextureProgressBar.modulate = Color(0, 1, 0)  # Vert

func set_score_decrease_speed(new_speed: float):
	score_decrease_speed = new_speed

func reload_game():
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()

	
