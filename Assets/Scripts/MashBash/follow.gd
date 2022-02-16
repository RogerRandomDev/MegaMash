extends KinematicBody2D

export var follow:NodePath

var hoverDir=Vector2.ZERO
var hoverForce = 48
var hoverTime=0

#the A.I. that follows the player
#just bobs up and down
func _process(delta):
	hoverDir = (position-get_node(follow).position+Vector2(0,48))*5
	hoverDir.y += hoverForce*sin(hoverTime*PI)
	if hoverTime >= 1: hoverTime = 0
	hoverTime+=delta
# warning-ignore:return_value_discarded
	move_and_collide(-hoverDir*delta)
