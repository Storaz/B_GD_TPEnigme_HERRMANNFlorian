extends Node2D

var map=[[9,13,8,4],[7,5,1,10],[2,11,14,6],[15,12,3,""]]
var path = "res://Fonts/pkmnrsi.ttf" 
var new_font = DynamicFont.new()
var new_data = DynamicFontData.new()


func _physics_process(_delta):
	new_data.font_path = path
	new_font.font_data = new_data
	set("custom_fonts/font", new_font)
	if Input.is_action_just_pressed("ui_down"):
		for y in range(4):
			var pos = Vector2(y,map[y].find(" ")) + Vector2(-1,0)
			pos.x = min(max(pos.x,0),3); pos.y = min(max(pos.y,0),3)
			map[y][map[y].find(" ")] = map[pos.x][pos.y]; map[pos.x][pos.y] =" "
			break
	update()		

	if Input.is_action_just_pressed("ui_right"):
		for y in range(4):
			var pos = Vector2(y,map[y].find(" ")) + Vector2(0,-1)
			pos.x = min(max(pos.x,0),3); pos.y = min(max(pos.y,0),3)
			map[y][map[y].find(" ")] = map[pos.x][pos.y]; map[pos.x][pos.y] =" "
			break
	update()		

	if Input.is_action_just_pressed("ui_left"):
		for y in range(4):
			var pos = Vector2(y,map[y].find(" ")) + Vector2(0,1)
			pos.x = min(max(pos.x,0),3); pos.y = min(max(pos.y,0),3)
			map[y][map[y].find(" ")] = map[pos.x][pos.y]; map[pos.x][pos.y] =" "
			break
	update()

	if Input.is_action_just_pressed("ui_up"):
		for y in range(4):
			var pos = Vector2(y,map[y].find(" ")) + Vector2(1,0)
			pos.x = min(max(pos.x,0),3); pos.y = min(max(pos.y,0),3)
			map[y][map[y].find(" ")] = map[pos.x][pos.y]; map[pos.x][pos.y] =" "
			break
	update()
	
	if Input.is_action_just_pressed("ui_echap"):
		get_tree().change_scene("res://Menu.tscn")

func _draw():
	for y in range(4):
		for x in range(4):
			draw_string(new_font,Vector2(x*128+288,y*128+128),str(map[y][x]),Color(2,4,0))	