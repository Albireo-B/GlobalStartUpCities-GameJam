extends Node


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func next_season():
	for bush_part in get_children():
		bush_part.next_season()	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		next_season()

func next_tick():
	for bush_part in get_children():
		bush_part.next_tick()
