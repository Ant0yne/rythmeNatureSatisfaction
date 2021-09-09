extends Node2D

onready var ranSoundContainer = $RanSoundContainer
onready var frame_compteur = FrameCompteur
onready var listes = Listes

func _process(delta):
	if frame_compteur.son_piece_pose == true :
		ranSoundContainer.play()
		frame_compteur.son_piece_pose = false
	if listes.nbre_bonne_position == listes.puzzle_fini :
		get_tree().change_scene("res://Scenes/Menu.tscn")
