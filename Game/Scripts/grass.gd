extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_back: Sprite2D = $Sprite2D_Back

const  skewDuration := 1.5

var skewTween: Tween
var skewTweenBack: Tween

func _ready() -> void:
	var startSkew = deg_to_rad(randf_range(-10,10))
	var endSkew = -startSkew
	
	skewTween = get_tree().create_tween().set_loops()
	skewTween.tween_property(sprite_2d, "skew",endSkew,skewDuration).from(startSkew)
	skewTween.tween_property(sprite_2d, "skew",startSkew,skewDuration).from(endSkew)
	skewTween.set_ease(Tween.EASE_IN_OUT)
	
	var startSkewBack = endSkew * 0.5
	var endSkewBack = -startSkewBack
	
	skewTweenBack = get_tree().create_tween().set_loops()
	skewTweenBack.tween_property(sprite_2d_back,"skew",endSkewBack,skewDuration).from(startSkewBack)
	skewTweenBack.tween_property(sprite_2d_back,"skew",startSkewBack, skewDuration).from(endSkewBack)
	skewTweenBack.set_ease(Tween.EASE_IN_OUT)
