extends StaticBody2D

func _on_Area2D_body_entered(body):
	if body.get_name() == "Puck":
		# Stop the puck
		print("Puck in net, game over")
		get_parent().get_node("Puck").angular_velocity = 0
		get_parent().get_node("Puck").applied_force = Vector2(0, 0)
		get_parent().get_node("Puck").speed = 0
		get_parent().get_node("Puck").friction = 1
		get_parent().get_node("Puck").hide()
		get_parent().get_node("Puck").queue_free()
		get_parent().get_parent().get_node("Modal").show()
