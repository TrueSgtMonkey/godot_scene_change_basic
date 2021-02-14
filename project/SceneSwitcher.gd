extends Node

signal sceneChanged(pos, rot)

var relativePlayerPos := Vector3()
var playerRotation := Vector3()
var currentTriggers := []
var trigID := 0
var sceneSwitch := false

func changeScene(path : String, player : KinematicBody, trigger : Spatial):
	relativePlayerPos = player.global_transform.origin - trigger.global_transform.origin
	if player.has_method("getRotation"):
		playerRotation = player.getRotation()
	if trigger.has_method("getID"):
		trigID = trigger.getID()
	currentTriggers.clear()
	sceneSwitch = true
	get_tree().change_scene(path)
	
func sceneSetup():
	for node in currentTriggers:
		if node.has_method("getID") && node.getID() == trigID:
			relativePlayerPos += node.global_transform.origin
			emit_signal("sceneChanged", relativePlayerPos, playerRotation)
			sceneSwitch = false
			return
			
