extends Node2D


@onready var enemyScene = load("res://scenes/Enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	print("Baaals")
	var instance = enemyScene.instantiate()
	instance.position.x = 200
	instance.position.y = -5
	add_child(instance)
	pass # Replace with function body.
