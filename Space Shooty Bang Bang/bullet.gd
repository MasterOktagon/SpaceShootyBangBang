
class_name Bullet
extends RigidBody2D

@onready var DAMAGE = 20
@onready var MAX_LIFE = 3
var velocity: float = 0

func _ready():
	print("Hello")
	$Life.wait_time = MAX_LIFE
	$Life.start()

func _on_life_timeout():
	queue_free()
	
func _physics_process(delta):
	velocity = linear_velocity.length()

func _on_body_entered(body):
	if not body is Ship:
		queue_free()
