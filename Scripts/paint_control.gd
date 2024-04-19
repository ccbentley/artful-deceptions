extends CanvasLayer

var hovered_pixel = null
var selected_color = Color(0,0,0,1)
var current_drawing = null
var money : float = 0
var round : int = 1
var max_rounds : int = 6

var can_draw : bool = false

var available_drawings = []

@onready var anim = $AnimationPlayer
@onready var score_label = $Text/Accuracy
@onready var preround = $Begin
@onready var total_money = $Text/TotalMoney
@onready var gained_money = $Text/GainedMoney
@onready var clock = $Clock

func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if(hovered_pixel != null and !anim.is_playing() and can_draw):
			hovered_pixel.modulate = selected_color
		if(preround.visible):
			exit_pre_round()
	if(round > max_rounds):
		end_game()

var color_array = []
@onready var fixed_drawing_array = [$Fixed/A1,$Fixed/A2,$Fixed/A3,$Fixed/A4,$Fixed/A5,$Fixed/A6,$Fixed/A7,$Fixed/A8,$Fixed/A9,$Fixed/A10,$Fixed/A11,$Fixed/A12,$Fixed/B1,$Fixed/B2,$Fixed/B3,$Fixed/B4,$Fixed/B5,$Fixed/B6,$Fixed/B7,$Fixed/B8,$Fixed/B9,$Fixed/B10,$Fixed/B11,$Fixed/B12,$Fixed/C1,$Fixed/C2,$Fixed/C3,$Fixed/C4,$Fixed/C5,$Fixed/C6,$Fixed/C7,$Fixed/C8,$Fixed/C9,$Fixed/C10,$Fixed/C11,$Fixed/C12,$Fixed/D1,$Fixed/D2,$Fixed/D3,$Fixed/D4,$Fixed/D5,$Fixed/D6,$Fixed/D7,$Fixed/D8,$Fixed/D9,$Fixed/D10,$Fixed/D11,$Fixed/D12,$Fixed/E1,$Fixed/E2,$Fixed/E3,$Fixed/E4,$Fixed/E5,$Fixed/E6,$Fixed/E7,$Fixed/E8,$Fixed/E9,$Fixed/E10,$Fixed/E11,$Fixed/E12,$Fixed/F1,$Fixed/F2,$Fixed/F3,$Fixed/F4,$Fixed/F5,$Fixed/F6,$Fixed/F7,$Fixed/F8,$Fixed/F9,$Fixed/F10,$Fixed/F11,$Fixed/F12,$Fixed/G1,$Fixed/G2,$Fixed/G3,$Fixed/G4,$Fixed/G5,$Fixed/G6,$Fixed/G7,$Fixed/G8,$Fixed/G9,$Fixed/G10,$Fixed/G11,$Fixed/G12,$Fixed/H1,$Fixed/H2,$Fixed/H3,$Fixed/H4,$Fixed/H5,$Fixed/H6,$Fixed/H7,$Fixed/H8,$Fixed/H9,$Fixed/H10,$Fixed/H11,$Fixed/H12,$Fixed/I1,$Fixed/I2,$Fixed/I3,$Fixed/I4,$Fixed/I5,$Fixed/I6,$Fixed/I7,$Fixed/I8,$Fixed/I9,$Fixed/I10,$Fixed/I11,$Fixed/I12,$Fixed/J1,$Fixed/J2,$Fixed/J3,$Fixed/J4,$Fixed/J5,$Fixed/J6,$Fixed/J7,$Fixed/J8,$Fixed/J9,$Fixed/J10,$Fixed/J11,$Fixed/J12,$Fixed/K1,$Fixed/K2,$Fixed/K3,$Fixed/K4,$Fixed/K5,$Fixed/K6,$Fixed/K7,$Fixed/K8,$Fixed/K9,$Fixed/K10,$Fixed/K11,$Fixed/K12,$Fixed/L1,$Fixed/L2,$Fixed/L3,$Fixed/L4,$Fixed/L5,$Fixed/L6,$Fixed/L7,$Fixed/L8,$Fixed/L9,$Fixed/L10,$Fixed/L11,$Fixed/L12]
@onready var player_drawing_array = [$Canvas/A1,$Canvas/A2,$Canvas/A3,$Canvas/A4,$Canvas/A5,$Canvas/A6,$Canvas/A7,$Canvas/A8,$Canvas/A9,$Canvas/A10,$Canvas/A11,$Canvas/A12,$Canvas/B1,$Canvas/B2,$Canvas/B3,$Canvas/B4,$Canvas/B5,$Canvas/B6,$Canvas/B7,$Canvas/B8,$Canvas/B9,$Canvas/B10,$Canvas/B11,$Canvas/B12,$Canvas/C1,$Canvas/C2,$Canvas/C3,$Canvas/C4,$Canvas/C5,$Canvas/C6,$Canvas/C7,$Canvas/C8,$Canvas/C9,$Canvas/C10,$Canvas/C11,$Canvas/C12,$Canvas/D1,$Canvas/D2,$Canvas/D3,$Canvas/D4,$Canvas/D5,$Canvas/D6,$Canvas/D7,$Canvas/D8,$Canvas/D9,$Canvas/D10,$Canvas/D11,$Canvas/D12,$Canvas/E1,$Canvas/E2,$Canvas/E3,$Canvas/E4,$Canvas/E5,$Canvas/E6,$Canvas/E7,$Canvas/E8,$Canvas/E9,$Canvas/E10,$Canvas/E11,$Canvas/E12,$Canvas/F1,$Canvas/F2,$Canvas/F3,$Canvas/F4,$Canvas/F5,$Canvas/F6,$Canvas/F7,$Canvas/F8,$Canvas/F9,$Canvas/F10,$Canvas/F11,$Canvas/F12,$Canvas/G1,$Canvas/G2,$Canvas/G3,$Canvas/G4,$Canvas/G5,$Canvas/G6,$Canvas/G7,$Canvas/G8,$Canvas/G9,$Canvas/G10,$Canvas/G11,$Canvas/G12,$Canvas/H1,$Canvas/H2,$Canvas/H3,$Canvas/H4,$Canvas/H5,$Canvas/H6,$Canvas/H7,$Canvas/H8,$Canvas/H9,$Canvas/H10,$Canvas/H11,$Canvas/H12,$Canvas/I1,$Canvas/I2,$Canvas/I3,$Canvas/I4,$Canvas/I5,$Canvas/I6,$Canvas/I7,$Canvas/I8,$Canvas/I9,$Canvas/I10,$Canvas/I11,$Canvas/I12,$Canvas/J1,$Canvas/J2,$Canvas/J3,$Canvas/J4,$Canvas/J5,$Canvas/J6,$Canvas/J7,$Canvas/J8,$Canvas/J9,$Canvas/J10,$Canvas/J11,$Canvas/J12,$Canvas/K1,$Canvas/K2,$Canvas/K3,$Canvas/K4,$Canvas/K5,$Canvas/K6,$Canvas/K7,$Canvas/K8,$Canvas/K9,$Canvas/K10,$Canvas/K11,$Canvas/K12,$Canvas/L1,$Canvas/L2,$Canvas/L3,$Canvas/L4,$Canvas/L5,$Canvas/L6,$Canvas/L7,$Canvas/L8,$Canvas/L9,$Canvas/L10,$Canvas/L11,$Canvas/L12]

func _ready():
	enter_pre_round()
	available_drawings = Drawings.list.duplicate()

func pick_drawing():
	if(available_drawings.size() != 0):
		var random_index = randi() % available_drawings.size()
		current_drawing = available_drawings[random_index]
		available_drawings.remove_at(random_index)
	else:
		print("No more unique drawings aviable")

func convert_to_array():
	color_array = [$Canvas/A1.modulate,$Canvas/A2.modulate,$Canvas/A3.modulate,$Canvas/A4.modulate,$Canvas/A5.modulate,$Canvas/A6.modulate,$Canvas/A7.modulate,$Canvas/A8.modulate,$Canvas/A9.modulate,$Canvas/A10.modulate,$Canvas/A11.modulate,$Canvas/A12.modulate,$Canvas/B1.modulate,$Canvas/B2.modulate,$Canvas/B3.modulate,$Canvas/B4.modulate,$Canvas/B5.modulate,$Canvas/B6.modulate,$Canvas/B7.modulate,$Canvas/B8.modulate,$Canvas/B9.modulate,$Canvas/B10.modulate,$Canvas/B11.modulate,$Canvas/B12.modulate,$Canvas/C1.modulate,$Canvas/C2.modulate,$Canvas/C3.modulate,$Canvas/C4.modulate,$Canvas/C5.modulate,$Canvas/C6.modulate,$Canvas/C7.modulate,$Canvas/C8.modulate,$Canvas/C9.modulate,$Canvas/C10.modulate,$Canvas/C11.modulate,$Canvas/C12.modulate,$Canvas/D1.modulate,$Canvas/D2.modulate,$Canvas/D3.modulate,$Canvas/D4.modulate,$Canvas/D5.modulate,$Canvas/D6.modulate,$Canvas/D7.modulate,$Canvas/D8.modulate,$Canvas/D9.modulate,$Canvas/D10.modulate,$Canvas/D11.modulate,$Canvas/D12.modulate,$Canvas/E1.modulate,$Canvas/E2.modulate,$Canvas/E3.modulate,$Canvas/E4.modulate,$Canvas/E5.modulate,$Canvas/E6.modulate,$Canvas/E7.modulate,$Canvas/E8.modulate,$Canvas/E9.modulate,$Canvas/E10.modulate,$Canvas/E11.modulate,$Canvas/E12.modulate,$Canvas/F1.modulate,$Canvas/F2.modulate,$Canvas/F3.modulate,$Canvas/F4.modulate,$Canvas/F5.modulate,$Canvas/F6.modulate,$Canvas/F7.modulate,$Canvas/F8.modulate,$Canvas/F9.modulate,$Canvas/F10.modulate,$Canvas/F11.modulate,$Canvas/F12.modulate,$Canvas/G1.modulate,$Canvas/G2.modulate,$Canvas/G3.modulate,$Canvas/G4.modulate,$Canvas/G5.modulate,$Canvas/G6.modulate,$Canvas/G7.modulate,$Canvas/G8.modulate,$Canvas/G9.modulate,$Canvas/G10.modulate,$Canvas/G11.modulate,$Canvas/G12.modulate,$Canvas/H1.modulate,$Canvas/H2.modulate,$Canvas/H3.modulate,$Canvas/H4.modulate,$Canvas/H5.modulate,$Canvas/H6.modulate,$Canvas/H7.modulate,$Canvas/H8.modulate,$Canvas/H9.modulate,$Canvas/H10.modulate,$Canvas/H11.modulate,$Canvas/H12.modulate,$Canvas/I1.modulate,$Canvas/I2.modulate,$Canvas/I3.modulate,$Canvas/I4.modulate,$Canvas/I5.modulate,$Canvas/I6.modulate,$Canvas/I7.modulate,$Canvas/I8.modulate,$Canvas/I9.modulate,$Canvas/I10.modulate,$Canvas/I11.modulate,$Canvas/I12.modulate,$Canvas/J1.modulate,$Canvas/J2.modulate,$Canvas/J3.modulate,$Canvas/J4.modulate,$Canvas/J5.modulate,$Canvas/J6.modulate,$Canvas/J7.modulate,$Canvas/J8.modulate,$Canvas/J9.modulate,$Canvas/J10.modulate,$Canvas/J11.modulate,$Canvas/J12.modulate,$Canvas/K1.modulate,$Canvas/K2.modulate,$Canvas/K3.modulate,$Canvas/K4.modulate,$Canvas/K5.modulate,$Canvas/K6.modulate,$Canvas/K7.modulate,$Canvas/K8.modulate,$Canvas/K9.modulate,$Canvas/K10.modulate,$Canvas/K11.modulate,$Canvas/K12.modulate,$Canvas/L1.modulate,$Canvas/L2.modulate,$Canvas/L3.modulate,$Canvas/L4.modulate,$Canvas/L5.modulate,$Canvas/L6.modulate,$Canvas/L7.modulate,$Canvas/L8.modulate,$Canvas/L9.modulate,$Canvas/L10.modulate,$Canvas/L11.modulate,$Canvas/L12.modulate]

func compare_drawings(player_drawing, fixed_drawing):
	var score : float = 0
	if player_drawing.size() != fixed_drawing.size():
		print("Drawings are not the same size")
		return score
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

func clear_canvas():
	for i in range(player_drawing_array.size()):
		var color_rect = player_drawing_array[i]
		var color = Color(1, 1, 1, 1)
		color_rect.modulate = color

func start_round():
	pick_drawing()
	draw_fixed(current_drawing)
	round += 1
	can_draw = true
	selected_color = Color(0, 0, 0, 1)
	anim.play("round_start")

func end_game():
	pass

func animate_score():
	var final_score : int = compare_drawings(color_array, current_drawing)
	var duration : float = 1
	var current_score = 0
	var time_per_increment = duration / final_score
	while current_score < final_score:
		current_score += 1
		score_label.text = str(current_score, "% Accuracy")
		await get_tree().create_timer(time_per_increment).timeout

func start_clock():
	clock.play("clock")

func _on_nextdrawing_button_down():
	score_label.text = str("0% Accuracy")
	anim.play("round_reset")

func enter_pre_round():
	$Begin/Label.text = str("Round ", round, "/", max_rounds, "\n Click Anywhere To Begin")
	preround.visible = true

func exit_pre_round():
	preround.visible = false
	start_round()

func _on_done_button_down():
	if(can_draw && !anim.is_playing()):
		convert_to_array()
		anim.play("auction_start")
		can_draw = false
		clock.play("reset")
		print(color_array)

func _on_clear_button_down():
	if(can_draw):
		clear_canvas()
func _on_white_button_down():
	selected_color = Color(1, 1, 1, 1)
func _on_black_button_down():
	selected_color = Color(0, 0, 0, 1)
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

func _on_option1_button_button_down():
	if(compare_drawings(color_array, current_drawing) >= 100):
		money += 500000
		gained_money.text = "$+500000"
		gained_money.add_theme_color_override("font_color", Color.GREEN)
	else:
		money -= 500000
		gained_money.text = "$-500000"
		gained_money.add_theme_color_override("font_color", Color.RED)
	anim.play("auction_end")
	total_money.text = str("$", money)

func _on_option2_button_button_down():
	if(compare_drawings(color_array, current_drawing) >= 95):
		money += 250000
		gained_money.text = "$+250000"
		gained_money.add_theme_color_override("font_color", Color.GREEN)
	else:
		money -= 250000
		gained_money.text = "$-250000"
		gained_money.add_theme_color_override("font_color", Color.RED)
	anim.play("auction_end")
	total_money.text = str("$", money)

func _on_option3_button_button_down():
	if(compare_drawings(color_array, current_drawing) >= 88):
		money += 150000
		gained_money.text = "$+150000"
		gained_money.add_theme_color_override("font_color", Color.GREEN)
	else:
		money -= 150000
		gained_money.text = "$-150000"
		gained_money.add_theme_color_override("font_color", Color.RED)
	anim.play("auction_end")
	total_money.text = str("$", money)

func _on_option4_button_button_down():
	if(compare_drawings(color_array, current_drawing) >= 75):
		money += 75000
		gained_money.text = "$+75000"
		gained_money.add_theme_color_override("font_color", Color.GREEN)
	else:
		money -= 75000
		gained_money.text = "$-75000"
		gained_money.add_theme_color_override("font_color", Color.RED)
	anim.play("auction_end")
	total_money.text = str("$", money)

func _on_option5_button_button_down():
	if(compare_drawings(color_array, current_drawing) >= 50):
		money += 25000
		gained_money.text = "$+25000"
		gained_money.add_theme_color_override("font_color", Color.GREEN)
	else:
		money -= 25000
		gained_money.text = "$-25000"
		gained_money.add_theme_color_override("font_color", Color.RED)
	anim.play("auction_end")
	total_money.text = str("$", money)
