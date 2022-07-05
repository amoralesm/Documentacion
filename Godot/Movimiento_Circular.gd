var angle_increase_speed = PI
var radius = Vector2(300.0, 150.0)

var angle = 0.00

onready var start_position = position
onready var previous_position = start_position


func _process(delta):

	angle = wrapf(angle + angle_increase_speed * delta, 0.0, TAU)
	print(angle)
	var direction = Vector2(cos(angle), sin(2*angle))
	previous_position = position
	position = start_position + direction * radius
	rotation = (position - previous_position).angle()	
