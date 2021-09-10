extends Node2D

const Piece = preload("res://Scenes/Piece.tscn")

onready var frame_compteur = FrameCompteur
onready var listes = Listes

var piece
var position_creation

var origine_zone_pop_x = int(30)
var origine_zone_pop_y = int(200)
var limite_zone_pop_x = int(540)
var limite_zone_pop_y = int(700)

var max_piece = 7

func _ready():
	_random_position()
	frame_compteur.frame_compteur = 0
	while self.get_child_count() < max_piece:
		piece = Piece.instance()
		piece.global_position = position_creation
		add_child(piece)
		frame_compteur.frame_compteur += 1
		_random_position()

func _process(delta):

	if listes.destruction_piece == true:
		for i in get_children():
			i.queue_free()

func _random_position():
	position_creation = Vector2(rand_range(origine_zone_pop_x, limite_zone_pop_x), rand_range(origine_zone_pop_y, limite_zone_pop_y))
