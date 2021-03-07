extends KinematicBody
 
var moveSpeed : float = 10
var gravity : float = 15.0
 
var vel : Vector3 = Vector3()
 
# called every physics step (60 times a second)
func _physics_process(delta):
	if not is_on_floor():
		move()
	
func move():
	vel.x = 0
	vel.z = 0
	vel.y = -4
	
	var input = Vector3()
	
	# movement inputs
	if Input.is_action_just_pressed("move_forward"):
		input.z = 1
	if Input.is_action_just_pressed("move_backward"):
		input.z = -1
	if Input.is_action_just_pressed("move_left"):
		input.x = 1
	if Input.is_action_just_pressed("move_right"):
		input.x = -1
	
	# normalize the input vector to prevent increased diagonal speed
	input = input.normalized()
	
	# get the relative direction
#	var dir = (transform.basis.z * input.z + transform.basis.x * input.x)
	
	# apply the direction to our velocity
#	vel.x = dir.x * moveSpeed
#	vel.z = dir.z * moveSpeed
	
	# gravity
#	vel.y -= gravity * delta
	
	# move along the current velocity
	translate(input)
	vel = move_and_slide(vel, Vector3.UP)


