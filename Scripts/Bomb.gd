extends RigidBody2D

var TYPE = "BOMB"
export var DAMAGE = 1

func destroy():
	queue_free()
