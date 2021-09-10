extends Node2D

onready var ecranNoir = $"Ecran noir"
onready var frameCompteur = FrameCompteur
onready var listes = Listes

#func _ready():
#	listes.premiere_position = Vector2(609,50)
#	listes.nbre_bonne_position = int(0)
#	listes.puzzle_fini = int(5)
#	listes.destruction_piece = bool(false)
#	listes.piece_prise = int(0)
#
#	frameCompteur.restart_puzzle_fini = bool(false)
#	frameCompteur.frame_compteur = int(0)
#	frameCompteur.son_piece_pose = bool(false)
#	frameCompteur.ligne_son = int(0)
#	frameCompteur.boucle_accord = int(0)
#	frameCompteur.boucle_basse = int(0)
#	frameCompteur.boucle_guitare = int(0)
#	frameCompteur.boucle_hihat = int(0)
#	frameCompteur.boucle_kick = int(0)
#	frameCompteur.boucle_melodie = int(0)
#	frameCompteur.boucle_rimshot = int(0)
#	frameCompteur.boucle_accord_joue = bool(false)
#	frameCompteur.boucle_basse_joue = bool(false)
#	frameCompteur.boucle_guitare_joue = bool(false)
#	frameCompteur.boucle_hihat_joue = bool(false)
#	frameCompteur.boucle_kick_joue = bool(false)
#	frameCompteur.boucle_melodie_joue = bool(false)
#	frameCompteur.boucle_rimshot_joue = bool(false)
#
#	if frameCompteur.restart_puzzle_fini == true :
#		ecranNoir.modulate.a = 1
#
#func _process(delta):
#	if ecranNoir.modulate.a > 0:
#		ecranNoir.modulate.a -= 0.01

func _on_Jouer_button_up():
#	frameCompteur.restart_puzzle_fini = false
	get_tree().change_scene("res://Scenes/Puzzle.tscn")


func _on_Quitter_button_up():
	get_tree().quit()


func _on_Credit_button_up():
#	frameCompteur.restart_puzzle_fini = false
	get_tree().change_scene("res://Scenes/Credit.tscn")
