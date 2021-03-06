extends KinematicBody2D

const PieceEffetBonnePos = preload("res://Scenes/PieceEffetBonnePos.tscn")

onready var sprite = get_node("Sprite")
onready var frame_compteur = FrameCompteur
onready var listes = Listes

var dragging = bool(false)
var origine_espace_puzzle_x = int(575)
var origine_espace_puzzle_y = int(16)
var limite_espace_puzzle_x = int(1261)
var limite_espace_puzzle_y = int(702)
var taille_piece = int(68)
var rayon_piece = int(34)
var position_piece_cible
var origine_zone_pop_x = int(30)
var origine_zone_pop_y = int(200)
var limite_zone_pop_x = int(540)
var limite_zone_pop_y = int(700)
var en_bonne_position = bool(false)
var piece_prise = bool(false)

signal dragsignal;

func _ready():
	connect("dragsignal",self,"_set_drag_pc")
	sprite.frame = frame_compteur.frame_compteur
	en_bonne_position = false
	
func _process(delta):
	if dragging:
		var mousepos = get_viewport().get_mouse_position()
		self.position = Vector2(mousepos.x, mousepos.y)

func _set_drag_pc():
	dragging = !dragging

func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and piece_prise == false and listes.piece_prise == 0:
			listes.piece_prise += 1
			piece_prise = true
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed and piece_prise == true:
			emit_signal("dragsignal")
			if self.position.x >= origine_espace_puzzle_x and self.position.x <= limite_espace_puzzle_x and self.position.y >= origine_espace_puzzle_y and self.position.y <= limite_espace_puzzle_y:
				frame_compteur.son_piece_pose = true
				var position_x = (self.position.x - origine_espace_puzzle_x)/taille_piece
				var position_x_tronque = int(position_x)
				self.position.x = (position_x_tronque*taille_piece)+rayon_piece + origine_espace_puzzle_x
				var position_y = (self.position.y - origine_espace_puzzle_y)/taille_piece
				var position_y_tronque = int(position_y)
				self.position.y = (position_y_tronque*taille_piece)+rayon_piece + origine_espace_puzzle_y
				_check_position_finale()
				piece_prise = false
				listes.piece_prise = 0
			elif self.position.x > limite_espace_puzzle_x or self.position.x < 0 or self.position.y > limite_espace_puzzle_y or self.position.y < origine_espace_puzzle_y:
				self.position = Vector2(rand_range(origine_zone_pop_x, limite_zone_pop_x), rand_range(origine_zone_pop_y, limite_zone_pop_y))
				piece_prise = false
				listes.piece_prise = 0
			else :
				piece_prise = false
				listes.piece_prise = 0

func _check_position_finale() :
	var self_index_liste = int(listes.liste_piece.find(self.get_name(),0))
	var self_index_position = int(listes.liste_positons.find(self.position, 0))
#	print("index piece : ", self_index_liste)
#	print("index position piece : ", self_index_position)
	if self_index_liste == self_index_position and en_bonne_position == false :
		listes.nbre_bonne_position +=1
		en_bonne_position = true
		_creation_effet_bonne_pos()
#		print("nombre piece bien place :", listes.nbre_bonne_position)
#		print(en_bonne_position)
		if self_index_position >= 0 and self_index_position <= 19:
			frame_compteur.ligne_son = 10
			if frame_compteur.boucle_guitare_joue == false :
				frame_compteur.boucle_guitare += 1
		elif self_index_position >= 20 and self_index_position <= 39:
			frame_compteur.ligne_son = 20
			if frame_compteur.boucle_melodie_joue == false :
				frame_compteur.boucle_melodie += 1
		elif self_index_position >= 40 and self_index_position <= 49:
			frame_compteur.ligne_son = 30
			if frame_compteur.boucle_accord_joue == false :
				frame_compteur.boucle_accord += 1
		elif self_index_position >= 50 and self_index_position <= 59:
			frame_compteur.ligne_son = 40
			if frame_compteur.boucle_basse_joue == false :
				frame_compteur.boucle_basse += 1
		elif self_index_position >= 60 and self_index_position <= 69:
			frame_compteur.ligne_son = 50
			if frame_compteur.boucle_hihat_joue == false :
				frame_compteur.boucle_hihat += 1
		elif self_index_position >= 70 and self_index_position <= 79:
			frame_compteur.ligne_son = 60
			if frame_compteur.boucle_rimshot_joue == false :
				frame_compteur.boucle_rimshot += 1
		elif self_index_position >= 80 and self_index_position <= 99:
			frame_compteur.ligne_son = 70
			if frame_compteur.boucle_kick_joue == false :
				frame_compteur.boucle_kick += 1
#		print(frame_compteur.boucle_guitare)
#		print(frame_compteur.boucle_melodie)
#		print(frame_compteur.boucle_accord)
#		print(frame_compteur.boucle_basse)
#		print(frame_compteur.boucle_hihat)
#		print(frame_compteur.boucle_rimshot)
#		print(frame_compteur.boucle_kick)
	if self_index_liste != self_index_position and en_bonne_position == true :
		listes.nbre_bonne_position -=1
		en_bonne_position = false
#		print("nombre piece bien place :", listes.nbre_bonne_position)
#		print(en_bonne_position)

	if self_index_liste != self_index_position and en_bonne_position == false :
		if self_index_position >= 0 and self_index_position <= 19:
			frame_compteur.ligne_son = 1
		elif self_index_position >= 20 and self_index_position <= 39:
			frame_compteur.ligne_son = 2
		elif self_index_position >= 40 and self_index_position <= 49:
			frame_compteur.ligne_son = 3
		elif self_index_position >= 50 and self_index_position <= 59:
			frame_compteur.ligne_son = 4
		elif self_index_position >= 60 and self_index_position <= 69:
			frame_compteur.ligne_son = 5
		elif self_index_position >= 70 and self_index_position <= 79:
			frame_compteur.ligne_son = 6
		elif self_index_position >= 80 and self_index_position <= 99:
			frame_compteur.ligne_son = 7

func _creation_effet_bonne_pos():
	var pieceEffetBonnePos = PieceEffetBonnePos.instance()
	add_child(pieceEffetBonnePos)
	pieceEffetBonnePos.global_position = global_position
