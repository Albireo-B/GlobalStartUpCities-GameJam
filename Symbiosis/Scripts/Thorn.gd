extends Node


# Declare member variables here. Examples:
onready var ant_instance = load("res://Scenes/Ant.tscn")
export(float) var health = 50
signal left_clicked(node)
signal right_clicked(node)
var location

# Called when the node enters the scene tree for the first time.
func _ready():
	location = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text =  String (round(health/10))

	while get_node("Ants").get_child_count() < round(health/10):
		get_node("Ants").add_child(ant_instance.instance())
		
	while get_node("Ants").get_child_count() > round(health/10):
		get_node("Ants").get_children()[0].free()
		

func next_tick():
	if location.is_in_group("Leave"):
		health = min(100, health + location.moucheron_health / 20)
		location.moucheron_health = max(0, location.moucheron_health - health / 20)
	elif location.is_in_group("Branch"):
		location.health = min(100*location.development, location.health + health / 20)
		health = max(10, health - 1)
	elif location.is_in_group("Root"):
		location.health = min(100*location.development, location.health + health / 20)
		health = max(10, health - 1)
		#tofinish

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("left-click"):
		emit_signal("left_clicked", self)
	elif Input.is_action_just_pressed("right-click"):
		emit_signal("right_clicked", self)
