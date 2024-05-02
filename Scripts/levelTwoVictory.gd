extends Control

@onready var sprite1 = $SpriteContainer/HBoxContainer/Sprite1
@onready var sprite2 = $SpriteContainer/HBoxContainer/Sprite2
@onready var sprite3 = $SpriteContainer/HBoxContainer/Sprite3
@onready var time = $Time

func _on_restart_button_pressed():
	Global.lives = 7
	Global.clock = 0
	Global.game_on = true
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")

func _on_next_level_button_pressed():
	Global.level = 3
	Global.lives = 10
	Global.game_on = true
	Global.clock = 0
	get_tree().change_scene_to_file("res://Scenes/Level3.tscn")

func _process(delta):
	time.text = "Tu tiempo: " + str(Global.Seconds) + ":" + str(Global.Milliseconds)
	
	if Global.clock > 60:
		sprite1.hide()
		sprite2.hide()
		sprite3.hide()
	elif Global.clock > 40:
		sprite2.hide()
		sprite3.hide()
	elif Global.clock > 30:
		sprite3.hide()
	else:
		pass
