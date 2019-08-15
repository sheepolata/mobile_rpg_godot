extends Node2D

const BattleUnits = preload("res://BattleUnits.tres")

var hp = 25 setget set_hp

onready var hp_lab = $HPLabel
onready var anim_player = $AnimationPlayer

signal death
signal end_turn

func _ready():
	BattleUnits.enemy = self
	
func _exit_tree():
	BattleUnits.enemy = null

func set_hp(new_hp):
	hp = new_hp
	hp_lab.text = str(hp) + "hp"
		
func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	anim_player.play("Attack")
	yield(anim_player, "animation_finished")
	emit_signal("end_turn")
	
func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("death")
		queue_free()
	else:
		anim_player.play("Shake")

func deal_damage():
	if BattleUnits.player_stats != null:
		BattleUnits.player_stats.hp -= 4
	

func is_dead():
	return self.hp <= 0