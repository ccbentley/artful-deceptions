extends Control

func _on_start_button_down():
	$ButtonClickSound.play()
	SceneTransition.change_scene("res://Scenes/Game.tscn")

func _on_quit_button_down():
	$ButtonClickSound.play()
	get_tree().quit()
