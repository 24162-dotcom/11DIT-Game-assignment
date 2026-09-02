extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer2.play("level_3_HELL_V2")
	$AnimationPlayer.play("level_3_HELL")
