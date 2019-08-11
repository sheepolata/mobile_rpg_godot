extends Node2D

var hp = 25 setget set_hp

onready var hp_lab = $HPLabel
onready var anim_player = $AnimationPlayer

signal death

func set_hp(new_hp):
	hp = new_hp
	hp_lab.text = str(hp) + "hp"
	
	if hp <= 0:
		emit_signal("death")
		queue_free()
	else:
		anim_player.play("Shake")
		yield(anim_player, "animation_finished")
		anim_player.play("Attack")
		yield(anim_player, "animation_finished")
		var battle = get_tree().current_scene
		var player = battle.find_node("PlayerStats")
		player.hp -= 3