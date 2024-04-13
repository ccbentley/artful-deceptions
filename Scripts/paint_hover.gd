extends Node

@onready var canvas_layer = $"../.."

func _on_mouse_entered():
	canvas_layer.hovered_pixel = self

func _on_mouse_exited():
	canvas_layer.hovered_pixel = null
