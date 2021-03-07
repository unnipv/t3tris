extends Spatial

onready var level = get_tree().get_root().get_node("Level")
# called every physics step (60 times a second)
func _physics_process(delta):
	move()
	
func move():
	
	var input = Vector3()
	var should_move = {'forward': false, 
					   'backward': false,
					   'left': false,
					   'right': false,
					   'down': false
					  }
	var cubes = get_children()
#	print(str(cubes))
	for cube in cubes:
		var pos = cube.global_transform.origin
		if pos.z <= 5:
			if level.grid[floor(pos.y/2)][floor((pos.z+2)/2)][floor(pos.x/2)] == 0:
				should_move['forward'] = true
		else:
			should_move['forward'] = false
		if pos.z >= 1:
			if level.grid[floor(pos.y/2)][floor((pos.z-2)/2)][floor(pos.x/2)] == 0:
				should_move['backward'] = true
		else:
			should_move['backward'] = false
		if pos.x <= 5:
			if level.grid[floor(pos.y/2)][floor(pos.z/2)][floor((pos.x+2)/2)] ==0:
				should_move['left'] = true
		else:
			should_move['left'] = false
		if pos.x >= 1:
			if level.grid[floor(pos.y/2)][floor(pos.z/2)][floor((pos.x-2)/2)] ==0:
				should_move['right'] = true
		else:
			should_move['right'] = false
		if pos.y >= 1.1:
			if level.grid[floor((pos.y-2)/2)][floor(pos.z/2)][floor(pos.x/2)] == 0:
				should_move['down'] = true
		else:
			should_move['down'] = false
	for cube in cubes:
		var pos = cube.global_transform.origin
		if pos.z < 1:
			should_move['backward'] = false
		if pos.z > 5:
			should_move['forward'] = false
		if pos.x < 1:
			should_move['right'] = false
		if pos.x > 5:
			should_move['left'] = false
		if pos.y < 1.1:
			should_move['down'] = false
#	print(should_move)
	#check if final position
	var is_settled = try_settle(should_move)
	if !is_settled:
		if Input.is_action_just_pressed("move_forward") and should_move['forward']:
			input.z = 1
		if Input.is_action_just_pressed("move_backward") and should_move['backward']:
			input.z = -1
		if Input.is_action_just_pressed("move_left") and should_move['left']:
			input.x = 1
		if Input.is_action_just_pressed("move_right") and should_move['right']:
			input.x = -1
		if should_move['down']:
			input.y = -0.1
	# normalize the input vector to prevent increased diagonal speed
#	input = input.normalized()
	translate(input)
#!flags['forward'] and !flags['backward'] and !flags['left'] and !flags['right'] and 
func try_settle(flags):
	var cubes = get_children()
	if !flags['down']:
		for cube in cubes:
			var pos = cube.global_transform.origin
			level.grid_ob[floor(pos.y/2)][floor(pos.z/2)][floor(pos.x/2)] = cube
			level.grid[floor(pos.y/2)][floor(pos.z/2)][floor(pos.x/2)] = 1
			return true
	else:
		return false
			

