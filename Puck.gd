extends RigidBody2D

var speed setget set_speed, get_speed # ball speed

func _ready():
	pass

func adjust_angle():
	var MinAngle = 20 # Once it travels at <= 20, the pace slows down and its not fun
	var LinearVelo = linear_velocity.normalized() * speed
	var Angle = rad2deg(LinearVelo.angle_to(Vector2(1,0)))
	
	# Control Bounce Trajectory
	if(Angle > 0 and Angle < MinAngle):
		Angle = Angle - MinAngle # < 0 deg
	elif (Angle < 0 and Angle >- MinAngle):
		Angle = Angle + MinAngle # > 0 deg
	elif (Angle > 180 - MinAngle and Angle < 180):
		Angle = Angle - 180 + MinAngle # > 0 deg
	elif (Angle < - 180 + MinAngle and Angle >- 180):
		Angle = Angle + 180 - MinAngle # < 0 deg
	else:
		Angle = 0
	
	if Angle != 0:
		LinearVelo = LinearVelo.rotated(deg2rad(Angle))
		linear_velocity = LinearVelo
	


	#if angle!=0:
	#	lv= lv.rotated(deg2rad(angle)) # we change the angle, but keep the speed
	#	set_linear_velocity(lv) 
	
func set_speed(new_speed):
	speed=new_speed
	
func get_speed():
	return speed