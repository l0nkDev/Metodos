extends Control

var expression = Expression.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func translate(stri: String) -> String:
	var i: float = 0
	stri = stri.replacen("ln","log")
	stri = stri.replacen("^", "**")
	stri = stri.replacen("e", "2.718281828459045")
	while i < stri.length():
		if (stri[i-1] in ".1234567890") and (stri[i] not in ".1234567890*"):
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

func calculate():
	$Output.text = str(simpson($function.text))

func max_min_y(l: float, h: float, fnc: String) -> Array:
	var max: float = f(fnc, l)
	var min: float = max
	var n: int = 0
	var x: float
	var y: float
	while n < 500:
		x = l+(h*n)
		y = f(fnc, x)
		if y > max: max = y
		if y < min: min = y
		n += 1
	return [max, min]

func n_correction():
	var n: int = int($n_value.text) 
	if  n % 3 != 0:
		n = n - (n % 3)
	if n == 0:
		n = 3
	$n_value.text = str(n)
	check_func($function.text)

func graph(f: bool):
	if f:
		$graph.visible = true
		var a: float = float($a_value.text)
		var b: float = float($b_value.text)
		var l: float = a-((b-a)/10) 
		var r: float = b+((b-a)/10)
		var h = (r-l)/500
		var n = 0
		var x: float
		var fnc: String = $function.text
		var maxmin: Array = max_min_y(l, h, fnc)
		var scl: float = maxmin[0]-maxmin[1]
		while n < 500:
			x = l+(h*n)
			$graph.set_point_position(n, Vector2(n, -f(fnc, x)/(h)))
			print(f(fnc, x))
			n += 1
	else:
		$graph.visible = false

func check_func(new_text):
	var expo: String = translate(new_text)
	expression.parse(expo, ["x"])
	var tmp = expression.execute([1])
	print(new_text)
	print(expo)
	print()
	print(tmp)
	if str(tmp) == "<null>":
		$output.text = "•••"
		graph(false)
	else:
		$output.text = str(simpson($function.text))
		graph(true)


func updt(new_text):
	check_func($function.text)
