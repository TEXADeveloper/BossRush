extends RigidBody2D;

@export var jump_force:float = 500;
@export var speed:int = 400;
var movement_direction:int = 0;

func _ready():
	InputHandler.connect('sendMovement', receive_movement);
	InputHandler.connect('sendMousePosition', receive_mouse_position);
	InputHandler.connect('sendJump', receive_jump);
	InputHandler.connect('sendDown', receive_down);
	pass;

func _process(_delta):
	pass;

func receive_movement(value:int):
	movement_direction = value;
	if movement_direction != 0:
		self.linear_velocity.x = movement_direction * speed;
	else:
		self.linear_velocity.x = 0;
	pass;

func receive_mouse_position(value:Vector2):
	##working properly
	##print(value);
	pass;

func receive_jump():
	self.linear_velocity.y = -jump_force;
	pass;

func receive_down():
	##print("down");
	pass;
