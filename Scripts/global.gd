extends Node

var level = 0
var lives = 10
var clock = 0
var game_on = false
var Seconds
var Milliseconds

func _process(delta):
	
	Seconds = int(clock)
	
	Milliseconds = int((clock - Seconds) * 1000)
	Milliseconds = int(round(Milliseconds / 10.0))
	
	if game_on:
		clock += delta
		
		if lives <= 0:
			game_on = false
			if level == 1:
				get_tree().change_scene_to_file("res://Scenes/L1GameOver.tscn")
			elif level == 2:
				get_tree().change_scene_to_file("res://Scenes/L2GameOver.tscn")
			elif level == 3:
				get_tree().change_scene_to_file("res://Scenes/L3GameOver.tscn")
		
		print(clock)
	
