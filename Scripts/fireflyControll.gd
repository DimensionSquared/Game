extends CharacterBody3D

var FireflyDistance = 0
var FireflySpeed = 0
var FireflyX = 0
var FireflyY = 0
const MaxRange = 1

#we have them going at a random direction at constant speed
#set random speed between 10 and 40 (will be constant right now)
func _ready():
	FireflySpeed = randf_range(10,40)

#to calculate distance (x,y) we need to take the hypotenuse (displacment / distance) and use pythagorus
#to figure out the adjacent and the opposite sides (x, y)
#velocity.x = SPEEDx
#calculates rand ratio that x and y are at, then based on that ratio changes x and y by a certain number
#while keeping same velocity
func _process(delta):
	FireflyDistance = (FireflySpeed * delta)
	#we only have c (phythagoris) so we need to calc a rand number inbewteen the correct range
	#for a or b so we can figure out b
	var fireflyx = 1
#calculation for distance
