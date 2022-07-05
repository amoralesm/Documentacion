var angular_speed : float = PI
var speed : float = 400.0

func _process(delta):
	var direction_rotation : int = 0
	
	if Input.is_action_pressed("ui_left"):
		direction_rotation = -1
	if Input.is_action_pressed("ui_right"):
		direction_rotation = 1
	
	rotation += angular_speed * direction_rotation * delta
	
	var direction_move : Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction_move = Vector2.UP
	if Input.is_action_pressed("ui_down"):
		direction_move = Vector2.DOWN
	
	var velocity = direction_move.rotated(rotation) * speed #No se multiplica por delta, por que realmente aqui no estamos traducciendo los pixeles/s a un movimiento real del caracter en frames.
	position += velocity * delta #Aqui hacemos la traduccion a los frames, por lo q si se aplica el *delta