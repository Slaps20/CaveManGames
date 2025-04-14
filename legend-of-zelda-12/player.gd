extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var club_area = $club/Area2D

func _input(event):
	if sprite.flip_h == false:
		if event.is_action_pressed("swing_club"):
			$club/Sprite2D.visible = true
			animation_player.play("club_swing_right")
			await get_tree().create_timer(.2).timeout
			$club/Sprite2D.visible = false
	if sprite.flip_h == true:
		if event.is_action_pressed("swing_club"):
			$club/Sprite2D.visible = true
			animation_player.play("club_swing_left")
			await get_tree().create_timer(.2).timeout
			$club/Sprite2D.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		sprite.flip_h = false
		velocity.x = 300
	elif Input.is_action_pressed("left"):
		sprite.flip_h = true
		velocity.x = -300
	elif Input.is_action_pressed("up"):
		velocity.y = -300
	elif Input.is_action_pressed("down"):
		velocity.y = 300
	else:
		velocity.x = 0
		velocity.y = 0

	move_and_slide()
