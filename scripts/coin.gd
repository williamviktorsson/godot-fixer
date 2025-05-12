extends Area2D

@onready var point_manager = %PointManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	point_manager.add_point()
	animation_player.play("pickup")
