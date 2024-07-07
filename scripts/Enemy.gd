extends CharacterBody2D

@export var SPEED: float = 20.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	#var velocity: Vector2 = -1 * SPEED
	
	self.velocity.x = -1 * SPEED
	# Move the character
	move_and_slide()
