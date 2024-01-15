
class_name Ship
extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hull = max_hull
	energy = MAX_ENERGY*0.5
	randomize()


@export var thrust: Vector2 = Vector2(0, -2500000)
var hull: float = 1000.
const max_hull: float = 1000.
var velocity: float = 0.
var energy: float = 500.
const MAX_ENERGY = 1000.

const bullet = preload("res://bullet.tscn")

signal change_health(percent: float)
signal change_energy(percent: float)

func _physics_process(delta):
	if Input.is_action_pressed("SpeedUp"):
		apply_force(thrust.rotated(rotation))
		$Tex.animation = "thrust"
		$Emission.emitting = true
	else:
		apply_force(Vector2())
		$Tex.animation = "idle"
		$Emission.emitting = false
	if Input.is_action_pressed("ui_right"):
		rotate(0.1)
	if Input.is_action_pressed("ui_left"):
		rotate(-0.1)
	velocity = linear_velocity.length()

	if Input.is_action_just_pressed("Shoot"):
		if energy >= 10:
			var b := bullet.instantiate()
			var rotrand := (randf()-0.5) * PI/8
			b.transform.origin = transform.origin + Vector2(0, -10).rotated(rotation)
			b.linear_velocity = linear_velocity.rotated(rotrand) + Vector2(0, -300).rotated(rotation + rotrand)
			b.rotation = rotation # rotrand
			$"..".add_child(b)
			energy -= 10
			
func _process(delta):
	energy = min(MAX_ENERGY, energy + 20 * delta)
	emit_signal("change_energy", energy/MAX_ENERGY*100)

func _on_body_entered(body): # detect collisions
	if not body is Bullet:
		print(hull, " ", velocity)
		hull -= velocity*0.3
		print("Collision: velocity ", round(hull/max_hull*100))
		emit_signal("change_health", round(hull/max_hull*100))
