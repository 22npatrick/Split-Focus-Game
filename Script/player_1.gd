extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -450
var compressed = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if self == $"../Player 2":
		if Input.is_action_just_pressed("ui_up") and compressed == false:
			velocity.y = -1000
		if Input.is_action_just_pressed("ui_down"):
			compressed = true
			print("down")
			scale = Vector2(1, 0.5)
			velocity.y = 1000
		if Input.is_action_just_released("ui_down"):
			scale = Vector2(1, 1)
			print("up")
			velocity.y = 0
			compressed = false
	else:
		if not is_on_floor():
			velocity += get_gravity() * delta
		# Handle jump.
		if Input.is_action_just_pressed("up1") and is_on_floor() and compressed == false:
			velocity.y =JUMP_VELOCITY
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
		#for i in get_slide_collision_count():
			#collision = get_slide_collision(i)
			#if collision.get_collider().is_in_group("obstacles"):

func _on_area_2d_area_entered(_area: Area2D) -> void:
	print("yes")
	get_tree().call_deferred("change_scene_to_packed", preload("res://Scene/end_game_scene.tscn"))
