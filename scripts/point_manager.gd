extends Node

var score = 0

@onready var score_label = $"../GUI/Panel/ScoreLabel"

func add_point():
	
	# Remove 2 points everytime? hummm...
	score = score - 2
	score_label.text = "Du har totalt " + str(score) + " poäng."
