extends CharacterBody2D

@onready var sprite = $Sprite2D

var speed = 100
var top_limit = -300
var bottom_limit = 50
var direction = 1

func _physics_process(delta: float) -> void:
	velocity.y = speed * direction
	move_and_slide()

	if position.y > bottom_limit:
		direction = -1
	elif position.y < top_limit:
		direction = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.queue_free()
		await get_tree().create_timer(1.0).timeout
		get_tree().call_deferred("change_scene_to_file", "res://lose_scene.tscn")
