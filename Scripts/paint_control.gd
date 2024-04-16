extends CanvasLayer

var hovered_pixel = null
var selected_color = Color(0,0,0,1)
var current_drawing = null

@onready var anim = $AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if(hovered_pixel != null):
			hovered_pixel.modulate = selected_color

var color_array = []
@onready var fixed_drawing_array = [$Fixed/A1,$Fixed/A2,$Fixed/A3,$Fixed/A4,$Fixed/A5,$Fixed/A6,$Fixed/A7,$Fixed/A8,$Fixed/A9,$Fixed/A10,$Fixed/A11,$Fixed/A12,$Fixed/B1,$Fixed/B2,$Fixed/B3,$Fixed/B4,$Fixed/B5,$Fixed/B6,$Fixed/B7,$Fixed/B8,$Fixed/B9,$Fixed/B10,$Fixed/B11,$Fixed/B12,$Fixed/C1,$Fixed/C2,$Fixed/C3,$Fixed/C4,$Fixed/C5,$Fixed/C6,$Fixed/C7,$Fixed/C8,$Fixed/C9,$Fixed/C10,$Fixed/C11,$Fixed/C12,$Fixed/D1,$Fixed/D2,$Fixed/D3,$Fixed/D4,$Fixed/D5,$Fixed/D6,$Fixed/D7,$Fixed/D8,$Fixed/D9,$Fixed/D10,$Fixed/D11,$Fixed/D12,$Fixed/E1,$Fixed/E2,$Fixed/E3,$Fixed/E4,$Fixed/E5,$Fixed/E6,$Fixed/E7,$Fixed/E8,$Fixed/E9,$Fixed/E10,$Fixed/E11,$Fixed/E12,$Fixed/F1,$Fixed/F2,$Fixed/F3,$Fixed/F4,$Fixed/F5,$Fixed/F6,$Fixed/F7,$Fixed/F8,$Fixed/F9,$Fixed/F10,$Fixed/F11,$Fixed/F12,$Fixed/G1,$Fixed/G2,$Fixed/G3,$Fixed/G4,$Fixed/G5,$Fixed/G6,$Fixed/G7,$Fixed/G8,$Fixed/G9,$Fixed/G10,$Fixed/G11,$Fixed/G12,$Fixed/H1,$Fixed/H2,$Fixed/H3,$Fixed/H4,$Fixed/H5,$Fixed/H6,$Fixed/H7,$Fixed/H8,$Fixed/H9,$Fixed/H10,$Fixed/H11,$Fixed/H12,$Fixed/I1,$Fixed/I2,$Fixed/I3,$Fixed/I4,$Fixed/I5,$Fixed/I6,$Fixed/I7,$Fixed/I8,$Fixed/I9,$Fixed/I10,$Fixed/I11,$Fixed/I12,$Fixed/J1,$Fixed/J2,$Fixed/J3,$Fixed/J4,$Fixed/J5,$Fixed/J6,$Fixed/J7,$Fixed/J8,$Fixed/J9,$Fixed/J10,$Fixed/J11,$Fixed/J12,$Fixed/K1,$Fixed/K2,$Fixed/K3,$Fixed/K4,$Fixed/K5,$Fixed/K6,$Fixed/K7,$Fixed/K8,$Fixed/K9,$Fixed/K10,$Fixed/K11,$Fixed/K12,$Fixed/L1,$Fixed/L2,$Fixed/L3,$Fixed/L4,$Fixed/L5,$Fixed/L6,$Fixed/L7,$Fixed/L8,$Fixed/L9,$Fixed/L10,$Fixed/L11,$Fixed/L12]

func _ready():
	current_drawing = Drawings.tree
	draw_fixed(current_drawing)
	start_round()

func convert_to_array():
	color_array = [$Canvas/A1.modulate,$Canvas/A2.modulate,$Canvas/A3.modulate,$Canvas/A4.modulate,$Canvas/A5.modulate,$Canvas/A6.modulate,$Canvas/A7.modulate,$Canvas/A8.modulate,$Canvas/A9.modulate,$Canvas/A10.modulate,$Canvas/A11.modulate,$Canvas/A12.modulate,$Canvas/B1.modulate,$Canvas/B2.modulate,$Canvas/B3.modulate,$Canvas/B4.modulate,$Canvas/B5.modulate,$Canvas/B6.modulate,$Canvas/B7.modulate,$Canvas/B8.modulate,$Canvas/B9.modulate,$Canvas/B10.modulate,$Canvas/B11.modulate,$Canvas/B12.modulate,$Canvas/C1.modulate,$Canvas/C2.modulate,$Canvas/C3.modulate,$Canvas/C4.modulate,$Canvas/C5.modulate,$Canvas/C6.modulate,$Canvas/C7.modulate,$Canvas/C8.modulate,$Canvas/C9.modulate,$Canvas/C10.modulate,$Canvas/C11.modulate,$Canvas/C12.modulate,$Canvas/D1.modulate,$Canvas/D2.modulate,$Canvas/D3.modulate,$Canvas/D4.modulate,$Canvas/D5.modulate,$Canvas/D6.modulate,$Canvas/D7.modulate,$Canvas/D8.modulate,$Canvas/D9.modulate,$Canvas/D10.modulate,$Canvas/D11.modulate,$Canvas/D12.modulate,$Canvas/E1.modulate,$Canvas/E2.modulate,$Canvas/E3.modulate,$Canvas/E4.modulate,$Canvas/E5.modulate,$Canvas/E6.modulate,$Canvas/E7.modulate,$Canvas/E8.modulate,$Canvas/E9.modulate,$Canvas/E10.modulate,$Canvas/E11.modulate,$Canvas/E12.modulate,$Canvas/F1.modulate,$Canvas/F2.modulate,$Canvas/F3.modulate,$Canvas/F4.modulate,$Canvas/F5.modulate,$Canvas/F6.modulate,$Canvas/F7.modulate,$Canvas/F8.modulate,$Canvas/F9.modulate,$Canvas/F10.modulate,$Canvas/F11.modulate,$Canvas/F12.modulate,$Canvas/G1.modulate,$Canvas/G2.modulate,$Canvas/G3.modulate,$Canvas/G4.modulate,$Canvas/G5.modulate,$Canvas/G6.modulate,$Canvas/G7.modulate,$Canvas/G8.modulate,$Canvas/G9.modulate,$Canvas/G10.modulate,$Canvas/G11.modulate,$Canvas/G12.modulate,$Canvas/H1.modulate,$Canvas/H2.modulate,$Canvas/H3.modulate,$Canvas/H4.modulate,$Canvas/H5.modulate,$Canvas/H6.modulate,$Canvas/H7.modulate,$Canvas/H8.modulate,$Canvas/H9.modulate,$Canvas/H10.modulate,$Canvas/H11.modulate,$Canvas/H12.modulate,$Canvas/I1.modulate,$Canvas/I2.modulate,$Canvas/I3.modulate,$Canvas/I4.modulate,$Canvas/I5.modulate,$Canvas/I6.modulate,$Canvas/I7.modulate,$Canvas/I8.modulate,$Canvas/I9.modulate,$Canvas/I10.modulate,$Canvas/I11.modulate,$Canvas/I12.modulate,$Canvas/J1.modulate,$Canvas/J2.modulate,$Canvas/J3.modulate,$Canvas/J4.modulate,$Canvas/J5.modulate,$Canvas/J6.modulate,$Canvas/J7.modulate,$Canvas/J8.modulate,$Canvas/J9.modulate,$Canvas/J10.modulate,$Canvas/J11.modulate,$Canvas/J12.modulate,$Canvas/K1.modulate,$Canvas/K2.modulate,$Canvas/K3.modulate,$Canvas/K4.modulate,$Canvas/K5.modulate,$Canvas/K6.modulate,$Canvas/K7.modulate,$Canvas/K8.modulate,$Canvas/K9.modulate,$Canvas/K10.modulate,$Canvas/K11.modulate,$Canvas/K12.modulate,$Canvas/L1.modulate,$Canvas/L2.modulate,$Canvas/L3.modulate,$Canvas/L4.modulate,$Canvas/L5.modulate,$Canvas/L6.modulate,$Canvas/L7.modulate,$Canvas/L8.modulate,$Canvas/L9.modulate,$Canvas/L10.modulate,$Canvas/L11.modulate,$Canvas/L12.modulate]

func compare_drawings(player_drawing, fixed_drawing):
	var score : float = 0
	# Ensure both drawings have the same number of elements
	if player_drawing.size() != fixed_drawing.size():
		print("Drawings are not the same size")
		return score
	# Loop through each color in the drawings and compare
	for i in range(player_drawing.size()):
		if (player_drawing[i] == fixed_drawing[i]):
			score += 1
	if(score != 0):
		return score / player_drawing.size() * 100
	else:
		return score

func draw_fixed(fixed_drawing):
	for i in range(fixed_drawing_array.size()):
		var color_rect = fixed_drawing_array[i]
		var color = fixed_drawing[i]
		color_rect.modulate = color

func start_round():
	$AnimationPlayer.play("start")

func _on_done_button_down():
	convert_to_array()
	print(compare_drawings(color_array, current_drawing))

func _on_white_button_down():
	selected_color = Color(1, 1, 1, 1)

func _on_black_button_down():
	selected_color = Color(0,0,0,1)

func _on_lightgray_button_down():
	selected_color = Color(0.8275, 0.8275, 0.8275, 1)

func _on_gray_button_down():
	selected_color = Color(0.4118, 0.4118, 0.4118, 1)

func _on_red_button_down():
	selected_color = Color(1, 0, 0, 1)

func _on_orange_button_down():
	selected_color = Color(1, 0.6471, 0, 1)

func _on_yellow_button_down():
	selected_color = Color(1, 1, 0, 1)

func _on_lime_button_down():
	selected_color = Color(0, 1, 0, 1)

func _on_green_button_down():
	selected_color = Color(0, 0.502, 0, 1)

func _on_cyan_button_down():
	selected_color = Color(0, 0.5451, 0.5451, 1)

func _on_lightblue_button_down():
	selected_color = Color(0, 0.749, 1, 1)

func _on_blue_button_down():
	selected_color = Color(0, 0, 0.8039, 1)

func _on_purple_button_down():
	selected_color = Color(0.6275, 0.1255, 0.9412, 1)

func _on_pink_button_down():
	selected_color = Color(1, 0.4118, 0.7059, 1)

func _on_brown_button_down():
	selected_color = Color(0.5451, 0.2706, 0.0745, 1)
