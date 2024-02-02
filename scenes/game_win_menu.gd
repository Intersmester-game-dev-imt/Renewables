extends Control

func _ready():
	$BlurAnimation.play("RESET")

func resume():
	_hide()
	get_tree().paused = false
	set_physics_process(false)
	
func _show(score, time):
	$PanelContainer/VPannel/Time.text = "Time  : " + time
	$PanelContainer/VPannel/Score.text = "Score : " + str(score)
	visible = true
	$BlurAnimation.play("blur")

	
func _hide():
	$BlurAnimation.play_backwards("blur")
	visible = false

func _on_quit_pressed():
	resume()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_replay_pressed():
	resume()
	get_tree().reload_current_scene()
