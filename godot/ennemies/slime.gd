extends CharacterBody2D

@export var speed = 20
@export var limit = 0.5
@export var endPoint: Marker2D

var startPosition
var endPosition

func _ready():
	startPosition = position
	endPosition = endPoint.global_position

func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection = endPosition - position
	if moveDirection.length() < limit:
		position = endPosition
		changeDirection()
	velocity = moveDirection.normalized()*speed

func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	if velocity.length() > 0:
			if velocity.x < 0:
				$AnimationPlayer.play("left")
			elif velocity.x > 0:
				$AnimationPlayer.play("right")
			elif velocity.y > 0:
				$AnimationPlayer.play("down")
			elif velocity.y < 0:
				$AnimationPlayer.play("up")
	else:
		$AnimationPlayer.stop()
		

