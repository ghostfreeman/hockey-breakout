# paddle script
extends KinematicBody2D

# Speed of the Paddle
var speed = 700;
# Represenative of the paddle's direction on the x axis
var direction = 0

func _ready():
	set_process(true)

func _process(delta):
	# for calculating our movement velocity
	var motion = Vector2(0,0)

	# look for input with the left and right arrows
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	
	# set the direction to move in
	if left:
		direction = -1
	elif right:
		direction = 1
	else:
		direction = 0
		
	# apply and move the body
	
	motion = Vector2(direction,0) * speed * delta
	move_and_collide(motion)
	
	# Find the screen boundaries and keep the paddle from escaping the edge
	var bounds = get_viewport_rect().size
	if global_position.x > bounds.x-50:
		global_position = Vector2(bounds.x-50, global_position.y)
	elif global_position.x < 50:
		global_position = Vector2(50, global_position.y)

func _on_Area2D_body_entered(body):
	print("Paddle collision")
	print("Node Name: " + body.get_name())
	print("Type of object: " + str(typeof(body)))
	if (body.get_name() == "Puck"):
		var velocity = body.linear_velocity
		print("Puck Velocity: " + str(velocity))
		
		var PuckPos = body.position
		var StickPos = global_position
		var RelativePos = PuckPos.x - StickPos.x
		var Coefficient = (PuckPos.x - StickPos.x) / 100
		var DirectionRay = Coefficient * PI / 2.4
		velocity = velocity.rotated(DirectionRay)
		body.linear_velocity = velocity
		#body.adjust_angle()