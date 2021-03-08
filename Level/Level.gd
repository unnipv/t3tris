extends Spatial


var grid = [[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
			[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]]

			

var grid_ob = [[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]],
			[[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null],[null,null,null,null]]]



func _process(delta):
	for i in range(0,13):
		var layer_full = true
		for j in range(4):
			for k in range(4):
				if grid[i][j][k] == 0:
					layer_full = false
		if layer_full:
			for j in range(4):
				for k in range(4):
					grid[i][j][k] = 0
					grid_ob[i][j][k].free()
