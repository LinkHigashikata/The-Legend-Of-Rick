extends CharacterBody2D

@export var speed: int = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func handleInput():
	var moveDirection = Input.get_vector("go_left", "go_right", "go_up", "go_down")
	velocity = moveDirection * speed

func _physics_process(_delta):
	handleInput()
	move_and_slide()
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk_side"
		$AnimatedSprite2D.flip_h = velocity.x > 0
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "walk_forward"
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "walk_back"
