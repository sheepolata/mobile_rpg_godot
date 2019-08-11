extends Node

onready var enemy = $Enemy
onready var battle_actions_button = $UI/BattleActionsButtons

func _on_SwordButton_pressed():
	#var enemy  = find_node("Enemy")
	if  enemy != null:
		enemy.hp -= 4


func _on_Enemy_death():
	battle_actions_button.hide()
	enemy = null