extends Node

signal max_changed(new_max)
signal changed(new_amount)
export(int) var max_amount = 10 setget set_max
onready var current = max_amount setget set_current
var current_hp

func _ready():
	_initialize()

func set_max(new_max):
	max_amount = new_max
	max_amount = max(1, new_max)
	emit_signal("max_changed", max_amount)
	
func set_current(new_value):
	current = new_value
	current = clamp(current, 0, max_amount)
	emit_signal("changed", current)
	
	if current == 0:
		emit_signal("depleted")
		
func _initialize():
		emit_signal("max_changed", max_amount)
		emit_signal("changed", current)
		
func hp_changed(_value : int):
	current_hp += 3
	$progress_bar.value = current_hp


func _on_Area2D_body_entered(body: Node) -> void:
	print("lol")
	current += 1
