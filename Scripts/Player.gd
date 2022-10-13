extends KinematicBody2D

var TYPE = "PLAYER"
var velocity = Vector2.ZERO
var GRAVITY = 1500
var SPEED = 500
var JUMP_SPEED = 800
var CAN_SHOOT = true

var FireBall = preload("res://Scenes/Fireball.tscn")

func die():
	get_tree().change_scene("res://Scenes/Screens/GameOver.tscn")

func _physics_process(delta):
	if Globals.LIFE < 1:
		die()
		
	if position.y > 700:
		die()

	velocity.y += GRAVITY*delta
	
	if Input.is_action_pressed("ui_left"):
		Globals.DIRECTION = -1
		velocity.x = Globals.DIRECTION*SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")
	elif Input.is_action_pressed("ui_right"):
		Globals.DIRECTION = 1
		velocity.x = Globals.DIRECTION*SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
	else:
		velocity.x = 0
		$AnimatedSprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			velocity.y = -JUMP_SPEED
	else:
		$AnimatedSprite.play("Jump")
	
	if Input.is_action_pressed("shoot") and CAN_SHOOT:
		var bullet = FireBall.instance()
		bullet.position = position
		get_tree().root.add_child(bullet)
		bullet.shoot(Globals.DIRECTION)
		CAN_SHOOT=false
		$Timer.start()

	velocity = move_and_slide(velocity,Vector2.UP)
	
	Globals.PLAYER_POSITION = global_position


func _on_Area2D_body_entered(body):
	match body.TYPE:
		"COIN":
			Globals.SCORE += body.BONUS
			body.destroy()
		"BOMB":
			Globals.LIFE -= body.DAMAGE
			body.destroy()
		"ENEMY_BULLET":
			Globals.LIFE -= body.DAMAGE
			body.destroy()


func _on_Timer_timeout():
	CAN_SHOOT=true
