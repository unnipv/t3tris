extends Spatial

export var max_wait = 10

var blocks = {}

func _ready():
	blocks = file_grabber.get_files("res://Blocks/BlockMeshes/")
	randomize()
#	set_timer()

#func set_timer():
#	$Timer.wait_time = randi() % max_wait +1
	
func spawn():
	var block = load(blocks [randi() %blocks.size()]).instance()
	add_child(block)
	block.set_as_toplevel(true)
	block.global_transform = $Downward.global_transform
	
	var spawner_forward = global_transform.basis[2].normalized()
#	block.linear_velocity = spawner_forward * SPEED

func _on_Timer_timeout():
#	set_timer()
	spawn()
