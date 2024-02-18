extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func	_physics_process(delta):
	$Camera2D.position = get_global_mouse_position() / 20 + Vector2(290, 130)
	$TextureRect2.rect_position = get_global_mouse_position() / 30 + Vector2(400, 20)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
