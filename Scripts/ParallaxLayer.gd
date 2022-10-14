extends ParallaxLayer

var imageSize = 1024

func _ready():
	set_mirroring(motion_mirroring)

func _process(delta):
	$Sprite.scale = (OS.window_size.x/imageSize)*scale
	motion_mirroring = Vector2(OS.window_size.x,0)
