extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_health_bar(percent: int):
	$healthBar.value = percent
	
func set_energy_bar(percent: int):
	$energyBar.value = percent

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
