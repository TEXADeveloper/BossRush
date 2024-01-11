extends Node2D;

signal sendMovement;
signal sendMousePosition;
signal sendJump;
signal sendDown;

var move_direction:int = 0;
var prev_move_direction:int = move_direction;
var mouse_position:Vector2 = Vector2(0, 0);
var prev_mouse_position:Vector2 = mouse_position

func _process(_delta):
	if prev_move_direction != move_direction:
		prev_move_direction = move_direction;
		InputHandler.emit_signal('sendMovement', move_direction);
	
	mouse_position = get_global_mouse_position();
	if (mouse_position != prev_mouse_position):
		prev_mouse_position = mouse_position;
		InputHandler.emit_signal('sendMousePosition', mouse_position);
	pass;

func _input(event):
	if event.is_action_pressed("Move_Up"):
		InputHandler.emit_signal('sendJump');
	if event.is_action_pressed("Move_Down"):
		InputHandler.emit_signal('sendDown');
	if event.is_action_pressed("Move_Left"):
		add_direction_value(-1);
	if event.is_action_released("Move_Left"):
		add_direction_value(+1);
	if event.is_action_pressed("Move_Right"):
		add_direction_value(+1);
	if event.is_action_released("Move_Right"):
		add_direction_value(-1);
	pass;

func add_direction_value(value:int):
	prev_move_direction = move_direction;
	move_direction += value;
	pass;
