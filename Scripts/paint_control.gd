extends CanvasLayer

var hovered_pixel = null
var selected_color = Color.BLACK

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if(hovered_pixel != null):
			hovered_pixel.modulate = selected_color
var color_array = []

func convert_to_array():
	color_array = [$Canvas/A1.modulate,$Canvas/A2.modulate,$Canvas/A3.modulate,$Canvas/A4.modulate,$Canvas/A5.modulate,$Canvas/A6.modulate,$Canvas/A7.modulate,$Canvas/A8.modulate,$Canvas/A9.modulate,$Canvas/A10.modulate,$Canvas/A11.modulate,$Canvas/A12.modulate,$Canvas/B1.modulate,$Canvas/B2.modulate,$Canvas/B3.modulate,$Canvas/B4.modulate,$Canvas/B5.modulate,$Canvas/B6.modulate,$Canvas/B7.modulate,$Canvas/B8.modulate,$Canvas/B9.modulate,$Canvas/B10.modulate,$Canvas/B11.modulate,$Canvas/B12.modulate,$Canvas/C1.modulate,$Canvas/C2.modulate,$Canvas/C3.modulate,$Canvas/C4.modulate,$Canvas/C5.modulate,$Canvas/C6.modulate,$Canvas/C7.modulate,$Canvas/C8.modulate,$Canvas/C9.modulate,$Canvas/C10.modulate,$Canvas/C11.modulate,$Canvas/C12.modulate,$Canvas/D1.modulate,$Canvas/D2.modulate,$Canvas/D3.modulate,$Canvas/D4.modulate,$Canvas/D5.modulate,$Canvas/D6.modulate,$Canvas/D7.modulate,$Canvas/D8.modulate,$Canvas/D9.modulate,$Canvas/D10.modulate,$Canvas/D11.modulate,$Canvas/D12.modulate,$Canvas/E1.modulate,$Canvas/E2.modulate,$Canvas/E3.modulate,$Canvas/E4.modulate,$Canvas/E5.modulate,$Canvas/E6.modulate,$Canvas/E7.modulate,$Canvas/E8.modulate,$Canvas/E9.modulate,$Canvas/E10.modulate,$Canvas/E11.modulate,$Canvas/E12.modulate,$Canvas/F1.modulate,$Canvas/F2.modulate,$Canvas/F3.modulate,$Canvas/F4.modulate,$Canvas/F5.modulate,$Canvas/F6.modulate,$Canvas/F7.modulate,$Canvas/F8.modulate,$Canvas/F9.modulate,$Canvas/F10.modulate,$Canvas/F11.modulate,$Canvas/F12.modulate,$Canvas/G1.modulate,$Canvas/G2.modulate,$Canvas/G3.modulate,$Canvas/G4.modulate,$Canvas/G5.modulate,$Canvas/G6.modulate,$Canvas/G7.modulate,$Canvas/G8.modulate,$Canvas/G9.modulate,$Canvas/G10.modulate,$Canvas/G11.modulate,$Canvas/G12.modulate,$Canvas/H1.modulate,$Canvas/H2.modulate,$Canvas/H3.modulate,$Canvas/H4.modulate,$Canvas/H5.modulate,$Canvas/H6.modulate,$Canvas/H7.modulate,$Canvas/H8.modulate,$Canvas/H9.modulate,$Canvas/H10.modulate,$Canvas/H11.modulate,$Canvas/H12.modulate,$Canvas/I1.modulate,$Canvas/I2.modulate,$Canvas/I3.modulate,$Canvas/I4.modulate,$Canvas/I5.modulate,$Canvas/I6.modulate,$Canvas/I7.modulate,$Canvas/I8.modulate,$Canvas/I9.modulate,$Canvas/I10.modulate,$Canvas/I11.modulate,$Canvas/I12.modulate,$Canvas/J1.modulate,$Canvas/J2.modulate,$Canvas/J3.modulate,$Canvas/J4.modulate,$Canvas/J5.modulate,$Canvas/J6.modulate,$Canvas/J7.modulate,$Canvas/J8.modulate,$Canvas/J9.modulate,$Canvas/J10.modulate,$Canvas/J11.modulate,$Canvas/J12.modulate,$Canvas/K1.modulate,$Canvas/K2.modulate,$Canvas/K3.modulate,$Canvas/K4.modulate,$Canvas/K5.modulate,$Canvas/K6.modulate,$Canvas/K7.modulate,$Canvas/K8.modulate,$Canvas/K9.modulate,$Canvas/K10.modulate,$Canvas/K11.modulate,$Canvas/K12.modulate,$Canvas/L1.modulate,$Canvas/L2.modulate,$Canvas/L3.modulate,$Canvas/L4.modulate,$Canvas/L5.modulate,$Canvas/L6.modulate,$Canvas/L7.modulate,$Canvas/L8.modulate,$Canvas/L9.modulate,$Canvas/L10.modulate,$Canvas/L11.modulate,$Canvas/L12.modulate]
	print(color_array)

func compare_drawings(player_drawing, fixed_drawing):
	var score = 0
	# Ensure both drawings have the same number of elements
	if player_drawing.size() != fixed_drawing.size():
		print("Drawings are not the same size")
		return score
	# Loop through each color in the drawings and compare
	for i in range(player_drawing.size()):
		if player_drawing[i] == fixed_drawing[i]:
			score += 1
	if(score != 0):
		return score / player_drawing.size * 100
	else:
		return score

func _on_black_button_down():
	selected_color = Color.BLACK


func _on_white_button_down():
	selected_color = Color.WHITE


func _on_red_button_down():
	selected_color = Color.RED


func _on_orange_button_down():
	selected_color = Color.ORANGE


func _on_yellow_button_down():
	selected_color = Color.YELLOW
	convert_to_array()
