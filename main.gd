extends Control

var expression = Expression.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func translate(str: String) -> String:
	var i: float = 1
	while i < str.length():
		if (str[i-1] in "1234567890") and (str[i] == "x"):
			str = str.insert(i, "*")
		if (str[i] == "^"):
			str[i] = "*"
			str = str.insert(i, "*")
		i += 1
	return str

func f(fnc: String, x: float) -> float:
	var exp: String = translate(fnc)
	expression.parse(exp, ["x"])
	var res: float = expression.execute([x])
	if not expression.has_execute_failed():
		return res
	else:
		print("err")
		return 0

func simpson(fnc: String) -> float:
	var a: float = float($a_value.text)
	var b: float = float($b_value.text)
	var n: int = int($n_value.text)
	var h: float = (b-a)/n
	var res: float = f(fnc, a)
	print(f(fnc, a))
	a += h
	n -= 1
	while n > 0:
		if n % 3 == 0:
			res += 2*f(fnc, a)
			print(2*f(fnc, a))
		else:
			res += 3*f(fnc, a)
			print(3*f(fnc, a))
		a += h
		n -= 1
	res += f(fnc, a)
	print(f(fnc, a))
	return res*(3*h/8)

func cal():
	$Output.text = str(simpson($function.text))
#	$Output.text = str(f(b))



func n_correction():
	var n: int = int($n_value.text) 
	if  n % 3 != 0:
		n = n - (n % 3)
	if n == 0:
		n = 3
	$n_value.text = str(n)