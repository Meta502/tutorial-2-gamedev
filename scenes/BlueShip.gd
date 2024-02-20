extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var impulse_strength = 3
export var rotation_impulse = 40
var reset = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("move_up"):
		var angle = self.rotation
		apply_central_impulse(Vector2(sin(angle), -cos(angle)) * impulse_strength)
		
	if Input.is_action_pressed("move_down"):
		var angle = self.rotation
		apply_central_impulse(-1 * Vector2(sin(angle), -cos(angle)) * impulse_strength)
	
	if Input.is_action_pressed("move_right"):
		apply_torque_impulse(rotation_impulse)
		
	if Input.is_action_pressed("move_left"):
		apply_torque_impulse(-rotation_impulse)
		
func _integrate_forces(state):
	if reset:
		state.transform = Transform2D(0.0, Vector2(141, 476))
		reset = false
