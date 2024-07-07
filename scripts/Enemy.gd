extends CharacterBody2D

const CHARACTERS = 'abcdefghijklmnopqrstuvwxyz'

@export var SPEED: float = 20.0

@onready var word = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	word.text = generate_word(CHARACTERS, 3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	#var velocity: Vector2 = -1 * SPEED
	
	self.velocity.x = -1 * SPEED
	# Move the character
	move_and_slide()


func check_input_text(text: String):
	print("hi im enemy, text is ")
	if (text == word.text):
		self.queue_free()



func generate_word(chars, length):
	var word: String
	var n_char = len(chars)
	for i in range(length):
		word += chars[randi()% n_char]
	return word
