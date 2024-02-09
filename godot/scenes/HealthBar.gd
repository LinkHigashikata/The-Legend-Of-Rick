extends TextureProgressBar

@export var player: Plaillyeure

func update():
	value = player.currentHealth * 100 / player.maxHealth
# Called when the node enters the scene tree for the first time.
func _ready():
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
