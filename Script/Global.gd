extends Node
var score = 0
var high_score = 0
var speed_increase = 1.03
var max_speed = 1.5
var sec = 0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file("res://Scene/main_1.tscn")
