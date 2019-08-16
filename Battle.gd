extends Node

const BattleUnits = preload("res://BattleUnits.tres")

export(Array, PackedScene) var enemies = []

onready var battle_actions_button = $UI/BattleActionsButtons
onready var anim = $AnimationPlayer
onready var next_room_button = $UI/NextRoomButtonContainer
onready var enemy_position = $EnemyPosition

func _ready():
	randomize()
	start_player_turn()
	var enemy = BattleUnits.enemy
	if enemy != null:
		enemy.connect("death", self, "_on_enemy_death")

func start_enemy_turn():
	battle_actions_button.hide()
	var enemy = BattleUnits.enemy
	if enemy != null and !enemy.is_queued_for_deletion():
		enemy.attack()
		yield(enemy, "end_turn")
	start_player_turn()
	
func start_player_turn():
	battle_actions_button.show()
	var player_stats = BattleUnits.player_stats
	player_stats.ap = player_stats.max_ap
	yield(player_stats, "end_turn")
	start_enemy_turn()

func create_new_enemy():
	enemies.shuffle()
	var Enemy = enemies.front()
	var enemy = Enemy.instance()
	enemy_position.add_child(enemy)
	enemy.connect("death", self, "_on_enemy_death")
	
func _on_enemy_death():	
	next_room_button.show()
	battle_actions_button.hide()

func _on_NextRoomButton_pressed():
	next_room_button.hide()
	anim.play("fade_to_new_room")
	yield(anim, "animation_finished")
	
	var player_stats = BattleUnits.player_stats
	player_stats.ap = player_stats.max_ap
	
	battle_actions_button.show()
	create_new_enemy()
