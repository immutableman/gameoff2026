extends RigidBody3D

@export var camera: Camera3D
@export var left_hand: Node3D
@export var right_hand: Node3D

@export var torque_magnitude := 20

var _left: Vector2
var _right: Vector2

func _physics_process(delta: float) -> void:
	_left = Input.get_vector("left_hand_left", "left_hand_right", "left_hand_up", "left_hand_down")
	_right = Input.get_vector("right_hand_left", "right_hand_right", "right_hand_up", "right_hand_down")
	var l := camera.global_basis * Vector3(_left.x, 0, _left.y) * torque_magnitude
	#print(l, ' ',  l)
	var r := camera.global_basis * Vector3(_right.x, 0, _right.y) * torque_magnitude
	#apply_torque(torque)
	apply_force(l, left_hand.global_position - global_position)
	apply_force(r, right_hand.global_position - global_position)
