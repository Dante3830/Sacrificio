extends CharacterBody2D

const speed = 300.0
const jumpForce = -600.0

@onready var animationPlayer = $AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var initalPosition : Vector2

var dead_body = preload("res://Scenes/DeadBody.tscn")

func _process(_delta):
	if Global.level == 1:
		initalPosition = Vector2(-644, 514)
	elif Global.level == 2:
		initalPosition = Vector2(-685, -235)
	elif Global.level == 3:
		initalPosition = Vector2(-969, 1206)

func _physics_process(delta):
	if Input.is_action_just_pressed("Left"):
		animationPlayer.flip_h = true
	elif Input.is_action_just_pressed("Right"):
		animationPlayer.flip_h = false
	
	if not is_on_floor():
		velocity.y += gravity * delta
		animationPlayer.play("jump")
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jumpForce
		animationPlayer.play("jump")
	
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed
		animationPlayer.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		animationPlayer.play("idle")
	
	move_and_slide()

func player_death():
	if position != initalPosition:
		var current_position = position
		var corpse = dead_body.instantiate()
		get_parent().add_child(corpse)
		corpse.position = current_position
		call_deferred("reset_player_position")

func reset_player_position():
	position = initalPosition
