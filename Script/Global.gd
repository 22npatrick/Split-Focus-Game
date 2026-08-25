extends Node
var speed = 400.0
var score = 0
var high_score = 0
var speed_increase = 1.0075
var max_speed = 500
var sec = 0
var game_diff = [true, false, false]
var gather_correct_ob_1 = false
var gather_correct_ob_2 = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file("res://Scene/main_1.tscn")
