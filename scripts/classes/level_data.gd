## A [Resource] Class for [Level]s.
##
## Keeps track of neeeded info for [Level]s. 
class_name LevelData

# Inherits from [Resource]
extends Resource

## The id for a [Level]. Set in the editor. 
@export var level_id : int
## The name of the [Level]. Set in the editor.
@export var level_name : String
## If the [Level] has been completed. Set in the editor. 
@export var level_completed : bool
## If the level is unlocked. Set in the editor. 
@export var level_unlocked : bool
## The path of the level in the file system. Only needs
## name before the ".gd" and no folder paths. Set in the 
## editor. 
@export var level_path : String
