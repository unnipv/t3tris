extends Spatial

var can_move=true
var id=0
func _ready():
	$Timer.start()
	pass
var rel_positions=[Vector3(0,0,0),Vector3(0,-1,0),Vector3(-1,-1,0),Vector3(1,-1,0)]
var my_grid="../GridMap"

func try_to_move():
	if(can_move==false):
		return 
	if(Input.is_action_just_pressed("ui_right")):
		var poss=1
		for i in range(4):
			if(get_node(my_grid).is_node_valid(rel_positions[i]+Vector3(1,0,0),id)):
				continue
			poss=0
			break
		if(poss==1):
			for i in range(4):
				get_node("Basic_unit"+str(i)).translation.x+=1
				get_node(my_grid).set_position(rel_positions[i],-1)
				rel_positions[i].x+=1
			for i in range(4):
				get_node(my_grid).set_position(rel_positions[i],8*id+i)
	if(Input.is_action_just_pressed("ui_left")):
		var poss=1
		for i in range(4):
			if(get_node(my_grid).is_node_valid(rel_positions[i]+Vector3(-1,0,0),id)):
				continue
			poss=0
			break
		if(poss==1):
			for i in range(4):
				get_node("Basic_unit"+str(i)).translation.x-=1
				get_node(my_grid).set_position(rel_positions[i],-1)
				rel_positions[i].x-=1
			for i in range(4):
				get_node(my_grid).set_position(rel_positions[i],8*id+i)
	if(Input.is_action_just_pressed("ui_up")):
		var poss=1
		for i in range(4):
			if(get_node(my_grid).is_node_valid(rel_positions[i]+Vector3(0,0,-1),id)):
				continue
			poss=0
			break
		if(poss==1):
			for i in range(4):
				get_node("Basic_unit"+str(i)).translation.z-=1
				get_node(my_grid).set_position(rel_positions[i],-1)
				rel_positions[i].z-=1
			for i in range(4):
				get_node(my_grid).set_position(rel_positions[i],8*id+i)
	if(Input.is_action_just_pressed("ui_down")):
		var poss=1
		for i in range(4):
			if(get_node(my_grid).is_node_valid(rel_positions[i]+Vector3(0,0,1),id)):
				continue
			poss=0
			break
		if(poss==1):
			for i in range(4):
				get_node("Basic_unit"+str(i)).translation.z+=1
				get_node(my_grid).set_position(rel_positions[i],-1)				
				rel_positions[i].z+=1
			for i in range(4):
				get_node(my_grid).set_position(rel_positions[i],8*id+i)
				
func _process(delta):
	try_to_move()
	
func _on_Timer_timeout():
	var poss=1
	for i in range(rel_positions.size()):
		if(get_node(my_grid).is_node_valid(rel_positions[i]+Vector3(0,-1,0),id)):
			continue
		poss=0
		break
	if(poss==1):
		for i in range(rel_positions.size()):
			get_node("Basic_unit"+str(i)).translation.y-=1
			get_node(my_grid).set_position(rel_positions[i],-1)
			rel_positions[i].y-=1
		for i in range(rel_positions.size()):
			get_node(my_grid).set_position(rel_positions[i],8*id+i)
	else:
		can_move=false
	$Timer.start()
	
func set_id(howmany):
	id=howmany
	
func set_invisible(which):
	if(abs(which-8*id)>=4):
		return 
	get_node("Basic_unit"+str(which-8*id)).hide()
	rel_positions.remove(which-8*id)
