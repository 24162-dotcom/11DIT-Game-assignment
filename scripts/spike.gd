extends Area2D


func _on_body_entered(body):
	if body is player:
		# Replace with your actual level file path
		#get_tree().call_deferred("change_scene_to_file", "res://level_2.tscn")
		body.respawn()
	
