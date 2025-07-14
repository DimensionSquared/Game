extends CharacterBody3D

var FireflyDistance = 0
var FireflySpeed = 0
var FireflyX = 0
var FireflyY = 0

#we have them going at a random direction at constant speed
#set random speed between 10 and 40 (will be constant right now)
func _ready():
	FireflySpeed = randf_range(10,40)


#velocity.x = SPEEDx
#calculates rand ratio that x and y are at, then based on that ratio changes x and y by a certain number
#while keeping same velocity
func _process(delta):
	var FireflyXYRatio = randf_range(0,1)
	1-FireflyXYRatio
	FireflyDistance = (FireflySpeed * delta)
	FireflyX = FireflyDistance

#calculation for distance
