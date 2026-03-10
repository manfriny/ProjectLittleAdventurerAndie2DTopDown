extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_back: Sprite2D = $Sprite2D_Back

const  skewDuration = 1.5
const  scaleDuration = 0.1

var skewTween: Tween
var skewTweenBack: Tween

var scaleTween: Tween
var startScale = Vector2(1.0, 1.0)
var endScale = Vector2(1.0, 0.7)


func _ready() -> void:
	var startSkew = deg_to_rad(randf_range(-10, 10))
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


func _on_body_entered(_body: Node2D) -> void:
	CreateNewScaleTween(endScale,scaleDuration)


func _on_body_exited(_body: Node2D) -> void:
	CreateNewScaleTween(startScale,scaleDuration * 3)


func CreateNewScaleTween(targetValue: Vector2, duration: float):
	if scaleTween and scaleTween.is_valid():
		scaleTween.kill()
	
	scaleTween = get_tree().create_tween()
	scaleTween.tween_property(sprite_2d,"scale",targetValue,duration)
	scaleTween.set_trans(Tween.TRANS_BOUNCE)
	scaleTween.set_ease(Tween.EASE_OUT)
