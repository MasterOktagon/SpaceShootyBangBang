class_name Asteroid
extends RigidBody2D

var velocity: float = 0
var hull: float = 1000.
const max_hull: float = 150.

signal destroyed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _pysics_process(delta):
	velocity = linear_velocity.length()
	
func _ready():
	hull = max_hull

func _on_body_entered(body):
	if body is Bullet:
		hull -= (velocity+body.velocity*body.mass/100*body.DAMAGE)*0.3
	else:
		hull -= (velocity+body.velocity*body.mass/10000)*0.3
	
func _process(delta):
	if hull <= 0:
		queue_free()
		emit_signal("destroyed")
