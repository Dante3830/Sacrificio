extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
	Global.lives = 7
	Global.clock = 0
	Global.game_on = true
