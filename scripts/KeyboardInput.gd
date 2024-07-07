extends Control


@onready var input = $LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	input.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_line_edit_text_submitted(new_text):
	print(new_text)
	var text = input.text
	input.clear()
	get_tree().call_group("Enemies", "check_input_text",text)
