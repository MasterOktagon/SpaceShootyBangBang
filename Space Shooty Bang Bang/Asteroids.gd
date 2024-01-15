extends Node2D


# Called when the node enters the scene tree for the first time.

const asteroid = preload("res://asteroid.tscn")

func _ready():
	randomize()
	for i in range(10):
		var a := asteroid.instantiate()
		a.transform.origin = Vector2(randi() % 2048 - 1024, randi() % 2048 - 1024)
		add_child(a)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
