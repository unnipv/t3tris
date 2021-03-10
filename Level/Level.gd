extends Spatial

var score=0
var howmany=0
#var objects=["res://Blocks/Block_O.tscn","res://Blocks/Block_I.tscn","res://Blocks/Block_T.tscn","res://Blocks/Block_S.tscn"] 
func _ready():
	randomize()
#	var x=load(objects[randi()%4])
	var x= load("res://Blocks/Block_T.tscn")
	howmany+=1
	score+=1
	var type=x.instance()
	add_child(type)
	type.set_id(howmany)
	$Timer.start()
	
func _on_Timer_timeout():
#	var x=load(objects[randi()%4])
	var x= load("res://Blocks/Block_T.tscn")
	howmany+=1
	score+=1
	var type=x.instance()
	add_child(type)
	type.set_id(howmany)
	$Timer.start()
	
func update_score():
	score+=10
func _process(delta):
	($CanvasLayer/NinePatchRect/HBoxContainer/score).text="Score "+str(score)
