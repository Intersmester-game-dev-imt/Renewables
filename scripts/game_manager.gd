extends Node

@onready var progress_bar = $"../CanvasLayer/ProgressBar"
@onready var pause_screen = $"../CanvaPause/PauseMenu"

var points = 0
var level = 0

func add_point():
	points += 1
	print(points)

func remove_points(nb_points):
	if points - nb_points < 0:
		print("You don't have enough points")
	else:
		points -= nb_points

func get_points():
	return points
	
func add_level():
	level += 1
	
	if level == 1:
		progress_bar.score_decrease_speed = 2
	if level == 2:
		progress_bar.score_decrease_speed = 1
	if level == 3:
		progress_bar.score_decrease_speed = 0

func get_level():
	return level
	
func _input(event):
	if !pause_screen.visible and event.is_action_pressed("ui_pause"):
		print(event)
		get_tree().paused = true
		pause_screen._show()
		set_physics_process(false)
