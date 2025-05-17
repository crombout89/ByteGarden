extends CharacterBody2D

const SPEED = 80
var direction = Vector2.ZERO
var last_direction = "down"

func _physics_process(_delta: float) -> void:
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		last_direction = "down"
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		last_direction = "up"
		
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		last_direction = "left"
	elif Input.is_action_pressed("ui_right"):
		direction.x += 1
		last_direction = "right"
		
	direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()
	
	# Handle animations
	if direction != Vector2.ZERO:
		$AnimatedSprite2D.play("walk_" + last_direction)
	else:
		$AnimatedSprite2D.play("idle_" + last_direction)
		
func _ready():
	$Camera2D.make_current()
