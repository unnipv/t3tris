extends Camera

const CAMERA_SPEED = 20

#func _input(event):
#	if event is InputEventMouseMotion:
#		rotation = h_camera_rotation(-event.relative.x/mouse_sensitivity)
#		$Camera.rotation = v_camera_rotation(-event.relative.y/mouse_sensitivity)
#
#func move():
##	var movement_dir = get_2D_movement_dir()
#	var direction = Vector3.ZERO
#	var camera_xform = $Camera.global_transform
#
#	direction -= camera_xform.basis.z.normalized() * movement_dir.x
#	direction += camera_xform.basis.x.normalized() * movement_dir.y
#	direction.y = 0
#	motion = direction
#	move_and_slide(motion * SPEED, UP)
#func h_camera_rotation(camera_rotation):
#	return rotation + Vector3(0,camera_rotation,0)
#
#func v_camera_rotation(camera_rotation):
#	var rot = $Camera.rotation + Vector3(camera_rotation,0,0)
#	rot.x = clamp(rot.x, PI/-8, PI/8)
#	return rot
