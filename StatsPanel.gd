extends Panel

onready var hp_lab = $StatsContainer/HP
onready var mp_lab = $StatsContainer/MP
onready var ap_lab = $StatsContainer/AP

func _on_PlayerStats_hp_changed(value):
	hp_lab.text = "HP\n"+str(value)

func _on_PlayerStats_mp_changed(value):
	mp_lab.text = "MP\n"+str(value)
	
func _on_PlayerStats_ap_changed(value):
	ap_lab.text = "AP\n"+str(value)