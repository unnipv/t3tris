extends Spatial

var score = 0
var block_count = 0
#var objects=["res://Blocks/Block_O.tscn","res://Blocks/Block_I.tscn","res://Blocks/Block_T.tscn","res://Blocks/Block_S.tscn"] 
func _ready():
	randomize()
#	var block = load(objects[randi()%4])
	var block = load("res://Blocks/Block_T.tscn")
	block_count += 1
	score += 1
	var block_instance = block.instance()
	add_child(block_instance)
	block_instance.set_id(block_count)
	$Timer.start()
	
func _on_Timer_timeout():
#	var block = load(objects[randi()%4])
	var block = load("res://Blocks/Block_T.tscn")
	block_count+=1
	score+=1
	var block_instance = block.instance()
	add_child(block_instance)
	block_instance.set_id(block_count)
	$Timer.start()
	
func update_score():
	score+=10
	
func _process(delta):
	($CanvasLayer/NinePatchRect/HBoxContainer/score).text="Score "+str(score)
