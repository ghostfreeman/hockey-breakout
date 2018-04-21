extends StaticBody2D
# get the area2d node that is a child of this node
onready var area2d = get_node("Area2D")

func _ready():
	#connect the signal to a callback function
	area2d.connect("body_enter", self, "_on_brick_body_enter")

func _on_brick_body_enter(body):
	#if the ball hit the brick, destroy it
	if body.get_name() == "Puck":
		queue_free()
