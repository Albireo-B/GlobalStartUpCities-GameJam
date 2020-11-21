extends Node


# Declare member variables here. Examples:
var node_selected


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Timer").start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_Timer_timeout():
	get_node("Timer").start()
	get_node("Bush").next_tick()
	

func _on_Object_right_clicked(node):
	if node_selected:
		Unselect()
		node_selected.location = node
		node_selected = null
		
		
func _on_Thorn_left_clicked(node):
	if node_selected:
		Unselect()
	node_selected = node
	node_selected.get_node("Sprite").material.set_shader_param("width",10)
	for child in node_selected.get_node("Ants").get_children():
		child.get_node("Sprite").material.set_shader_param("width",10)
	

func Unselect():
	node_selected.get_node("Sprite").material.set_shader_param("width",0)
	for child in node_selected.get_node("Ants").get_children():
		child.get_node("Sprite").material.set_shader_param("width",0)
