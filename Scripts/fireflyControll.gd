extends CharacterBody3D


var FireflySpeed = 0
var FireflyX = 0
var FireflyY = 0
const startdirectionsx = [(1), (0), (-1), (0)]
const startdirectionsy = [(0), (-1), (0), (1)]
var Fireflyvelocity = randf_range(10,40)
#we have them going at a random direction at constant speed
#set random speed between 10 and 40 (will be constant right now)
func _ready():
	
	#Picks random x and y direction to start moving in 
	FireflyX = startdirectionsx.pick_random()
	FireflyY = startdirectionsy.pick_random()
	print(FireflyX)
	print(FireflyY)
	
	
#to calculate distance (x,y) we need to take the hypotenuse (displacment / distance) and use pythagorus
#to figure out the adjacent and the opposite sides (x, y)
#velocity.x = SPEEDx
#calculates rand ratio that x and y are at, then based on that ratio changes x and y by a certain number
#while keeping same velocity

#Note: refer to notes on laptop, not sure if using these comments anymore
func _process(delta):
	var FireflyDistance = (Fireflyvelocity * delta)
	velocity.x = FireflyX * FireflySpeed
	velocity.y = FireflyY * FireflySpeed
	
	print(velocity)
	#we only have c (phythagoris) so we need to calc a rand number inbewteen the correct range
	#for a or b so we can figure out b
	
#calculation for distance
