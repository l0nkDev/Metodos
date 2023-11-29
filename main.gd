extends Control

var expression = Expression.new()
var graph_scale: float
var graph_l: float
var cursor_clicked = false
var allow_drag = false
var last_pos: Vector2
var x_l = preload("res://x_line.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var n: int = 0
	while n < 500:
		$graph/fill_above.set_point_position(2*n+1, Vector2(n, 0))
		$graph/fill_below.set_point_position(2*n+1, Vector2(n, 0))
		n += 1
	set_process_input(true)
	updt($function.text)
	$function.text = ""
	updt($function.text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func clicked_on_graph(ev: InputEventMouseButton):
	if ev.position >= Vector2(110, 279) and ev.position <= Vector2(610, 627): return true
	return false

func _input(ev):
	if ev is InputEventMouseButton:
		cursor_clicked = not cursor_clicked
		if cursor_clicked and clicked_on_graph(ev): allow_drag = true
		else: allow_drag = false
		last_pos = ev.position
		if ev.is_pressed() and valid_func($function.text):
			if ev.button_index == MOUSE_BUTTON_WHEEL_UP: 
				if graph_scale > 0.001: 
					graph_scale -= 0.001     
					graph_l += 0.3
				graph() 
			if ev.button_index == MOUSE_BUTTON_WHEEL_DOWN: 
				graph_scale += 0.001 
				graph_l -= 0.3
				graph() 
	if allow_drag and ev is InputEventMouseMotion and valid_func($function.text):
		$graph/fill_above.position.y += ev.position.y - last_pos.y
		$graph/fill_below.position.y += ev.position.y - last_pos.y
		$graph/line.position.y += ev.position.y - last_pos.y
		$graph/zero_x.position.y += ev.position.y - last_pos.y
		graph_l -= (ev.position.x - last_pos.x) * graph_scale
		last_pos = ev.position
		graph()

func translate(stri: String) -> String:
	var i: int = 1
	stri = stri.insert(0, " ")
	stri = stri.replacen("ln","log")
	stri = stri.replacen("^", "**")
	stri = stri.replacen("e", "2.718281828459045")
	while i < stri.length():
		if (stri[i-1] in ".1234567890") and (stri[i] not in ".1234567890)*/+- "):
			stri = stri.insert(i, "*")
		i += 1
	return stri

func f(fnc: String, x: float) -> float:
	var expo: String = translate(fnc)
	expression.parse(expo, ["x"])
	var res: float = expression.execute([x])
	if not expression.has_execute_failed():
		return res
	else:
		print("err")
		return 37707.0

func simpson(fnc: String) -> float:
	var a: float = float($a_value.text)
	var b: float = float($b_value.text)
	var n: int = int($n_value.text)
	var h: float = (b-a)/n
	var res: float = f(fnc, a)
#	print(f(fnc, a))
	a += h
	n -= 1
	while n > 0:
		if n % 3 == 0:
			res += 2*f(fnc, a)
#			print(2*f(fnc, a))
		else:
			res += 3*f(fnc, a)
#			print(3*f(fnc, a))
		a += h
		n -= 1
	res += f(fnc, a)
#	print(f(fnc, a))
	return res*(3*h/8)

func n_correction():
	var n: int = int($n_value.text)
	if n < 0:
		n = 3
	if  n % 3 != 0:
		n = n - (n % 3)
	if n < 0:
		n = 3
	$n_value.text = str(n)
	updt($function.text)

func calc_x_line_h() -> float:
	var flag = true
	var l_h: float = 1
	if ((500*graph_scale) / l_h) > 15:
		while ((500*graph_scale) / l_h) >= 15:
			if flag: l_h *= 2
			else: l_h *= 2.5
			flag = not flag
	elif ((500*graph_scale) / l_h) < 5:
		while ((500*graph_scale) / l_h) <= 5:
			if flag: l_h /= 2
			else: l_h /= 2.5
			flag = not flag
	print("test: ", (500*graph_scale) / l_h)
	print(500*graph_scale)
	print(l_h)
	return l_h

func graph():
	var a: float = float($a_value.text)
	var b: float = float($b_value.text)
	var fnc: String = $function.text
	if a > b:
		a = b
		b = float($a_value.text)
	var x_line_h = calc_x_line_h()
	var x_line_cnt = snapped(graph_l, x_line_h)
	print("x_line_cnt: ", x_line_h)
	var x: float
	var y: float
	var n = 0
	for x_line in $graph/zero_x.get_children():
		x_line.free()
	for y_line in $graph/zero_y.get_children():
		y_line.free()
	$graph/zero_x.add_child(x_l.instantiate())
	$graph/zero_y.add_child(x_l.instantiate())
	$graph/line/l.visible = false
	$graph/line/r.visible = false
	$graph/zero_y.visible = false
	print("a: " + str(a))
	print("b: " + str(b))
	print("h: " + str(graph_scale))
	print()
	while n < 500:
		x = graph_l+(graph_scale*n)
		y = f(fnc,x)
		$graph/line.set_point_position(n, Vector2(n, (-y)/(graph_scale)))
		if not $graph/line/l.visible and x > a and graph_l <= a:
			$graph/line/l.set_point_position(0, Vector2(n - 1, (-y)/(graph_scale)))
			$graph/line/l.set_point_position(1, Vector2(n - 1, 0))
			$graph/line/l.visible = true
		if not $graph/line/r.visible and x > b and graph_l <= b:
			$graph/line/r.set_point_position(0, Vector2(n - 1, (-y)/(graph_scale)))
			$graph/line/r.set_point_position(1, Vector2(n - 1, 0))
			$graph/line/r.visible = true
		if not $graph/zero_y.visible and x > 0 and graph_l <= 0:
			$graph/zero_y.set_point_position(0, Vector2(n - 1, 174))
			$graph/zero_y.set_point_position(1, Vector2(n - 1, -174))
			var y_h = x_line_h / graph_scale
			var pos_y = 0
			var child_cnt = 0
			var y_cnt: float = 0
			while pos_y <= 348 - $graph/zero_x.position.y:
				$graph/zero_y.get_child(child_cnt).set_point_position(0, Vector2(n - 6, $graph/zero_x.position.y - 174 + pos_y))
				$graph/zero_y.get_child(child_cnt).set_point_position(1, Vector2(n + 4, $graph/zero_x.position.y - 174 + pos_y))
				$graph/zero_y.get_child(child_cnt).get_child(0).position = Vector2(n - 6 - $graph/zero_y.get_child(child_cnt).get_child(0).size.x, $graph/zero_x.position.y - 185 + pos_y)
				if y_cnt != 0: $graph/zero_y.get_child(child_cnt).get_child(0).text = str(y_cnt)
				$graph/zero_y.get_child(child_cnt).visible = true
				y_cnt -= x_line_h
				pos_y += y_h
				child_cnt += 1
				$graph/zero_y.add_child(x_l.instantiate())
			pos_y = 0
			y_cnt = 0
			while pos_y >= -$graph/zero_x.position.y:
				$graph/zero_y.get_child(child_cnt).set_point_position(0, Vector2(n - 6, $graph/zero_x.position.y - 174 + pos_y))
				$graph/zero_y.get_child(child_cnt).set_point_position(1, Vector2(n + 4, $graph/zero_x.position.y - 174 + pos_y))
				$graph/zero_y.get_child(child_cnt).get_child(0).position = Vector2(n - 6 - $graph/zero_y.get_child(child_cnt).get_child(0).size.x, $graph/zero_x.position.y - 185 + pos_y)
				if y_cnt != 0: $graph/zero_y.get_child(child_cnt).get_child(0).text = str(y_cnt)
				$graph/zero_y.get_child(child_cnt).visible = true
				y_cnt += x_line_h
				pos_y -= y_h
				if pos_y >= -$graph/zero_x.position.y:
					child_cnt += 1
					$graph/zero_y.add_child(x_l.instantiate())
			print("pos_y: ", pos_y)
			$graph/zero_y.visible = true
		for x_line in $graph/zero_x.get_children():
			if x > x_line_cnt and not x_line.visible:
				x_line.set_point_position(0, Vector2(n - 1, -5))
				x_line.set_point_position(1, Vector2(n - 1, +5))
				x_line.get_child(0).position = x_line.get_point_position(0) - Vector2(x_line.get_child(0).size.y / 2, -5)
				if x_line_cnt != 0: x_line.get_child(0).text = str(x_line_cnt)
				x_line.visible = true
				$graph/zero_x.add_child(x_l.instantiate())
				x_line_cnt += x_line_h
		if x > a and x < b:
			if y > 0:
				$graph/fill_above.set_point_position(2*n, Vector2(n, (-y)/(graph_scale)))
				$graph/fill_below.set_point_position(2*n, Vector2(n, 0))
			else:
				$graph/fill_above.set_point_position(2*n, Vector2(n, 0))
				$graph/fill_below.set_point_position(2*n, Vector2(n, (-y)/(graph_scale)))
		else:
			$graph/fill_above.set_point_position(2*n, Vector2(n, 0))
			$graph/fill_below.set_point_position(2*n, Vector2(n, 0))
		#print(f(fnc, x))
		n += 1

func valid_func(new_text) -> bool:
	var expo: String = translate(new_text)
	expression.parse(expo, ["x"])
	var tmp = expression.execute([1])
	print(new_text)
	print(expo)
	print()
	print(tmp)
	if str(tmp) == "<null>":
		return false
	else:
		return true


func updt(_new_text):
	if valid_func($function.text):
		graph_scale = (12*float($b_value.text)-12*float($a_value.text))/5000
		graph_l = float($a_value.text)-((float($b_value.text)-float($a_value.text))/10)
		$output.text = str(simpson($function.text))
		graph() 
		$graph/line.position = Vector2(0, 174)
		$graph/fill_above.position = Vector2(0, 174)
		$graph/fill_below.position = Vector2(0, 174)
		$graph/zero_x.position = Vector2(0, 174)
		$graph/line.visible = true
		$graph/fill_above.visible = true
		$graph/fill_below.visible = true
	else:
		$output.text = "•••"
		$graph/line.visible = false
		$graph/fill_above.visible = false
		$graph/fill_below.visible = false
