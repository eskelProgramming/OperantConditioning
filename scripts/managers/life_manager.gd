extends Node

var lives : int = 5

func add_lives(num_lives_to_add : int): 
	lives += num_lives_to_add

func remove_lives(num_lives_to_remove : int):
	lives -= num_lives_to_remove
