extends Node


# Declare member variables here. Examples:
export(float) var health = 100
export(float) var development = 1

signal right_clicked(node)

# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateRootSprite()

func next_season():
	#TODO replace root with growed root
	development += 1
	UpdateRootSprite()
	
func next_tick():
	health = max(1, health - 1)
	
func UpdateRootSprite():
	#Load sprite(develpm)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text = String (round(health))

func _on_Area2D_input_event(viewport, event, shape_idx):
		if Input.is_action_just_pressed("right-click"):
			emit_signal("right_clicked", self)
