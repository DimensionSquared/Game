extends CharacterBody3D


var FireflyX = 0
var FireflyY = 0
var directionsx = [(0.1), (0), (-0.1), (0)]
var directionsy = [(0), (-0.1), (0), (0.1)]
var Fireflyvelocity = randf_range(10,40)
func _ready():
	pass

	
	


	



func _process(_delta):
	#gen number 1 - 10
	
	
	var rangeX = randi_range(1, 10)
	var rangeY = randi_range(1, 10)
	var rangeX2 = randi_range(1, 100)
	var rangeY2 = randi_range(1, 100)
	#if the rand range is == to 8, and the 2nd one is equal to 34, stay same dir, else plar rand dir
	if rangeX == 8:
		if rangeX2 == 34:
			directionsx = [(FireflyX)]
		else:
			directionsx = [(0.01), (0), (-0.01)]
			FireflyX = directionsx.pick_random()
	if rangeY == 8:
		if rangeY2 == 34:
			directionsy = [(FireflyY)]
		else:
			directionsy = [(0.01), (0), (-0.01)]
			FireflyY = directionsy.pick_random()
	
	velocity.x += FireflyX
	velocity.y += FireflyY

	move_and_slide()


func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	velocity.x = FireflyX*-1
