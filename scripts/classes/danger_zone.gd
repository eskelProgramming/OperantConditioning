## An area that will kill [Mac] on collision.
class_name DangerZone

extends Area2D

## If [Mac] is [param body], [method Mac.handle_danger].
func _on_body_entered(body: Node2D) -> void:
	if body is Mac:
		body.handle_danger()
