extends Node


# Declare member variables here. Examples:
export(float) var health = 100
export(float) var development = 1
signal right_clicked(node)

var moucheron_health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func next_season():
	development += 1
	SpawnMoucheron()
	UpdateLeaveSprite()

func UpdateLeaveSprite():
	pass
	#todo change sprite in function of development
	
func SpawnMoucheron():
	pass
	#todo add moucheron in function of development
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text =  String (round(health))
	get_node("Label2").text = String (round(moucheron_health/10))
	
func next_tick():
	if health == 0:
		health = 100
		development -= development - 1
		UpdateLeaveSprite()
	health = max(0, min(100, health + 2.5) -  20/get_tree().get_root().get_node("Game/Bush/Root").health - moucheron_health/20)
	moucheron_health = min(moucheron_health + 1, 100)
	
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("right-click"):
		emit_signal("right_clicked", self)

