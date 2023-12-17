extends ParallaxLayer

@onready var sprite_2d = $Sprite2D

@export var texture:Texture
@export var scrollScale:float = 0.0
@export var texture_x:float = 1920.0
@export var texture_y:float = 1080.0


# Called when the node enters the scene tree for the first time.
func _ready():
	motion_scale.x = scrollScale
	var scale_f = get_viewport_rect().size.y / texture_y
	
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	
	# motion_mirroring.x = texture.x * scale_f


