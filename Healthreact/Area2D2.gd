extends KinematicBody2D

export var speed: float = 200

func _process(delta: float):
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - global_position).normalized()
	var velocity = direction * speed
	
	move_and_slide(velocity)


func _on_Area2D_body_entered(body: Node) -> void:
	print("lol")
