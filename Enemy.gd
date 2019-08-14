extends Node2D

var hp = 25 setget set_hp

var target = null

onready var hp_lab = $HPLabel
onready var anim_player = $AnimationPlayer

signal death
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	hp_lab.text = str(hp) + "hp"
		
func attack(target) -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	anim_player.play("Attack")
	self.target = target
	yield(anim_player, "animation_finished")
	self.target = null
	emit_signal("end_turn")
	
func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("death")
		queue_free()
	else:
		anim_player.play("Shake")

func deal_damage():
	self.target.hp -= 4
	print("Deal damage")
	

func is_dead():
	return self.hp <= 0