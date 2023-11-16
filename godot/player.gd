extends Area2D

@export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("go_right"):
		velocity.x += 1
	elif Input.is_action_just_pressed("go_left"):
		velocity.x -= 1
	elif Input.is_action_just_pressed("go_down"):
		velocity.y -= 1
	elif Input.is_action_just_pressed("go_up"):
		velocity.y += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
