extends Node

# Declare member variables here
export(float) var health = 100
export(float) var development = 1

signal right_clicked(node)

onready var branch_instance = load("res://Scenes/Branch.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func next_season():
	if get_node_or_null("Branch"):
		get_node("Branch").next_season()
	if get_node_or_null("Bud"):
		SpawnBranch()
	get_node("Leave").next_season()
	development += 1
	SpawnSeve()
	UpdateBranchSprite()

func next_tick():
	if get_node_or_null("Branch"):
		get_node("Branch").next_tick()
	health = max(0, health - 1 - 20/get_tree().get_root().get_node("Game/Bush/Root").health)
	get_node("Thorn").next_tick()
	get_node("Leave").next_tick()
	
func UpdateBranchSprite():
	pass

func SpawnSeve():
	pass
	
func SpawnBranch():
	branch_instance.transform = get_node("Bud").transform
	add_child(branch_instance)
	get_node("Bud").free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text = String (round(health))

func _on_Area2D_input_event(viewport, event, shape_idx):
		if Input.is_action_just_pressed("right-click"):
			emit_signal("right_clicked", self)
