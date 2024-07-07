extends CharacterBody2D

const CHARACTERS = 'abcdefghijklmnopqrstuvwxyz'

@export var SPEED: float = 20.0

@onready var word = $Label

@onready var animation_player = $AnimationPlayer


var should_die = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	word.text = generate_word(CHARACTERS, 3)
	
	# set default animation to looping
	var a = animation_player.get_animation("default")
	a.loop_mode = Animation.LOOP_LINEAR
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if (should_die):
		return
	
	self.velocity.x = -1 * SPEED
	# Move the character
	move_and_slide()


func check_input_text(text: String):
	if (text == word.text):
		self.velocity.x = 0
		should_die = true
		animation_player.play("die")



func generate_word(chars, length):
	var word: String
	var n_char = len(chars)
	for i in range(length):
		word += chars[randi()% n_char]
	return word
