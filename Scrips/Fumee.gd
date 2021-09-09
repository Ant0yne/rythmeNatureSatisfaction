extends AnimatedSprite

var compteur = int(0)
var fumee_visible = bool(true)
var max_alpha = 0.29
var max_compteur = 600
var min_compteur = 360

func _ready():
	fumee_visible = true
	self.modulate.a = max_alpha

func _process(delta):
	compteur += 1
	if compteur > rand_range(min_compteur, max_compteur) and fumee_visible == true :
		self.modulate.a -= 0.001
		if self.modulate.a <= 0:
			compteur = 0
			fumee_visible = false
	if compteur > max_compteur and fumee_visible == false :
		self.modulate.a += 0.001
		if self.modulate.a >= max_alpha :
			compteur = 0
			fumee_visible = true
