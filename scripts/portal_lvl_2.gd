extends Area2D

@export_file("*.tscn") var target_level: String = "res://levels/level_3.tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if target_level != "":
			#change scene to deferred or free deferred.
			get_tree().call_deferred("change_scene_to_file", "res://levels/level_3.tscn")
