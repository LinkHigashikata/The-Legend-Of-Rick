extends Node2D

@onready var HeartBar = $CanvasLayer/HeartBar
@onready var Player = $TileMap/Player

# Called when the node enters the scene tree for the first time.
func _ready():
	HeartBar.setMaxHealth(Player.maxHealth)
	HeartBar.updateHealth(Player.currentHealth)
	Player.HealthChanged.connect(HeartBar.updateHealth)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
