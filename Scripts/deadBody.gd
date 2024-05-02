extends StaticBody2D

func _physics_process(delta):
	if Global.game_on == false:
		queue_free()
