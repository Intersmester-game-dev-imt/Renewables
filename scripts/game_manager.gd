extends Node

@onready var progress_bar = $"../CanvaProgressBar/ProgressBar"
@onready var pause_screen = $"../CanvaPause/PauseMenu"
@onready var game_over_screen = $"../CanvasGameOver/GameOver"
@onready var game_win_screen = $"../CanvasGameWin/GameWin"
@onready var score_ui = $"../CanvaScore/ScoreUI"
@onready var timer = $"../CanvasTimer/Panel"
var points = 0
var level = 0

func _ready():
	progress_bar.game_over.connect(_on_game_over)

func add_point():
	points += 1
	score_ui.update_score(points)

func remove_points(nb_points):
	if points - nb_points < 0:
		print("You don't have enough points")
	else:
		points -= nb_points
		score_ui.update_score(points)

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
		get_tree().paused = true
		pause_screen._show()
		set_physics_process(false)
		
func _on_game_over():
	get_tree().paused = true
	game_over_screen._show(points)
	set_physics_process(false)
	
func _on_game_win():
	get_tree().paused = true
	set_physics_process(false)
	game_win_screen._show(points, timer.get_time_formatted())
