extends Control

func _ready():
	$Main.visible = true
	$Settings.visible = false
	$Credits.visible = false

func _on_start_button_down():
	$ButtonClickSound.play()
	SceneTransition.change_scene("res://Scenes/Game.tscn")

func _on_quit_button_down():
	$ButtonClickSound.play()
	get_tree().quit()

func _on_settings_button_down():
	$ButtonClickSound.play()
	$Main.visible = false
	$Settings.visible = true

func _on_credits_button_down():
	$ButtonClickSound.play()
	$Main.visible = false
	$Credits.visible = true

func _on_settings_back_button_down():
	$ButtonClickSound.play()
	$Main.visible = true
	$Settings.visible = false

func _on_credits_back_button_down():
	$ButtonClickSound.play()
	$Main.visible = true
	$Credits.visible = false

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
