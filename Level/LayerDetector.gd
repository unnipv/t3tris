extends Node

var LayerCompleted = true

var Layer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

func _process(delta):
	var detectors = self.get_children()
	if Layer == [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]:
		clear_layer(detectors)
		Layer = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	else:
		for i in 16:
			if Layer[i] == 0:
				if detectors[i].is_colliding():
					Layer[i] = 1

func clear_layer(detectors):
	for obj in detectors:
		if obj.get_collider() != null:
#			if obj.get_collider().get_owner().has_method("unlock_movement"):
#				obj.get_collider().get_owner().unlock_movement()
			obj.get_collider().free()
			
