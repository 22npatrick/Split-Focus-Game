extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -450


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y =JUMP_VELOCITY
		
	move_and_slide()
	
	var collision = move_and_collide(velocity * delta)
	#for i in get_slide_collision_count():
		#collision = get_slide_collision(i)
		#if collision.get_collider().is_in_group("obstacles"):
func _on_area_2d_area_entered(area: Area2D) -> void:
	print("yes")
	get_tree().call_deferred("change_scene_to_packed", preload("res://Scene/end_game_scene.tscn"))
