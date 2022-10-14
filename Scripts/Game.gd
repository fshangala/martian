extends Node2D

var LAST_TILE = 0
var TILE_SIZE = 128
var NEXT_OBSTACLE = 5
var NEXT_OBJECT = 5
var Coin = preload("res://Scenes/Coin.tscn")
var Bomb = preload("res://Scenes/Bomb.tscn")
var Enemy = preload("res://Scenes/Enemy.tscn")

var DroppingObjects = [
	Coin,
	Coin,
	Coin,
	Coin,
	Coin,
	Coin,
	Coin,
	Bomb,
	Enemy
]

func dropCoin():
	randomize()
	var nextOffset = randi()%5
	var objectIndex = randi()%DroppingObjects.size()
	var c = DroppingObjects[objectIndex].instance()
	c.position = Vector2((NEXT_OBJECT*TILE_SIZE)+(nextOffset*TILE_SIZE),0)
	get_tree().root.add_child(c)
	NEXT_OBJECT += 3

func buildObstacle():
	randomize()
	var obstacleId = randi()%4
	match obstacleId:
		0:
			$BoxTile.set_cell(NEXT_OBSTACLE,3,0)
			NEXT_OBSTACLE += 3
			$BoxTile.set_cell(NEXT_OBSTACLE,3,0)
			$BoxTile.set_cell(NEXT_OBSTACLE,2,0)
			NEXT_OBSTACLE += 3
			$GrassTop.set_cell(NEXT_OBSTACLE,2,0)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,1)
			NEXT_OBSTACLE += 3
		1:
			$BoxTile.set_cell(NEXT_OBSTACLE,3,0)
			NEXT_OBSTACLE += 3
			$GrassTop.set_cell(NEXT_OBSTACLE,2,0)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,1)
			NEXT_OBSTACLE += 3
		2:
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,0)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,1)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,3)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,4)
			NEXT_OBSTACLE += 3
		3:
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,0)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,1)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,0)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,1)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,2)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,3)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,3)
			$SluntPlane.set_cell(NEXT_OBSTACLE,2,4)
			NEXT_OBSTACLE += 1
			$SluntPlane.set_cell(NEXT_OBSTACLE,3,4)
			NEXT_OBSTACLE += 3
			$GrassTop.set_cell(NEXT_OBSTACLE,2,0)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,2)
			NEXT_OBSTACLE += 1
			$GrassTop.set_cell(NEXT_OBSTACLE,2,1)
			NEXT_OBSTACLE += 3

func _ready():
	buildGrass(15)
	buildObstacle()

func buildGrass(number_of_tiles:int,just_middle:bool=false):
	var start = LAST_TILE
	var end = start+number_of_tiles
	var offset = 0
	
	if !just_middle:
		$Grass.set_cell(start,4,0)
		offset=1
		
	for i in range(start+offset,end):
		$Grass.set_cell(i,4,1)
		
	LAST_TILE = end

func _physics_process(delta):
	$Camera2D.position = Globals.PLAYER_POSITION
	
	if Globals.PLAYER_POSITION.x > (LAST_TILE-5)*TILE_SIZE:
		buildGrass(3,true) 
	
	if Globals.PLAYER_POSITION.x > (NEXT_OBSTACLE-5)*TILE_SIZE:
		buildObstacle()
	
	if Globals.PLAYER_POSITION.x > (NEXT_OBJECT-3)*TILE_SIZE:
		dropCoin()
