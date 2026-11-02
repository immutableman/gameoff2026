extends Node3D
class_name Player

@export var spin_sensativity := 3

@export var left_hand: Node3D
@export var right_hand: Node3D

@onready var _camera_arm: Node3D = $CameraArm

var _left: Vector2
var _right: Vector2

func _physics_process(delta: float) -> void:
	_left = Input.get_vector("left_hand_left", "left_hand_right", "left_hand_up", "left_hand_down")
	_right = Input.get_vector("right_hand_left", "right_hand_right", "right_hand_up", "right_hand_down")
	var spin := (_left.y - _right.y)/2
	_camera_arm.rotate_y(spin * delta * spin_sensativity)
