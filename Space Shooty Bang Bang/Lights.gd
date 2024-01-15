extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vp := get_viewport_rect().size
	transform.origin = $"../Ship".transform.origin - vp/2
	$light.texture_scale = vp.x/100
	$shadow.texture_scale = vp.x/100
