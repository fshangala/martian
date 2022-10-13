extends RigidBody2D

var TYPE = "COIN"
export var BONUS = 1

func destroy():
	queue_free()
