extends Node

export(int) var max_health = 2 setget set_max_health
var health = max_health setget set_health

signal no_health
signal health_changed
signal max_health_changed

func set_max_health(value):
	max_health = value
	health = clamp(health, 0, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")

func _ready():
	self.health = max_health
