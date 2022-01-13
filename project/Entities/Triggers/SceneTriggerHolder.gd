extends Spatial

func _ready():
	if SceneSwitcher.sceneSwitch == true:
		for node in get_children():
			SceneSwitcher.currentTriggers.append(node)
		SceneSwitcher.sceneSetup()
