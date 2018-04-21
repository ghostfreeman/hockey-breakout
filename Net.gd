extends StaticBody2D

func _on_Area2D_body_entered(body):
	# Stop the puck
	print("Puck in net, game over")
	get_parent().get_node("Puck").hide()
	get_parent().get_parent().get_node("Modal").show()
