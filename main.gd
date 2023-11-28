extends Control

var expression = Expression.new()
var graph_scale: float

# Called when the node enters the scene tree for the first time.
func _ready():
	var n: int = 0
	while n < 500:
		$graph/fill_above.set_point_position(2*n+1, Vector2(n, 0))
		$graph/fill_below.set_point_position(2*n+1, Vector2(n, 0))
		n += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

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

func graph():
	var a: float = float($a_value.text)
	var b: float = float($b_value.text)
	if a > b:
		a = b
		b = float($a_value.text)
	var l: float = a-((b-a)/10) 
	var h = graph_scale
	var n = 0
	var drawn_l = false
	var drawn_r = false
	var x: float
	var y: float
	var fnc: String = $function.text
	$graph/line/r.set_point_position(0, Vector2(b/h, -f(fnc,b)/(h)))
	$graph/line/r.set_point_position(1, Vector2(b/h, 0))
	print("a: " + str(a))
	print("b: " + str(b))
	print("h: " + str(h))
	print()
	while n < 500:
		x = l+(h*n)
		y = f(fnc,x)
		$graph/line.set_point_position(n, Vector2(n, (-y)/(h)))
		if not drawn_l and x >= a:
			$graph/line/l.set_point_position(0, Vector2(n, (-y)/(h)))
			$graph/line/l.set_point_position(1, Vector2(n, 0))
			drawn_l = true
		if x >= b and not drawn_r:
			$graph/line/r.set_point_position(0, Vector2(n, (-y)/(h)))
			$graph/line/r.set_point_position(1, Vector2(n, 0))
			drawn_r = true
		if x > a and x < b:
			if y > 0:
				$graph/fill_above.set_point_position(2*n, Vector2(n, (-y)/(h)))
				$graph/fill_below.set_point_position(2*n, Vector2(n, 0))
			else:
				$graph/fill_above.set_point_position(2*n, Vector2(n, 0))
				$graph/fill_below.set_point_position(2*n, Vector2(n, (-y)/(h)))
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
		$output.text = str(simpson($function.text))
		graph() 
		$graph/line.position = Vector2(0, 174)
		$graph/fill_above.position = Vector2(0, 174)
		$graph/fill_below.position = Vector2(0, 174)
		$graph/zero.position = Vector2(0, 174)
		$graph/line.visible = true
		$graph/fill_above.visible = true
		$graph/fill_below.visible = true
	else:
		$output.text = "•••"
		$graph/line.visible = false
		$graph/fill_above.visible = false
		$graph/fill_below.visible = false


func _on_sc_up_button_up():
	graph_scale += 0.001
	graph()

func _on_sc_dw_button_up():
	graph_scale -= 0.001
	graph()

func _on_mv_l_pressed():
	pass # Replace with function body.


func _on_mv_up_pressed():
	$graph/line.position += Vector2(0, 5)
	$graph/fill_above.position += Vector2(0, 5)
	$graph/fill_below.position += Vector2(0, 5)
	$graph/zero.position += Vector2(0, 5)
