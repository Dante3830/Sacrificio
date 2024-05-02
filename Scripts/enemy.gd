extends CharacterBody2D

const speed = 3000

enum State { Idle, Move }
var current_state = State
var direction: Vector2 = Vector2.LEFT

@onready var animationEnemy = $AnimatedSprite2D

func _ready():
	current_state = State.Idle

func _physics_process(delta):
	enemy_idle(delta)
	enemy_move(delta)
	
	move_and_slide()

func enemy_idle(delta : float):
	velocity.x = move_toward(velocity.x, 0, speed * delta)
	current_state = State.Idle

func enemy_move(delta : float):
	velocity.x += direction.x * speed * delta

func _on_move_timer_timeout():
	if direction == Vector2.LEFT:
		direction = Vector2.RIGHT
		animationEnemy.flip_h = true
	elif direction == Vector2.RIGHT:
		direction = Vector2.LEFT
		animationEnemy.flip_h = false

func _on_hurt_box_body_entered(body):
	if body.has_method("reset_player_position"):
		body.reset_player_position()
		Global.lives -= 1
