extends Node2D

onready var ranSoundContainer = $RanSoundContainer
onready var frame_compteur = FrameCompteur

func _process(delta):
	if frame_compteur.son_piece_pose == true :
		ranSoundContainer.play()
		frame_compteur.son_piece_pose = false
		
