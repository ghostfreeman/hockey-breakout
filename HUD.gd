extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("block_destroyed", self, "brick_destroy_score_up")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func brick_destroy_score_up():
	print("Connect Thrown")
	get_node("ScoreValue").text = get_node("ScoreValue").text + 10
