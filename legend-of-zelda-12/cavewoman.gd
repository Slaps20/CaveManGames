extends Area2D

@onready var animation_player = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		play_animation()

func play_animation():
	animation_player.play("scaled_text")
	await get_tree().create_timer(3.0).timeout
	get_tree().call_deferred("change_scene_to_file", "res://win_scene.tscn")
