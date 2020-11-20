extends Node


# Declare member variables here
export(int) var health;
export(int) var development;

export(Script) var leave;
export(Script) var thorn1;
export(Script) var thorn2;
export(Script) var bud;
export(Script) var bush;

var parent_branch;
var child_branch;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
