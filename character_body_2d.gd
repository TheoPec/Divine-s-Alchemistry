extends CharacterBody2D

@export var speed := 150.0
@export var gravity := 1000.0
@export var jump_impulse := 300.0
@export var jump_hold_gravity := 300.0

var is_dead := false

func _physics_process(delta):
	if is_dead:
		return  # empêche tout mouvement si mort

	var sprite := $AnimatedSprite2D

	# --- Déplacement horizontal ---
	var direction := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * speed

	# --- Saut immédiat ---
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jump_impulse

	# --- Saut prolongé ---
	if Input.is_action_pressed("ui_accept") and velocity.y < 0:
		velocity.y += jump_hold_gravity * delta
	else:
		velocity.y += gravity * delta

	move_and_slide()

	# --- Animation ---
	if not is_on_floor():
		sprite.play("jump")
	elif direction != 0:
		sprite.play("walk")
		sprite.flip_h = direction < 0
	else:
		sprite.play("idle")


func die():
	if is_dead:
		return
	is_dead = true
	velocity = Vector2.ZERO
	$AnimatedSprite2D.play("death")

	# attendre la fin de l’animation avant de relancer la scène
	await $AnimatedSprite2D.animation_finished
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.die()
