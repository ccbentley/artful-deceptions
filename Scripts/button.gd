extends Node

func _process(delta):
	if(self.modulate.a == 0):
		self.disabled = true
	elif(self.get_parent() != null and self.get_parent().name != "CanvasLayer"):
		if(self.get_parent().modulate.a == 0):
			self.disabled = true
		else:
			self.disabled = false
	else:
		self.disabled = false
