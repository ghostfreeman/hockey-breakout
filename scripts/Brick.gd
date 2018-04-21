extends StaticBody2D

var Score

# get the area2d node that is a child of this node
onready var area2d = get_node("Area2D")

func _ready():
	# Set the score in the HUD
	get_parent().get_parent().get_node("HUD/ScoreValue").text = "0"
	#connect the signal to a callback function
	area2d.connect("body_entered", self, "_on_brick_body_enter")

func _on_brick_body_enter(body):
	#if the ball hit the brick, destroy it
	if body.get_name() == "Puck":
		queue_free()
		var Score = int(get_parent().get_parent().get_node("HUD/ScoreValue").text)
		Score = Score + 100
		get_parent().get_parent().get_node("HUD/ScoreValue").text = str(Score);
