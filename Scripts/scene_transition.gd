extends CanvasLayer

func _ready():
	$AnimationPlayer.play("RESET")

func change_scene(target: String):
	$AnimationPlayer.play("slide")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("slide")
