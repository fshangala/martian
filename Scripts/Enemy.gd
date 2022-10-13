extends RigidBody2D

var TYPE = "ENEMY"
var LIFE = 1
export var BONUS = 10
export var SPEED = 300
var offset = 10
var shootOffset = 32
var Direction = 0
var follow = null
var enemyBullet = preload("res://Scenes/EnemyBullet.tscn")

func die():
	Globals.SCORE += BONUS
	queue_free()

func _physics_process(delta):
	if LIFE < 1:
		die()
	
	if follow != null:
		if (follow.position.x-offset) > position.x:
			Direction = 1
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("Walk")
		elif (follow.position.x+offset) < position.x:
			Direction = -1
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("Walk")
		else:
			Direction = 0
			$AnimatedSprite.play("Idle")
	else:
		Direction = 0
		$AnimatedSprite.play("Idle")
	
	linear_velocity.x = SPEED*Direction
	
func _on_Detection_body_entered(body):
	follow = body


func _on_Detection_body_exited(body):
	follow = null


func _on_ShootTimer_timeout():
	if follow != null:
		if (follow.position.y+shootOffset) > position.y and (follow.position.y-shootOffset) < position.y:
			var bullet = enemyBullet.instance()
			bullet.position = position
			get_tree().root.add_child(bullet)
			bullet.shoot(Direction)
			
	$ShootTimer.start()


func _on_Hurt_body_entered(body):
	match body.TYPE:
		"FIREBALL":
			LIFE -= body.DAMAGE
			body.destroy()
