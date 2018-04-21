extends StaticBody2D
# get the area2d node that is a child of this node
onready var area2d = get_node("Area2D")

func _ready():
	print("Hello")
	#connect the signal to a callback function
	area2d.connect("body_entered", self, "_on_brick_body_enter")

func _on_brick_body_enter(body):
	#if the ball hit the brick, destroy it
	if body.get_name() == "Puck":
		queue_free()

func _on_Area2D_body_entered(body):
	print("Collision (body_entered)")

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	print("Collision (body_shape_entered)")
