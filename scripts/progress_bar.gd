extends Control

var score_decrease_speed: float = 3.0  # Ajoutez cette ligne pour déclarer la variable

func _ready():
	$ProgressBar.value = 100

func _process(delta):
	pass

func _on_timer_timeout():
	$ProgressBar.value -= 0.6 * score_decrease_speed
	update_progress_color()
	if $ProgressBar.value <= 0:
		reload_game()
		

func update_progress_color():
	var percentage = $ProgressBar.value / $ProgressBar.max_value

	if percentage < 0.25:
		$ProgressBar.modulate = Color(1, 0, 0)  # Rouge
	elif percentage < 0.5:
		$ProgressBar.modulate = Color(1, 0.270588, 0, 1)  # Orange
	elif percentage < 0.75:
		$ProgressBar.modulate = Color(1, 1, 0)  # Jaune
	else:
		$ProgressBar.modulate = Color(0, 1, 0)  # Vert
		
		
func reload_game():
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()
