extends RigidBody2D

var TYPE = "FIREBALL"
export var DAMAGE = 1
export var SPEED = 1500
export var SPIN = 200

func destroy():
	queue_free()
	
func _on_Timer_timeout():
	queue_free()

func shoot(direction:int):
	linear_velocity.x = SPEED*direction
	angular_velocity = SPIN*direction
