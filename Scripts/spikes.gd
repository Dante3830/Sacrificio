extends Area2D

func _on_body_entered(body):
	if body.has_method("player_death"):
		Global.lives -= 1
		body.player_death()
