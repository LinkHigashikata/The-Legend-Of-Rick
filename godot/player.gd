class_name Plaillyeure

extends CharacterBody2D

signal HealthChanged

@export var maxHealth = 4
@onready var currentHealth: int = maxHealth


@export var speed: int = 400
var screen_size
var roll_vector: Vector2 = Vector2.RIGHT
func _ready():
	screen_size = get_viewport_rect().size

func handleCollision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		print_debug(collider.name)

func handleInput():
	var moveDirection = Input.get_vector("go_left", "go_right", "go_up", "go_down")
	velocity = moveDirection * speed
	update_roll_vector()
	if Input.is_action_just_pressed("ui_roll"):
		set_roll_speed()

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

func update_roll_vector():
	roll_vector = velocity
	
func set_roll_speed():
	velocity = roll_vector * 30 * 1.5


func _on_hurt_box_area_entered(area):
	if area.name == "HitBox" :
		currentHealth = currentHealth - 1
		if currentHealth < 0 :
			currentHealth = maxHealth
			
		HealthChanged.emit(currentHealth)
	else :
		if area.name == "Void" :
			currentHealth = currentHealth - 1
			if currentHealth < 0 :
				currentHealth = maxHealth
			
				HealthChanged.emit(currentHealth)
