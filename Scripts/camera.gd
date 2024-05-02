extends Camera2D

@export_category("Follow Character")
@export var Player : CharacterBody2D

@export_category("Camera Smoothing")
@export var smoothing : bool
@export_range(0.1, 10) var smoothing_distance : float = 8

@export_range(0, 100) var camera_height_offset : int = 2

func _physics_process(delta):
	var weight : float
	
	if Player != null:
		var camera_position : Vector2
		
		if smoothing:
			weight = float(11 - smoothing_distance) / 100
			camera_position = lerp(global_position, Player.global_position, weight)
		else:
			camera_position = Player.global_position
		
		camera_position.y -= camera_height_offset
		
		global_position = camera_position.floor()
