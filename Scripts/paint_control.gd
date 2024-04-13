extends CanvasLayer

var hovered_pixel = null
var color = Color.BLACK

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if(hovered_pixel != null):
			hovered_pixel.modulate = Color.BLACK
