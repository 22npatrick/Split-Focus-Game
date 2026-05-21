extends Sprite2D

var speed = 5

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_W:
			var velocity = Vector2.UP * speed
			position += velocity
		if event.keycode == KEY_A:
			var velocity = Vector2.LEFT * speed
			position += velocity 
		if event.keycode == KEY_S:
			var velocity = Vector2.DOWN * speed
			position += velocity 
		if event.keycode == KEY_D:
			var velocity = Vector2.RIGHT * speed
			position += velocity  
