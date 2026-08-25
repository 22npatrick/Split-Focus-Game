extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -400
var compressed = false

func _physics_process(delta: float) -> void:
	if self == $"../Player 2":
		if Input.is_action_just_pressed("ui_up") and compressed == false:
			velocity.y = JUMP_VELOCITY
		if Input.is_action_just_pressed("ui_down") and compressed == false:
			compressed = true
			print("down")
			scale = Vector2(1, 0.5)
			velocity.y = 100
		if Input.is_action_just_released("ui_down")and compressed == true:
			compressed = false
			scale = Vector2(1, 1)
			print("up")
		velocity += get_gravity() * delta/5
	else:
		if not is_on_floor():
			velocity += get_gravity() * delta
			$Sprite2D.pause()
			$Sprite2D.play("InAir")
		else:
			$Sprite2D.pause()
			$Sprite2D.play("Idle")
		# Handle jump.
		if Input.is_action_just_pressed("up1") and is_on_floor() and compressed == false:
			velocity.y =JUMP_VELOCITY
		#
		if Input.is_action_just_pressed("down1"):
			compressed = true
			print("down")
			scale = Vector2(1, 0.5)
		if Input.is_action_just_released("down1"):
			scale = Vector2(1, 1)
			print("up")
			compressed = false
	move_and_slide()
	var _collision = move_and_collide(velocity * delta)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if self == $"../Player 2":
		if area.is_in_group("birdob"):
			get_tree().call_deferred("change_scene_to_packed", preload("res://Scene/end_game_scene.tscn"))
			print("Game end player 2")
		if area.is_in_group("kangob"):
			Global.score += 5	
			Global.gather_correct_ob_1 = true
			print("Player 2 collect ob 1")
	else:
		if area.is_in_group("kangob"):
			get_tree().call_deferred("change_scene_to_packed", preload("res://Scene/end_game_scene.tscn"))
			print("Game end player 1")
		if area.is_in_group("birdob"):
			Global.score += 5
			Global.gather_correct_ob_2 = true
			print("Player 1 collect ob 2")
