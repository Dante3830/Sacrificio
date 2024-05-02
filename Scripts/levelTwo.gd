extends Node

func _process(delta):
	$HUD/Control/LivesDP.text = str(Global.lives)
	$HUD/Control/Clock.text = str(Global.Seconds) + ":" + str(Global.Milliseconds)

func _on_finish_body_entered(body):
	if body.is_in_group("Player"):
		Global.game_on = false
		get_tree().change_scene_to_file("res://Scenes/L2Victory.tscn")
