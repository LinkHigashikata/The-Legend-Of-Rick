extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer1/global settings".grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_global_settings_pressed():
	pass # Replace with function body.


func _on_video_settings_pressed():
	pass # Replace with function body.


func _on_sound_settings_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/home.tscn")
