extends Node2D


@onready var enemyScene = load("res://scenes/Enemy.tscn")

@onready var scoreHud = $Camera2D/Control/Score

@export var score = 0;


@export var word_length = 3;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var instance = enemyScene.instantiate()
	instance.connect("enemyDied", self.on_enemy_died)
	instance.position.x = 200
	instance.position.y = -5
	add_child(instance)
	pass # Replace with function body.


func on_enemy_died():
	score += 10 * word_length
	scoreHud.text = "Score: "+str(score)
	print("bro")
