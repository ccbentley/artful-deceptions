extends Control

func _on_start_button_down():
	SceneTransition.change_scene("res://Scenes/Game.tscn")

func _on_quit_button_down():
	get_tree().quit()
