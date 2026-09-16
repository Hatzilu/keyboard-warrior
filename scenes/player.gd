extends AnimatedSprite2D

@onready var timer: Timer = $TypingTimer
@onready var anim_plr: AnimationPlayer = $AnimationPlayer
@onready var anim_tree: AnimationTree = $AnimationTree



#func _ready() -> void:
	#anim_plr.default
func _process(delta: float) -> void:
	var is_casting = anim_tree["parameters/conditions/is_casting"];
	if is_casting:
		anim_plr.play("cast_anim")
	else:
		anim_plr.play("default")
		

func _on_line_edit_text_changed(new_text: String) -> void:
	print("change")
	timer.start()
	anim_tree["parameters/conditions/is_casting"] = true

func _on_line_edit_text_submitted(new_text: String) -> void:
	pass

func _on_typing_timer_timeout() -> void:
	anim_tree["parameters/conditions/is_casting"] = false
	pass # Replace with function body.
