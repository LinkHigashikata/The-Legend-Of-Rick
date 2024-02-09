extends Area2D
signal fall

func _on_body_entered(body):
	fall.emit()
	
	#machin pour prendre valeur de velocity du joueur
	#if joueur détecté :
		#lancer animation "falling"
		#retirer un pv
		#activer gravité répulsive d'intensité x
		#jouer "NEVER GONNA GIVE YOU UP"
		#pendant 3 secondes :
			#faire clignoter sprite
			#faire depop hitbox joueur
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
