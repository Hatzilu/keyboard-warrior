extends CharacterBody2D

const CHARACTERS = 'abcdefghijklmnopqrstuvwxyz'

@export var SPEED: float = 20.0

@onready var word = $Label

@onready var animation = $AnimatedSprite2D


var should_die = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	word.text = generate_word(CHARACTERS, 3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	#var velocity: Vector2 = -1 * SPEED
	if (should_die):
		return
	
	self.velocity.x = -1 * SPEED
	# Move the character
	move_and_slide()


func check_input_text(text: String):
	print("hi im enemy, text is ")
	if (text == word.text):
		self.velocity.x = 0
		should_die = true
		animation.play("die")
		#self.queue_free()



func generate_word(chars, length):
	var word: String
	var n_char = len(chars)
	for i in range(length):
		word += chars[randi()% n_char]
	return word


func _on_animated_sprite_2d_animation_finished():
	if (animation.animation == "die"):
		queue_free()
