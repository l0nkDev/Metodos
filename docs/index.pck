GDPC                0                                                                      .   P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn��     u=      }չB��M-҂�%    T   res://.godot/exported/133200997/export-3177379b55bf14c4233e71c5d79c0d0a-x_line.scn   `     �      ��|P�C[NC�6(J0�    T   res://.godot/exported/133200997/export-7905911576ce011749a6dbe7433f5ff8-y_line.scn  �     �      ������s�}�w��    X   res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res  S     �	      ~�E3���Q��@��    X   res://.godot/exported/133200997/export-c730f3ea937bb34a93f20155d0283d37-single_plot.scn ��      �      �w����:��R�b�Dz    X   res://.godot/exported/133200997/export-d66a3da3b8ec144889278b6de27afb4c-plot_sint.scn   p�      >      5�8��QI���G��,    ,   res://.godot/global_script_class_cache.cfg  0f     F      ����`��.A;W��9'_    D   res://.godot/imported/3_8.jpg-7433ca77380f5a9e06c9e5c08bb7ff9b.ctex ��      ��      �D0i�Ŵg�4.E    H   res://.godot/imported/graph_2d.svg-1a61f3392130136af7ffea4e82a7bd1d.ctex�F      ~      T�p��,S�x��GA    D   res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctex�\     $      �F����*���O&���    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�d     �      �̛�*$q�*�́     H   res://.godot/imported/icon_2.png-1537e13e6023d6fb620bd63970db43fb.ctex  `r     �      �`� ͏+�>��`    X   res://.godot/imported/index.apple-touch-icon.png-b21a756d869f84af832970a74d8371bc.ctex  �J      �/      �$�j��+�*�߭K    L   res://.godot/imported/index.icon.png-b92c9a802ad4b78e247784454a6b506f.ctex   {      �      �`� ͏+�>��`    H   res://.godot/imported/index.png-0c78d14d192abe5f22f8c25928ca1ab8.ctex   ��      -      �%�$����<�׿�+    P   res://.godot/imported/thomas_simpson.jpg-149551adc74ac46570227c1d1e9325be.ctex  ��     �|      .5��eͨ��
�k>�       res://.godot/uid_cache.bin  pt           �_��%r�*{̥��x��       res://3_8.jpg.import@R     �       ������2���F1    4   res://addons/coi_serviceworker/coi_export_plugin.gd         �      �����.o���d`][�E    ,   res://addons/coi_serviceworker/coi_plugin.gd�      a      k`f�w�OvPN����<%    ,   res://addons/graph_2d/custom_nodes/axis.gd        �      ��<iT��'J>8    0   res://addons/graph_2d/custom_nodes/coordinate.gd�      �       )�b��USX3�����    ,   res://addons/graph_2d/custom_nodes/grid.gd  �            ����)��
��g�     ,   res://addons/graph_2d/custom_nodes/legend.gd�      �      ��;�3�}Q�kc��    0   res://addons/graph_2d/custom_nodes/plot_2d.gd   0            �*����\Y��a���O    $   res://addons/graph_2d/graph_2d.gd   @      �+      � ~�Xt6;y�2'�    ,   res://addons/graph_2d/graph_2d.svg.import   pH      �       �
� 2��}�C����        res://addons/graph_2d/plugin.gd @I      S      T8��ߧz�%{�~+Z^       res://default_env.tres.remappd     h       cXv�S��P�O�Tq�o    ,   res://docs/index.apple-touch-icon.png.import@z      �       ���9��7y��WV.Q(        res://docs/index.icon.png.import�      �       �7�7PK ���1��k       res://docs/index.png.import  �      �       �3^���c��8�tD       res://examples/plot_sint.gd Я      �      te�[�
�&�?MDy    $   res://examples/plot_sint.tscn.remap �c     f       g�~w�(Y�m�K        res://examples/single_plot.gd   ��            bP��O<�+����y5�    (   res://examples/single_plot.tscn.remap    d     h       X���J�*��X�nnC7x       res://icon.png.import   �c     �       O4���33g�tvo�       res://icon.svg.import   �q     �       BlB��;f	��(ġ6       res://icon_2.png�g     �      G1?��z�c��vN��       res://icon_2.png.import Px     �       ��FtK�)�$���       res://main.gd    y     i(      6Dɭ�Ꮪo��� �       res://main.tscn.remap   �d     a       �J�Sw� ������       res://project.binary�v     �      D��ݬ��5�3�4�        res://thomas_simpson.jpg.import 0_     �       顨�]�����j�       res://x_line.tscn.remap �e     c       ���*c�@3�@%���       res://y_line.tscn.remap Pe     c       �O!�/3f� Z�_�        @tool
extends EditorExportPlugin

const JS_FILE = "coi-serviceworker.min.js"

var plugin_path: String = get_script().resource_path.get_base_dir()
var exporting_web := false
var export_path := ""
var update_export_options := true

func _get_name() -> String:
	return "CoiServiceWorker"

func _get_export_options(platform: EditorExportPlatform) -> Array[Dictionary]:
	return [
		{
			"option": {
				"name": "include_coi_service_worker",
				"type": TYPE_BOOL
			},
			"default_value": true
		},
		{
			"option": {
				"name": "iframe_breakout",
				"type": TYPE_STRING,
				"hint": PROPERTY_HINT_ENUM,
				"hint_string": "Disabled,Same Tab,New Tab,New Window"
			},
			"default_value": "Disabled"
		}
	]

func _should_update_export_options(platform: EditorExportPlatform) -> bool:
	if not platform is EditorExportPlatformWeb: return false
	var u = update_export_options
	update_export_options = false
	return u

func _export_begin(features: PackedStringArray, is_debug: bool, path: String, flags: int) -> void:
	if features.has("web"):
		if not has_method("get_option") or get_option("include_coi_service_worker"):
			exporting_web = true
		export_path = path
		if has_method("get_option") and get_option("iframe_breakout") != "Disabled":
			if export_path.ends_with("index.html"):
				push_error("ERROR: cannot export as index.html with generate_index_popout option set")
			else:
				var html = POPOUT_INDEX_HTML
				var method = get_option("iframe_breakout")
				if method == "Same Tab":
					html = html.replace("__PARAMS__", "target=\"_parent\"")
				elif method == "New Tab":
					html = html.replace("__PARAMS__", "target=\"_blank\"")
				elif method == "New Window":
					var w = ProjectSettings.get_setting("display/window/size/window_width_override")
					if w <= 0:
						w = ProjectSettings.get_setting("display/window/size/viewport_width")
					var h = ProjectSettings.get_setting("display/window/size/window_height_override")
					if h <= 0:
						h = ProjectSettings.get_setting("display/window/size/viewport_height")
					html = html.replace("__PARAMS__", "onclick=\"window.open('__GAME_HTML__', '_blank', 'popup,innerWidth=" + str(w) + ",innerHeight=" + str(h) + "'); return false;\"")
				else:
					push_error("ERROR: invalid iframe breakout method")
				html = html.replace("__GAME_HTML__", export_path.get_file())
				html = html.replace("__TITLE__", ProjectSettings.get_setting("application/config/name"))
				var file = FileAccess.open(export_path.get_base_dir().path_join("index.html"), FileAccess.WRITE)
				file.store_string(html)
				file.close()

func _export_end() -> void:
	if exporting_web:
		var html := FileAccess.get_file_as_string(export_path)
		var pos = html.find("<script src=")
		html = html.insert(pos, "<script>" + EXTRA_SCRIPT + "</script>\n<script src=\"" + JS_FILE + "\"></script>\n")
		var file := FileAccess.open(export_path, FileAccess.WRITE)
		file.store_string(html)
		file.close()
		DirAccess.copy_absolute(plugin_path.path_join(JS_FILE), export_path.get_base_dir().path_join(JS_FILE))
	exporting_web = false

func _export_file(path: String, type: String, features: PackedStringArray) -> void:
	if path.begins_with(plugin_path):
		skip()

const EXTRA_SCRIPT = """
if (!window.SharedArrayBuffer) {
	document.getElementById('status').style.display = 'none';
	setTimeout(() => document.getElementById('status').style.display = '', 1500);
}
"""

const POPOUT_INDEX_HTML = """<doctype html>
<html>
<head>
<title>__TITLE__</title>
<style>
body {
	background-color: black;
}
div {
	margin-top: 40vh;
	text-align: center;
}
a {
	font-size: 18pt;
	color: #eaeaea;
	background-color: #3b3943;
	background-image: linear-gradient(to bottom, #403e48, #35333c);
	padding: 10px 15px;
	cursor: pointer;
	border-radius: 3px;
	text-decoration: none;
}
a:hover {
	background-color: #403e48;
	background-image: linear-gradient(to top, #403e48, #35333c);
}
</style>
</head>
<body>
<div><a href="__GAME_HTML__" __PARAMS__>Play __TITLE__</a></div>
</body>
</html>
"""
      @tool
extends EditorPlugin

var export_plugin: EditorExportPlugin = null

func _enter_tree() -> void:
	var path: String = get_script().resource_path
	export_plugin = load(path.get_base_dir().path_join("coi_export_plugin.gd")).new()
	add_export_plugin(export_plugin)

func _exit_tree() -> void:
	remove_export_plugin(export_plugin)
	export_plugin = null
               @tool
extends Control

var default_font: Font

enum {
	POINT = 0,
	LABEL,
}

var vert_grad: Array # [Vector2, String]
var hor_grad: Array
var x_label: String
var y_label: String

func _ready():
	name = "Axis"
	default_font = ThemeDB.fallback_font
	var x_label_node = Label.new()
	x_label_node.name = "XLabel"
	add_child(x_label_node)
	var y_label_node = Label.new()
	y_label_node.name = "YLabel"
	y_label_node.rotation = -PI/2
	add_child(y_label_node)
	

func _draw() -> void:
	if vert_grad.is_empty() or hor_grad.is_empty(): return
	
	var topleft: Vector2 = vert_grad.front()[POINT]
	var topright: Vector2 = Vector2(hor_grad.back()[POINT].x, vert_grad.front()[POINT].y)
	var bottomright: Vector2 = hor_grad.back()[POINT]
	
	for grad in vert_grad:
		draw_line(grad[POINT], grad[POINT] - Vector2(10, 0), Color.WHITE)
		draw_string(default_font, grad[0] + Vector2(-35, -5), grad[1])
	# draw vertical line
	draw_line(topleft, vert_grad.back()[POINT], Color.WHITE)
	get_node("YLabel").text = y_label
	get_node("YLabel").position = Vector2(5, (bottomright.y + topleft.y)/2)
		
	for grad in hor_grad:
		draw_line(grad[POINT], grad[POINT] + Vector2(0, 10), Color.WHITE)
		draw_string(default_font, grad[POINT] + Vector2(0, 20), grad[LABEL])

	# draw horizontal line
	draw_line(hor_grad.front()[POINT], hor_grad.back()[POINT], Color.WHITE)
	get_node("XLabel").text = x_label
	get_node("XLabel").position = Vector2((bottomright.x + topleft.x)/2, bottomright.y + 20)
               @tool
extends Label

func _ready():
	name = "Coordinate"
	anchor_right = 1
	anchor_left = 1
	offset_right = -20
	grow_horizontal = Control.GROW_DIRECTION_BEGIN
	
	text = "(0.0, 0.0)"
         @tool
extends Control

var vert_grid: Array
var hor_grid: Array

func _ready():
	name = "Grid"

func _draw() -> void:
	for line in hor_grid:
		draw_line(line[0], line[1], Color(1,1,1,0.3))
		
	for line in vert_grid:
		draw_line(line[0], line[1], Color(1,1,1,0.3))
        @tool
extends Control

var layout := VBoxContainer.new()

func _ready():
	name = "Legend"
	layout.position.x = 10
	layout.position.y = 20
	add_child(layout)

func update(labels):
	for child in layout.get_children():
		layout.remove_child(child)
		
	for label in labels:
		var l = Label.new()
		l.text = label.name
		l.add_theme_color_override("font_color", label.color)
		layout.add_child(l)
        @tool
extends Control
class_name LinePlot

var points_px := PackedVector2Array([])
var color: Color = Color.WHITE
var width: float = 1.0

func _ready() -> void:
	pass

func _draw() -> void:
	if points_px.size() > 1:
		draw_polyline(points_px, color, width, true)
         @tool
@icon("res://addons/graph_2d/graph_2d.svg")
extends Control
class_name Graph2D

@export_group("X Axis")
## Minimun value on X-axis
@export var x_min: float = 0.0:
	set(value):
		if value < x_max:
			x_step = _get_min_step(value, x_max)
			x_min = get_min_value(value, x_max, x_step)
			update_graph()
			update_plots()
## Maximum value on X-axis
@export var x_max: float = 10.0:
	set(value):
		if value > x_min:
			x_step = _get_min_step(x_min, value)
			x_max = get_max_value(x_min, value, x_step)
			update_graph()
			update_plots()

@export var x_label: String = "":
	set(value):
		x_label = value
		update_graph()

@export_group("Y Axis")
## Minimun value on Y-axis
@export var y_min = 0.0:
	set(value):
		if value < y_max:
			y_step = _get_min_step(value, y_max)
#			print_debug("y step: ", y_step)
			y_min = get_min_value(value, y_max, y_step)
#			print_debug("y_min: ", y_min)
			update_graph()
			update_plots()
## Maximum value on Y-axis
@export var y_max = 1.0:
	set(value):
		if value > y_min:
			y_step = _get_min_step(y_min, value)
			y_max = get_max_value(y_min, value, y_step)
#			print_debug("y_max: ", y_max)
			update_graph()
			update_plots()

## Y-axis label
@export var y_label: String = "":
	set(value):
		y_label = value
		update_graph()
		
@export_group("Background")
## background color of graph
@export var background_color = Color.BLACK:
	set(value):
		background_color = value
		if get_node_or_null("Background"):
			get_node("Background").color = background_color
## Grid visibility
@export var grid_horizontal_visible = false:
	set(value):
		grid_horizontal_visible = value
		update_graph()

@export var grid_vertical_visible = false:
	set(value):
		grid_vertical_visible = value
		update_graph()

const MARGIN_TOP = 30
const MARGIN_BOTTOM = 30
const MARGIN_LEFT = 45
const MARGIN_RIGHT = 30

const Graph2DAxis = preload("res://addons/graph_2d/custom_nodes/axis.gd")
const Graph2DCoord = preload("res://addons/graph_2d/custom_nodes/coordinate.gd")
const Graph2DGrid = preload("res://addons/graph_2d/custom_nodes/grid.gd")
const Graph2DLegend = preload("res://addons/graph_2d/custom_nodes/legend.gd")

var plots: Array

var x_step: float
var y_step: float


class PlotItem:
	var curve: LinePlot
	var points: PackedVector2Array
	var graph: Graph2D
	var label: String
	
	func _init(obj, l, c, w):
		curve = LinePlot.new()
		graph = obj
		label = l
		curve.name = l
		curve.color = c
		curve.width = w
		graph.get_node("PlotArea").add_child(curve)
		
	func add_point(pt: Vector2):
		points.append(pt)
		var point = pt.clamp(Vector2(graph.x_min, graph.y_min), Vector2(graph.x_max, graph.y_max))
		var pt_px: Vector2
		pt_px.x = remap(point.x, graph.x_min, graph.x_max, 0, graph.get_node("PlotArea").size.x)
		pt_px.y = remap(point.y, graph.y_min, graph.y_max, graph.get_node("PlotArea").size.y, 0)
		curve.points_px.append(pt_px)
		curve.queue_redraw()
		
	func clear():
		points.clear()
		curve.points_px.clear()
		curve.queue_redraw()
	
	func redraw():
		curve.points_px.clear()
		for pt in points:
#			print_debug("Plot redraw %s" % pt)
			if pt.x > graph.x_max or pt.x < graph.x_min: continue
			var point = pt.clamp(Vector2(graph.x_min, graph.y_min), Vector2(graph.x_max, graph.y_max))
			var pt_px: Vector2
			pt_px.x = remap(point.x, graph.x_min, graph.x_max, 0, graph.get_node("PlotArea").size.x)
			pt_px.y = remap(point.y, graph.y_min, graph.y_max, graph.get_node("PlotArea").size.y, 0)
			curve.points_px.append(pt_px)
		curve.queue_redraw()
		
	func count() -> int:
		return points.size()

func _ready():
	var background = ColorRect.new()
	background.name = "Background"
	background.color = background_color
	background.anchor_right = 1.0
	background.anchor_bottom = 1.0
	add_child(background)
	
	var plot_area = Control.new()
	
	plot_area.name = "PlotArea"
	plot_area.anchor_right = 1.0
	plot_area.anchor_bottom = 1.0
	plot_area.offset_left = MARGIN_LEFT
	plot_area.offset_top = MARGIN_TOP
	plot_area.offset_right = -MARGIN_RIGHT
	plot_area.offset_bottom = -MARGIN_BOTTOM
	add_child(plot_area)
	
	var axis = Graph2DAxis.new()
	add_child(axis)
	
	var grid = Graph2DGrid.new()
	add_child(grid)
	
	var legend = Graph2DLegend.new()
	plot_area.add_child(legend)
	
	var coordinate = Graph2DCoord.new()
	plot_area.add_child(coordinate)
	
	resized.connect(_on_Graph_resized)
	plot_area.resized.connect(_on_plot_area_resized)

	move_child(grid, 0)
	move_child(axis, 0)
	move_child(plot_area, 0)
	move_child(background, 0)
	
	update_graph()

func _input(event: InputEvent) -> void:

	if event is InputEventMouseMotion:
		var plot_rect: Rect2 = Rect2(Vector2.ZERO, get_node("PlotArea").size)
		
		if plot_rect.has_point(get_node("PlotArea").get_local_mouse_position()):
			var pos: Vector2i = get_node("PlotArea").get_local_mouse_position()
			var point = pixel_to_coordinate(pos)
			get_node("PlotArea/Coordinate").text = "(%.3f, %.3f)" % [point.x, point.y]

## Add plot in Graph2D and return an instance of plot
func add_plot_item(label = "", color = Color.WHITE, width = 1.0) -> PlotItem:
	var plot = PlotItem.new(self, label, color, width)
	plots.append(plot)
	update_legend()
	return plot

func remove_plot_item(plot: PlotItem):
	# remove from plot_list
	var new_plot_list = plots.filter(func(p): return p!=plot)
	plots = new_plot_list
	plot.clear()
	plot.curve.queue_free()
	# unreference plot object
	plot.unreference()
	update_legend()

func pixel_to_coordinate(px: Vector2i) -> Vector2:
	var point: Vector2
	point.x = remap(px.x, 0, get_node("PlotArea").size.x, x_min, x_max)
	point.y = remap(px.y, 0, get_node("PlotArea").size.y, y_max, y_min)
	return point

func update_graph() -> void:
	if get_node_or_null("Axis") == null: return
	if get_node_or_null("Grid") == null: return
	if get_node_or_null("PlotArea") == null: return
	
	# Update margins depend of axis labels
	get_node("Axis").x_label = x_label
	get_node("Axis").y_label = y_label
	var margin_left: float = MARGIN_LEFT if get_node("Axis").y_label == "" else MARGIN_LEFT + 20
	var margin_bottom: float = MARGIN_BOTTOM if get_node("Axis").x_label == "" else MARGIN_BOTTOM + 20
	
	get_node("PlotArea").offset_left = margin_left
	get_node("PlotArea").offset_bottom = -margin_bottom
	
	# Vertical Graduation
	var y_step = _get_min_step(y_min, y_max)
	assert(not is_inf(y_step), "y_step is infinite!")

	var y_axis_range: float = y_max - y_min
	var vert_grad_number = _get_graduation_num(y_min, y_max, y_step, "vert")
	
	# Horizontal Graduation
	var x_step = _get_min_step(x_min, x_max)
	assert(not is_inf(x_step), "y_step is infinite!")
	
	var x_axis_range: float = x_max - x_min
	var hor_grad_number = _get_graduation_num(x_min, x_max, x_step, "hor")
	
	# Plot area height in pixel
	var area_height = size.y - MARGIN_TOP - margin_bottom
	var vert_grad_step_px = area_height / (vert_grad_number - 1)
	# Plot area width in pixel
	var area_width = size.x - margin_left - MARGIN_RIGHT
	var hor_grad_step_px = area_width / (hor_grad_number -1)
	
	var vert_grad: Array
	var hor_grid: Array
	var grad_px: Vector2
	grad_px.x = margin_left
	# Draw grid number
	for n in range(vert_grad_number):
		var grad: Array = []
		grad_px.y = MARGIN_TOP + n * vert_grad_step_px
		grad.append(grad_px)
		var grad_text = "%0.1f" % (float(y_max) - n * float(y_axis_range)/(vert_grad_number-1))
		grad.append(grad_text)
		vert_grad.append(grad)
		
		# Horizontal grid
		if grid_horizontal_visible:
			var grid_px: PackedVector2Array
			grid_px.append(grad_px)
			grid_px.append(Vector2(grad_px.x + area_width, grad_px.y))
			hor_grid.append(grid_px)
			
	get_node("Axis").vert_grad = vert_grad
	
	if grid_horizontal_visible:
		get_node("Grid").hor_grid = hor_grid
	else:
		get_node("Grid").hor_grid = []
		
	var hor_grad: Array
	var vert_grid: Array
	grad_px = Vector2()
	grad_px.y = MARGIN_TOP + area_height
	
	for n in range(hor_grad_number):
		var grad: Array = []
		grad_px.x = margin_left + n * hor_grad_step_px
		grad.append(grad_px)
		var grad_text = "%0.1f" % (float(x_min) + n * float(x_axis_range)/(hor_grad_number-1))
		grad.append(grad_text)
		hor_grad.append(grad)
		
		# Vertical grid
		if grid_vertical_visible:
			var grid_px: PackedVector2Array
			grid_px.append(grad_px)
			grid_px.append(Vector2(grad_px.x, grad_px.y - area_height))
			vert_grid.append(grid_px)
		
	get_node("Axis").hor_grad = hor_grad
	
	if grid_vertical_visible:
		get_node("Grid").vert_grid = vert_grid
	else:
		get_node("Grid").vert_grid = []
	
	get_node("Axis").queue_redraw()
	get_node("Grid").queue_redraw()
	
func update_plots():
	for plot in plots:
		plot.redraw()

func update_legend() -> void:
	# Add labels to the legend
	var labels = Array()
	for p in plots:
		labels.append({
			name = p.label,
			color = p.curve.color,
		})
	get_node("PlotArea/Legend").update(labels)

func _on_Graph_resized() -> void:
	update_graph()
	
func _on_plot_area_resized() -> void:
	update_plots()

## This function return the minimal step
func _get_min_step(value_min, value_max):
	var range_log: int = int(log10(value_max - value_min))
#	print("range log: ", range_log)
	var step: float = 10.0**(range_log-1)
#	print("min step: %f " % [step])
	return step

func _get_graduation_num(value_min, value_max, step, orientation) -> int:
	var diff = value_max - value_min
	var nb_grad: int = roundi(diff/step)
	var max_grad_num: int
	match orientation:
		"vert":
			if size.y < 250: max_grad_num = 5
			else: max_grad_num = 10
		"hor":
			if size.x < 450: max_grad_num = 5
			else: max_grad_num = 10
	
	while nb_grad > max_grad_num:
#		print("->", nb_grad)
		if not nb_grad % 2:
			nb_grad /= 2
			continue
		elif not nb_grad % 3:
			nb_grad /= 3
			continue
		elif not nb_grad % 5:
			nb_grad /= 5
			continue
		elif not nb_grad % 7:
			nb_grad /= 7
			continue
		elif not nb_grad % 9:
			nb_grad /= 9
			continue
		else:
			# not divided
			break
#			return nb_grad + 1
			
#	print("diff: %f , nb_grad: %d" % [diff, nb_grad])
	return nb_grad + 1
	
func get_min_value(min_value, max_value, step):
	var min_token = roundf(min_value/step) * step
	
	while true:
		var diff = max_value - min_token
		var nb_grad: int = roundi(diff/step)
		
		while nb_grad > 10:
	#		print("->", nb_grad)
			if not nb_grad % 2:
				nb_grad /= 2
				continue
			elif not nb_grad % 3:
				nb_grad /= 3
				continue
			elif not nb_grad % 5:
				nb_grad /= 5
				continue
			elif not nb_grad % 7:
				nb_grad /= 7
				continue
			elif not nb_grad % 9:
				nb_grad /= 9
				continue
			else:
				# not divided
				break
		if nb_grad <= 10:
			return min_token
		min_token -= step
	
func get_max_value(min_value, max_value, step):
	var max_token = roundf(max_value/step) * step
	
	while true:
		var diff = max_token - min_value
		var nb_grad: int = roundi(diff/step)

		while nb_grad > 10:
	#		print("->", nb_grad)
			if not nb_grad % 2:
				nb_grad /= 2
				continue
			elif not nb_grad % 3:
				nb_grad /= 3
				continue
			elif not nb_grad % 5:
				nb_grad /= 5
				continue
			elif not nb_grad % 7:
				nb_grad /= 7
				continue
			elif not nb_grad % 9:
				nb_grad /= 9
				continue
			else:
				# not divided
				break
		if nb_grad <= 10:
			return max_token
		max_token += step
		
func log10(value: float) -> float:
	return log(value)/log(10)
           GST2            ����                        F  RIFF>  WEBPVP8L2  /�p�H���om��_4��6���ӽ�1h�F.n�w���mm˔3�\ڬ����]�$��5Y$�H\ �5�&���mۆ�=�@�|aƸ1�|����C ��/�? N_���)�S�q�7ƻf�(:A�%QnF�����U#�pd�s�IH6�i#�5mO�R'p0@����>;:��S[���ܟ�sLOA�9�;жц ��a"��A��	wM0)(�3Yp�:t�JWV�����m��O"M`0&����a]q���'0v��ˤM�g�2?��zRHYH��!!��!  [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dq8biyp62cwwf"
path="res://.godot/imported/graph_2d.svg-1a61f3392130136af7ffea4e82a7bd1d.ctex"
metadata={
"vram_texture": false
}
            @tool
extends EditorPlugin


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_custom_type("Graph2D", "Control",
					preload("res://addons/graph_2d/graph_2d.gd"),
					preload("res://addons/graph_2d/graph_2d.svg"))


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_custom_type("Graph2D")
             GST2   �   �      ����               � �        ^/  RIFFV/  WEBPVP8LJ/  /��,͘i�F�[�?�m"�?A�Β�b��m#������DMI�!��s����m�<wo��D�?$Y��i���j��$�L3���C*�Q�u����ͤ�n+��K �$���m��?�vBDL *�H��ȶ��N�:��'��L�F�lRh�7��G��{z�����Kn#I�$Z���|�(��� ���r�mkۛ��#$@���ޓ齞���C=�3�Nlnr�6�"��{w���mm��ֶ����LH�v?����-�$���Y��H�ÝoI�,I�l��գ������o����;Å|�dI�$Y�����3���o�O�	DI��6}�u"�7  |��[��W�A���=�y��+���r�v+\!�M�@����X'�����k��u��6�x��̗7 ���7�B6P��ɧg5kРFBDD�� ����F@� ��u9�\6�m>��?��x#�Z��s�z��i�����C߮�-�@�	�$@B��vM�A�z�#�}ھk�56�>0�6�} ����7rQ^.���k�)���'=jԶ��.��0P�mנ�el������a��~h��� �������Z�>>���>b�t!�Hb`�́� 6�.!�R��ա�]�֔3��x����0cFx9�t�ǝ����~�����c�A�T��@'� $f��)��~*��[(	,�����T�/L�x9���;;<Ǐ�	����2�	�$R���E��N�-T�I���V��_�c���/ ��a_��y������m�AbȐQ�IЉ$HL�Ĵ�$ ����Z������Ɲ&̘���zŋ�^<ի��1n�q`��(C:)c��4��Ȧ�I1:`��+�l�I_~h�C�CM�5��򱃈�����T��m�S�X:��@��'b:AL�O"�Щ�(��U>��]~H;4b�5���������׺/����)KY�))�2��^3�$bH;,��� /,Gw5���-��.P�ǭ��#�EYb)CRR��3;5���lhwζ��sWl��#�[|�ub`�,�2� ��zZJ�
+۹����C�=G����Pe %�"E
����mI�d�������u��#��*waȐQ����2a�[8vY��z��+��nZ�b�
[��' h'FǄz�X�^�@����GMt�I���CZ*,��4�&"H1�D�N�M'`��~�%��u��U�������hǦEը� `��		� &����a*Hh��
��D":3D'ha���+��@��HLH�@�W�wȇ���$4������S���"jԀP�҉��v��
e?C{Yu��v�Mޗ���Ԛ*uؾ`�7`�A��
aܻ�� y���/��̺"���D��V�55�B��j@	�(q_�!�|��\�z����
�h@S���3�C5f���2b�Ď=����ЭY�&�P� ���5�=K��zSM|�)~�NI=CU���R�6w�.�ꎂ#��,[������5��SE��mm���p�n�	Ro��a7P�˗.E[Mͩ�8��:{��y���Ԏ4%#��L�rϬ{���Wk׺[��r|I��R4fD�Ą�t^��*v��J�z%�Ȼ���ҫ��&���,��b����֪��d%��k�����Oye��=�שc�f;�ܾER��ެ��I���e��Ym�~�W��4y�C��M��m�Y|�~!K����2[��z���wZIi7�FMn^�fް��Y[�-���v�/FV���&̘�Vn";���[�j�V��WO�����}��Y��u��ޑ��R˽D+�z�z�}v�,M�	��ݴ����{�=?m�,Z�Z���u���Nz�յڪ�K]���U��?�KLM�D�JNwF~��Fv���:�w�;ԁ��]l�کG��T�zg��8�SD���,O����?G�ɦ���̖]�/t��I�ى^X�ֶؙ�\׮~o'�d'�+)9}��a]'����ݱ��®��+|������ڵNX�N���N�zY��ɫ������͘V���f+|(�?�i����\e�w��v}���r�Wb*�ߣ.����s$fy�1����&n����\|�,�8j�,�nK��-Qvi�4�L�w���~��6��#�u�3~W<���u��[�^��V��$Ǘޠ?�A�l�N�X�9�X04߹�^,��N@cHu��91EeĈw��+ү�Z��i܋;�8��]6���s�2R+~�����r~q�ߗV��*Sx���P�r�Nt��W �/ ���FT�svH�(���?�Es��r5�4�u���No�2�Uy���uJX�����lg�S(SK.�2���Tk��up�F�)s�b��0����܆K�SV�z�[P������fҤQ�)G��0�2B�Nx�2����*W/�e��@?���-{I�x��V��~??o�W�v)ʔE��$`b�����h��3 �Bd���V��ϓ�<����W)r����������8���q��
 �76r����p?��'�"(����@��Pn:#� -����>�T2jj	н�!LX�[(=�'�\���.!�a',	ݝE4��o���%��1��껀�y�IF w���a�`�b�'�:4�p =av��;��A�:��z�A�    �Ai�gޒ�=-�,L ���s�鍂'L��>P��ZU�(ȍ'^@� ��V����h),p�&D/��n%�QTP �9Yu2��/�JI"�,E��>�$ν�{B|!���DA���d��vf�^H���Zu�"��¹��	�@O�{Ӏ��r3�6��C��t �ĺ], >��DZ�9s��P�Բ)`���@F�R�����-�RO<ܳ1�"�Hأ�V0��	�I�ї�ͺ@˽�Bl ��_�G"1����1{
���MLͭ���!!�A
R�L�0��x$�[�Ɩ ��#{��c����6pcRL��lL�\��n&[0"����� �~~���04�|�'�A<}�_0H�Gߏ�f��b�ul;�� ��b��O�'���N/�^�$2����tNu<�m����dkY��2}�� ��;u/�������u����R?y�x3?}�FR�����]������PP����O~���?�}���G�kY���O1ߦo$	`f�����l껆����R+)�޺�m�Yg������D�d�c;^������X��	h#F��O���9Ё9���.�ڲ�z�pa2����v�^�_X(޷~/v�c��QW��DԦu]��lKK�����)=���z�k��F}�q�nl��n@��'�I�WHj��߶����7�#㾠�9�ڃ~�����������[­��p쎷��k�[6p�k��zï�z���������0^��n��J�����ew��0��%������J�9-��}]�5�N�����b��死G���b�x�6�z[lž��,��f̦�d
 ��bK[���=-���
(a�A܂��W�aB�i��*���n�7q�e�~mw��.��N;�?�Iǝ*����m�#�ϗP�!�^�򽟟�W�f���F��TKlx7����˽}W��\oT�ē]�a�����G+��~��dm��������rw����j׾k\�zX��Ӏy�XG����Z�O�2`H�rK�/��~-�';2��~5I�^/�֎��Uٺ��|���˻�W��z��^P��UXLB���i��;X����:���Ͻ�Q˸^��b�W���b�ܚW�R[՚}������&�aՆ��}{˓Ws���ϛ�B����L���$�����f��f�F"p�Dm�[��o۵��q���sp$�Q�K��]�u�٧~8!����u8����j�������W a���n۵Śy��Nو�sEIiр�@�N�׿�o[W�m�Z���o΅ x  8�인��U��6c����}���7�xn�s}�s�j�ڭ{�6MY��Vl�]o����e�]fԓjf����_ۯ��g�۾W�%<�7�z����_��H�t�w�7[Y��B�(�|���}��\�Je��N��}f��C��%F�%�0�9'�<�?/܂@�?�8��M�}DX][3�D�Ny��v���ՖZ���(ٍt��{}��.��<W����Y�Ď��<�S�~7��5?���`y�W�O����w��Yؒ��nrӌ�nm����"d�Ȟ
(�c�W����߲����~��sC;��.x�m�i/�nc�{��Y��A��ʋ;�0�+F,x wl��nZy5t3͠}�W�5��y�}o8�*��,a�}IHX�;Դ��oX#���C2Ѐ��δ�w!UQY"�Ⱦ$P�S�q����6|�[��	��D��**�ح���S6��FMK����+4�@��T�RKj�w���s�W^_XE%K����?�����@�����q'�/̽h�h4�� ��|���,[���:K��}ay�t��[�z�\�s�&P���]�'/;�k��e�G�<�׽FM�Y�O�{��2��^�X�S�[�%��h�S�XiGS󴷕�s8�kU�ܒ7�N��óm}�hN_�0�7L�|���[Y�uK�z��9\���Y/y�7��Ӌ���_�;�[ԗD	�nx�L��YЭK����T�����l����W&�������K*kx��Rk�w���h�M\�>-�P���m���^0�����~���{_��}�k���y{g�rN'�'&[�杗�Ӿv�7~�^k�~���%�n|7��߷�����[��r�|�@�Y�߷��l�}g�F@��_�]_�*��bB����Z4��S�^�G���L������|�,[�k����讨�� ���Ů3�M�FA|�0gf��ac�9���[�}k��|h�&#`  ���'�AF{�sP$�/��.�X�|�v���|k��V8m�}�v�٪u�{c����Y*?�E��mr���ˏ��O��7+;���u�:�>s�L���V>�g:*Y4��g_�[���Oݻ?�4e"G�����ߦ��6�{�gGӺ[)y#�MW�q����2x�߯|�'m��3οzW�R;��9}f�J�|.?��'9u����~׾���?khaw��]�3fkӦ��2�2}:�ju)�Ȥ��>iNq��X�&�%'�tD�0 ��q2�Î�<�'�Q�K��t�'�"` n��靟N��pB�2����Y�����@``���`�r������A��ߵ;�j}�Q]�_y�ԨV���Sp���]yK�W��~����21Yɥ-=�I/�5�W'�h�c$��<(�@��M?���积��]�ꗝ��='UR�2ed��Q����ާ^�i���&=^�{�����Jw���Җ^y/���|]��~�${��@*���oyWd�mv�%����)�o���7x�n�k�1���  H؝�H���?a���j��N���X����lS/��s�{ͯUk�Gn���l��������߫_5;���W��{�!b�?w��o����}��t?������77ܻ����[��^�������u]�h�2����h��*����g��gb�k������_;v����j��̚ �{��;�޷����~��j��н��� v���M���+=�������ޮ3]`� 
�̾��v���߀��tZk�ό�+o�=��v�vfo�$�(��{m���_���������ӫՍ	+k\��po��N��+��)���v�~VZl��J�����[#�v����wQ~��*��D����tqڷJ�����SN�HH:.?���M��5�����W�vn\U��s��9X��u��2�.�{e/p]���[�JU9G�� �����f��}�\y7��]/�Z��^���]z�׼���x�~5�	G��p������\�ݱ;Q�v�>���?�
,_W��;��;���G��������ZM�	G$���l�2|�wv�]~�-�XOXP�i�dd�;/�ƚ9 @�����m\����o��������#��0��@`$������:yG޵[�^C+��+���ԙ@�]N&���&rx����2./?��
�@ �xJﳱٷ�Q��;|Cy�nH�]P�y�[r�qu�/�w`�d���׀���>?���pOZN�B�2/[���D"/������S&��=g���7=S�t�����=5�E�f���%�]^�f:l��Yo����9)�dqx��+�$LD��&��=r���F�a������Ąh��L�	,
8Q4�ӊxEq	O @X�݈��K �MH�+JL,�v�r�P�-�&�������#���#�)E8������ݟu~�W��%̙��=�����V���
�>��Vܜ��5�$������o�����y�W^I[��w�:���^�B+:{� C^�]����	��i�E���p�|ɶ�V�{־��M�=o���Yb����_��^r�2��-�)�.�\���Bݷ������%yZH��Q/��1�6����/�~�g}s�F��*�/��efk��Vן�L�W�V���P���6u\���P�R�!m�>��mn�GK+C���獠��tn�&���������_�����O}����u���������׿�����V�TYy��v��U�B3ߏo�~a.����\�T�JM�x���������۾oY	�f��g��[��I�:}��������'���[^}�Oj'��N��;���������|^ݫ�L�J��ʵ�2�ps���qź�wyڸL�JJ�w���y��e�^lm	�n����S��;G�;��Nw�����	'!
y֏ݭ�������я��#�1�a�4 ��[P��{/��q��Iw����7b0]$R87��6��L���DBY��w�S���5���p�پ��������5�)���3ן������������[��7k���:�HҸ�X+�$\�[	9-��;�f�����?�T:��w����{�{���0a|e��n�s��5[��0�������~������?�>�j��_����?o�����d�g�MA'H  �)F�G��Y���n��@/�?���)�4��v���|{�]��x�6!CM���S�Ƶ�;��$�	��I�O��'5��B��]����7����LJ��dw3#�u�~�:�3Ώ����s�������L~�'!!�; ��y�-�v�y�hҸ�8�^���w#Sc����i�^�� ��D	��w�ۋt�,۵_��^�
���^@MV����*P�}�@�<���\#��%ͽ �PQ��RAw6a�u��	 ��]YY��$m�_����W�0�ȹha�����U �����pBA'�����x�UjW 姜x}p%�f�G��0�`��A���\�&�WM�@*(���>�-��<�w	|���DP^֚����>��E�G#0���(ɦP�%-���~�  ,�
C� � ��U�7�D� ���f~�y�wP�ye38]�yh��eB���� Nmu����	�q���� �BA %	�$K�e�;6���6Ұ_��Y"�W p�y�C^��*�f�ǟ`1Y�� �F���RM��٦�]���y���a(�BL$7E#h4	 $0  `�f��W�>.�@B�>$�ͼh����-��@ �x�  pa_�����V 	Cb=��3�1IjJ\�t2� cd�4 ��{˷+}`��.5���ce���9����������3?oA ���0 ����᭫A�RS
���bO�s�F�JR&IЕ� 55 ��&Vϕ>B-A�F���c�����������f~�  �dB� k��2u���EcSS҅��0�q�9���[�, B�b!�GWJQ�������v�0#��>$��!{���]��K,	�V�����+�pC��@	�S�ʻ��t`h���zv��y��{�܋��F��h�������
�>�I�6"O�>��x��_�}�ׇކ{���vl�`�Ʌ�^r��q'�F�(V��( x�N�jv��[��r�ɡ4��+V�%qr>`�0@,�C` �]����>���Ԯ޶��8�|��KM��TT,[��
#I�����t @�W�[ ��D����!$�kg�m�����s�V����fr�p��Bܑh� �9�`4�+��E�=+H�������������HD@�� F ���}�S�ڨ��ƽ�s�3�ʻ�{ыݝF�#�qNWM����ܪ�n�x��@,�vkJ��@��D�D
�E�0�TkW��j��P��0�ɯ� ���4����<N.$$�F�$ЍI�I����Fzۼ��)���V�^:n81,MB���#�ևID� ������x�td�S��q�Uzi��p��.���c(t'K�B�]Sݴ��z�>��<�<^nw !�,��$�E9�|p���INN�sh0�;@` �$51Y$7�%����M�D��t?$�[����^S�����d�*�@'X��FK�k�AA�xb�  	! B�8�j^7?}E�����2��J+���-`$ $&ޱ��v��["��u�����SNI���S� ���޽�-��3�ye���� y�s�
�8-�T73��F@��でNlz7�|�7z���4y'; �BV�~]��w{@4s����O��=j��C~+�8'Ͻ
 �C��u��w����a@��-��tu8y��Ĉ;�N�ɚ��3}NDO ��~�T�  �|�u�w=+׹�� h�`w�T�6�U��T�ⰹ����2��ګ��=5M�������T�K�,	#�@h�*U�rBSRp�0��M&Oq�� ,�7�b!��0��q�T�8�&J.���LF��P�k��"YJ���Ɯu��Z��s�,��eO'�0��������ԩ�4��)@���)b�^b�$��7�n�,m"� �ըw�@ ��d��Xzʖ?	�E&����Rk�v/��=��q���<�˱����X�s���i\��Q�v��_x�:Y�)r�A#~��938���U��:H6Y"���P��O3��^< ���
#��ɮ���"ʾ4 +�ݫ٩�L��npys%�8u&N��h������Es��`i]�5?k��T�rhN��(����]!!uG��y*��o��H� �@ �  �F�ZviK�;u7/�o�[��k�5k6hPir���9�8\i�@���kug��2t�Ǹ�vj��\�Z�x� �܋ 1z�ÌL$ �7��{�����K �d��a ��QF���#CF ��5�7��s�VC[�S�(�����Y.�o�e,}�w�n�r��nկW��W�^�U��@��	 ��{�9��F	н5�v^[]����=�%  H$��c##KAӖ�,��gXb�3|4�~]��[ט�z�F���s�n���ah��ݹ�;�؅���^�g E���DP(诤�ȁ �?w��,nϫ��L�q�Ӯ�w�W،	A<(��ۗ���P�:rڒ�}�ۏs��Ly�g�'��k���3Ь���[���s��#%��cvZ/ zr��qo��m��-9���90����*L��	�x8���*=u��M�~��e��~���rK��T�PWq��`��^��t���������h���S���w��{=�e�^��u�M4�Ά4�i����[��@��|A�t�/;j�6Z��]
)6�L	�c#�[}�;��f�N�W�qG��'�	�K�4|�ϰ����z�����i�8�&O��Um]�
s$:�G�ݨ�;C/��3zB:�%7�O���w������x�7cf���W]m�l�
7aHY�;��G� �`�Xa��dT�T2��B�[�%_m;�QX��Ҟ�w������}Go���qw��.K߁����iK.Oy+���}�o�_��_~+���`3�����_�,�m�m�^j^�yy�Wz���,}��,I�����(���u�������-�
��M�I�$@n}�25s����
t����һ��O%KDOvdD�Cb!��%2\�D�D�t�SB��s���}�mݷ�=ʄt������ �&�l��w�ׯW_a�����nz7��*KM�����y@#�R�'��ӥ3����e^;�ٮ3w�_�ն�f;�f*H=��"��ǯ�?�3�o�������Q�yK�.v�����<18�>�Lb�IR�J��<e��g�h������WQ��vl3
+P�+Bn��µi�}��}u�OH�Z��p��V>��n�������y� ����BnA�@�)� ��K�@�F	h�� ���L!�
x9y�gXv���js�_�&��rl �@�x�2����Z����u�jm�&���mz7�y���a�x��1��ɼO�[�)������o"���Q4M@ċ�<�o4����(����f������nu�v��)�	s�0gb0x�h����{{^_oS�`J%�w�}�4������vx�����13� �l �p/�[��-O@)�,�&�&�H ��G u�d�db�+��o��ؒ�O����V��M��dSc`ϼ��l�Z?�쮟�lo����������������o��l���,S*�ҕJ� AM �h��& ���)-(�^�)���g�����и]����͵��֧\�JM��xbx��Y�}���z����_o�n��ח}����7 y9�J�@M		�#D�@ &"�0//
��\�-���1���Y��vng뫡���mf�25�t* ���}����u�|��e�~�ݪ��[_޲����MwBz	���h4���NnXr(�   '� _h�����;''��=���Vw�����2�m�
d�|� ��[�f�n۵��߳�ö>]! P.�9)i�i�#�_��Ι{�p��u� ��-!���)#s���o�Rh 	�b�w}�ݾ[w���t^�����_�S��(!��)A� 6Μ|A13����RĔ2�)W��e�.  �vT* 4��쐙Y������	\{  (��H `މ���~�/  H�����()�~�b�~� ` +�� &@D�=��� �����	��p� �0Bb��=zR��Jx��'#"���;�c�����g�Ci�G@O��K���Ep�3
�jԈL���B�P,$�B�0�w@�DHC������`�1a��k4h�6�с�ɦw  k�
րfM��>�iɞvH�p�ր-R;����!Ӄi���	�q�T��]�~�a�ޟ�	6�@L�O�����U��J�I��۱i� ��A���+���cmJ0A'�� ����vlTIJT�M��m�R�����|�	�H�s;ǦP�*�+fR�j�b�δ�K�E�b��`�ĐD1���D��c����Dg��P�b���lg�0�����̫.�iR�d�;�U�zlP�ΌtƀU�k�v�	@'�֖i�؉'%%���Q��ƫ���[�a��R�A>V,� 1�vb��!1�����h'�h�i_I΃��w�{W[Sc�������gο+ؘ���0�ɧjUne[<v��1bttb���ްii�Ʀ�&%%9��L75]�Å�c:5��z�l~��!�ô']6Y�cŚ�*��d���E�dO�N�(A��l&5���M�6��!�&Ld~�7]�x��+ȫ5��*H0�0���!.��>�X%�$S4���X�`�Y-�l�s��IWp�ן�#2Z\a��$Jhiǆi�0�3ha�$E��56�bv���l�/�����b�؅&T���R��Y�I����ʰB���3&ddT��}��é .8��5^�x�qp�.�&���,��m	�]�%T��0J��cG�t�ؑN��n�L��c���Z�T� 8`��~ ��|U0?��ì�m�vu��}z�v-��� !""L�pĄ�q��v�Vsz�xw���pQ>�o ��ܹS��&lp�m�ۣU�Z�4��V�4	0c��Z��n�޷�v��"��'�����/v~+5 ��tw�)(, ��-�N���ݙ��.�+�6=���|y           [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dabaoj6w27np3"
path="res://.godot/imported/index.apple-touch-icon.png-b21a756d869f84af832970a74d8371bc.ctex"
metadata={
"vram_texture": false
}
              GST2   @   @      ����               @ @        �  RIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
 [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ctiwebwiyrnv1"
path="res://.godot/imported/index.icon.png-b92c9a802ad4b78e247784454a6b506f.ctex"
metadata={
"vram_texture": false
}
          GST2      X     ����                X       �,  RIFF�,  WEBPVP8L�,  /Õ�mۆq�����1�Ve���G�N^6۶�'�����L �	���������'�G�n$�V����p����̿���H�9��L߃�E۶c��ۘhd�1�Nc��6���I܁���[�(�#�m�9��'�mۦL���f�����~�=��!i�f��&�"�	Y���,�A����z����I�mmN����#%)Ȩ��b��P
��l"��m'���U�,���FQ�S�m�$�pD��жm�m۶m#�0�F�m�6����$I�3���s�������oI�,I�l���Cn����Bm&�*&sӹEP���|[=Ij[�m۝m��m���l۶m��g{gK�jm���$�vۦ�W=n�  q��I$Ij�	�J�x����U��޽�� I�i[up�m۶m۶m۶m۶m�ټ�47�$)Ι�j�E�|�C?����/�����/�����/�����/�����/�����/�����/�����̸k*�u����j_R�.�ΗԳ�K+�%�=�A�V0#��������3��[ނs$�r�H�9xޱ�	T�:T��iiW��V�`������h@`��w�L�"\�����@|�
a2�T� ��8b����~�z��'`	$� KśϾ�OS��	���;$�^�L����α��b�R鷺�EI%��9  �7� ,0 @Nk�p�Uu��R�����Ω��5p7�T�'`/p����N�گ�
�F%V�9;!�9�)�9��D�h�zo���N`/<T�����֡cv��t�EIL���t  �qw�AX�q �a�VKq���JS��ֱ؁�0F�A�
�L��2�ѾK�I%�}\ �	�*�	1���i.'���e.�c�W��^�?�Hg���Tm�%�o�
oO-  x"6�& `��R^���WU��N��" �?���kG�-$#���B��#���ˋ�銀�z֊�˧(J�'��c  ��� vNmŅZX���OV�5X R�B%an	8b!		e���6�j��k0C�k�*-|�Z  ��I� \���v  ��Qi�+PG�F������E%����o&Ӎ��z���k��;	Uq�E>Yt�����D��z��Q����tɖA�kӥ���|���1:�
v�T��u/Z�����t)�e����[K㡯{1<�;[��xK���f�%���L�"�i�����S'��󔀛�D|<�� ��u�={�����L-ob{��be�s�V�]���"m!��*��,:ifc$T����u@8 	!B}� ���u�J�_  ��!B!�-� _�Y ��	��@�����NV]�̀����I��,|����`)0��p+$cAO�e5�sl������j�l0 vB�X��[a��,�r��ς���Z�,| % ȹ���?;9���N�29@%x�.
k�(B��Y��_  `fB{4��V�_?ZQ��@Z�_?�	,��� � ��2�gH8C9��@���;[�L�kY�W�
*B@� 8f=:;]*LQ��D
��T�f=�` T����t���ʕ�￀�p�f�m@��*.>��OU�rk1e�����5{�w��V!���I[����X3�Ip�~�����rE6�nq�ft��b��f_���J�����XY�+��JI�vo9��x3�x�d�R]�l�\�N��˂��d�'jj<����ne������8��$����p'��X�v����K���~ � �q�V������u/�&PQR�m����=��_�EQ�3���#����K���r  ��J	��qe��@5՗�/# l:�N�r0u���>��ׁd��ie2� ���G'& �`5���s����'����[%9���ۓ�Хމ�\15�ƀ�9C#A#8%��=%�Z%y��Bmy�#�$4�)dA�+��S��N}��Y�%�Q�a�W��?��$�3x $��6��pE<Z�Dq��8���p��$H�< �֡�h�cާ���u�  �"Hj$����E%�@z�@w+$�	��cQ��
1�)��������R9T��v�-  xG�1�?����PO�}Eq�i�p�iJ@Q�=@�ݹ:t�o��{�d`5�����/W^�m��g���B~ h�  ����l  נ�6rߙ�����^�?r���   ���⤖��  �!��#�3\?��/  �ݝRG��\�9;6���}P6������K>��V̒=l��n)��p	 ����0n䯂���}   ���S*	 ��t%ͤ+@�����T�~��s����oL)�J� 0>��W�-  �*N�%x=�8ikfV^���3�,�=�,}�<Z��T�+'��\�;x�Y���=���`}�y�>0����/'ـ�!z9�pQ��v/ֶ�Ǜ����㗬��9r���}��D���ל���	{�y����0&�Q����W��y ����l��.�LVZ��C���*W��v����r���cGk�
^�Ja%k��S���D"j���2���RW/������ض1 ����
.bVW&�gr��U\�+���!���m ;+۞�&�6]�4R�/��Y�L�Ά`"�sl,Y/��x��|&Dv�_
Q*� V�NWYu�%��-�&D�(&��"  Wc��ZS���(�x� ,�!����!�L�AM�E�]}X�!��wB�o��-  �-���16���i���ю�z��� ���B��oB�0������v]���ȓ�����3�� +S�χ�=Q_�����˨�d��|)D>��k ��uȣ���Y[9̂�����! ^�!��r���j0Y+i��΍e(�ț� ���x��
��{��<6 R���پ�b��Y
C����+���������;���a ���,�o��bC�{�?���1 �(��¤ �V�������;�=��I��� ���EI���Z��)D����t=S ��] X��9K�= �.~�K[��Ŋ��,2��� p}>w<n�g h�
�t���R�u�G�1k���!��x���������� �L���|>D�0�Ǣ(Qc�� ����= �ۊ�Z0�^��c �
|�����L�%�d��q���(�WB� ��(	���� �J��8D�0�~$�Dsy�Ѿ!������j�^ ��mOa�8.�qce��s|%Dq~,X�u�������=T	���Q�M�ȣm�Y�%Y+�[�0|"DΞ�j�u�L6�(Qe��qw�V�э���ǂ���!j�K � �:�wQ�dÛ������R�
��C���X�u�`����\"j讀Dq21� �F>B[��[������]@K-���C�e�q�tWP�:W�۞X�z��,��t�p���P��Se����T���{dG��
KA���w�t3t��[ܘ�4^>�5ŉ�^�n�Eq�U��Ӎ��α�v�O6C�
�F%�+8eů��M����hk��w�欹񔈓����C��y訫���J�Is�����Po|��{�Ѿ)+~�W��N,�ů��޽���O��J�_�w��N8����x�?�=X��t�R�BM�8���VSyI5=ݫ�	-�� �ֶ��oV�����G������3��D��aEI��ZI5�݋����t��b��j��G����U���΃�C�������ق�в����b���}s����xkn��`5�����>��M�Ev�-�͇\��|�=� '�<ތ�Ǜ���<O�LM�n.f>Z�,~��>��㷾�����x8���<x�����h}��#g�ж��������d�1xwp�yJO�v�	TV����گ�.�=��N����oK_={?-����@/�~�,��m ��9r.�6K_=�7#�SS����Ao�"�,TW+I��gt���F�;S���QW/�|�$�q#��W�Ƞ(�)H�W�}u�Ry�#���᎞�ͦ�˜QQ�R_��J}�O���w�����F[zjl�dn�`$� =�+cy��x3������U�d�d����v��,&FA&'kF�Y22�1z�W!�����1H�Y0&Ӎ W&^�O�NW�����U����-�|��|&HW������"�q����� ��#�R�$����?�~���� �z'F��I���w�'&����se���l�̂L�����-�P���s��fH�`�M��#H[�`,,s]��T����*Jqã��ł�� )-|yč��G�^J5]���e�hk�l;4�O��� ���[�������.��������������xm�p�w�չ�Y��(s�a�9[0Z�f&^��&�ks�w�s�_F^���2΂d��RU� �s��O0_\읅�,���2t�f�~�'t�p{$`6���WĽU.D"j�=�d��}��}���S["NB�_MxQCA[����\	�6}7Y����K���K6���{���Z۔s�2 �L�b�3��T��ݹ����&'ks����ܓ�ЛϾ�}f��,�Dq&������s��ϼ��{������&'k�����Qw窭�_i�+x�6ڥ��f�{j)���ퟎƍ3ou�R�Y����徙�k����X�Z
m.Y+=Z��m3�L47�j�3o�=�!J
5s���(��A ��t)���N�]68�u< Ƞ��_�im>d ��z(���(��⤶�� �&�ۥ� ��  Vc�8�'��qo9 �t��i�ρdn��Of���O�RQP���h'������P֡���n ���č����k�K@�>����pH>z)-|��B��j���!j:�+������˧��t�������1����.`v�M�k�q#�$���N:�����-M5a10y����(�T��� X5 \�:� ?+�7#�?�*Y+-,s� ~�|\)뀀ap �drn�g��RN�X�er ��@ĕ���;��z��8ɱ�����	�- �
�bKc����kt�U]�䎚���hgu���|�_J{ �`p��o�p�T�U��p���/���Hϑ�H�$X ܬm3���ŉ�U'��뻩t��G9�}�)O������p�΃g���JO���\9�׫�����ڳ�!k����/��9R���^�%��C����T���;ji<�>�KY����;�J��ƶm .P��pT��
@HA��r��98V���b�v���YwaZ>�$oւ?-փ��ʹ|0�.��3���b駁�c��;?8E;���V�B�؀����|%\\s��%����e{o��Z�i�������^���s�Jx������B jh�\ �h�<��V��sh@:���.�ІYl��˂�`3hE.,P�2^����J��+�����p��
�ЊJd��x�*�@�7R��� �"�G="!�� �p����u�o��wV�m�g���~F��?����/�����}~����sо7� ���\,,k�J�T�6������Z�y�rBZ[D�>v�HQ�R��mq�������DD�-6+�V`���J�E�����\� 9!ߑ�`��6���ml�~ZM�Z�ȎV���g���������3?*u3���ctW����YQa�Cb�P�,B5�p0�m�cͺEt�{,��>s9f�^��`OG��]����2�Fk�9_�G�vd��	��)��=�1^Ų�Wl3{�����1��H)�e������9�هZ�]}�b���)b�C��es}�cVi~x���e
Z�)܃��39������C�(�+R����!�j����F�n���<?�p��l�8a�4xOb��������c�8&�UA�|	/l�8�8���3t�6�͏���v���� ����סy�wU��`� =��|M�Y?�'�A��&�@*�c~!�/{��),�>�=xr"	�qlF:��L&���=<5t�h.�#ᣭ���O�z�!�&`A�F�yK=�c<\GZ�� 4HG�0i�F녠uB"���<��c�Jeۈ�3!����O��q萞PiZ&�$M[���(G��e���ؤ���ã��O���5����'�gH~�����=��g�F|8�+�X�4�u���G�2����'��.��5[�OlB��$f4���`��mS�L�,y�t&V�#P�3{ ��763�7N���"��P��I�X��BgV�n�a:$:�FZ���'�7����f������z!�����KA�G��D#������ˑ`ڶs���&� ݱ��4�j��n�� ݷ�~s��F�pD�LE�q+wX;t,�i�y��Y��A�۩`p�m#�x�kS�c��@bVL��w?��C�.|n{.gBP�Tr��v1�T�;"��v����XSS��(4�Ύ�-T�� (C�*>�-
�8��&�;��f;�[Փ���`,�Y�#{�lQ�!��Q��ّ�t9����b��5�#%<0)-%	��yhKx2+���V��Z� �j�˱RQF_�8M���{N]���8�m��ps���L���'��y�Ҍ}��$A`��i��O�r1p0�%��茮�:;�e���K A��qObQI,F�؟�o��A�\�V�����p�g"F���zy�0���9"� �8X�o�v����ߕڄ��E �5�3�J�ص�Ou�SbVis�I���ص�Z���ڒ�X��r�(��w��l��r"�`]�\�B���Ija:�O\���/�*]�þR������|���ʑ@�����W�8f�lA���Xl��촻�K<�dq1+x�*U�;�'�Vnl`"_L�3�B����u�����M���'�!-�<;S�F�܊�bSgq� ���Xt�肦�a��RZ�Y_ި��ZRSGA��-:8����yw_}XW�Z���-k�g.U��|�7P�
&���$˳��+��~?7�k�bQ���g������~�Z�e����H�-p�7S�� 
�w"XK�`K%?�`Tr|p���"��\�a�?�٧ ��'u�cv�&��<LM�Ud��T���Ak��������'+7��XR`��[\�-0���e�AiW]�Dk���$u���0[?�-���L����X�ĚSK-�.%�9=j�3t^���(c�yM-��/�ao����\%�?�б �~���b][
tٵ�<qF�)�
�J�'QZY�����*pB�I4�޸�,������.Т�1���/
t�1-1������E�*��Cl/Ю©f�<,0�S�bf�^���[8Z$��@���kw�M<?�[`��)3)1� �U����:��/pR��XV`XE,/0���d���1>ѫ��i�z��*o�}&R{���$f�JV=5͉Ύ��Rl�/�N4.�U~Cm�N~��HPRS�?G��g�-���qvT{�G _�[ua�;���kco�9�Kw����n����E{d�j��C���,q����Y���cwY<$#�ؤ�m+�LL-�z� �y<{/7���[��X�?�-6(cO ?�XZ�M�������sb�[
�.����j|;d�!0lCIqZ�z�&��~�|7�A���A~��á@�� 417��}t ��,� X�6��lS)6v�G
��I:�).~��8R���#'��߶;9�'���U�$1nC�L��찦3�+b黙u�NJ�����8���X�?5�0��^��[B/+�0�Ur(��J��+Xr�H�����HZm&�#�p	�Y ����*���hM]��m���b�ݢ����G����s��z-�x��������� �J�"���Ћ�g�Ҝ �Aа��?��?6��c�Zx�$�t��{s
-R�E�24�?�{�l�-��1�3S�EJ��v6X]L�B^ ��]N��R�yN��62�����'R�p-�����n2�d�?Th|�h��3X������Rc8&��_,��;T�8�� �hΗv�(7I;�3Obn;��O�!����Lߍ*�E~wU,���n�MN1���Z��Y̖��tY;5�^�<Z�Ǩ�T#�bt�xfA�n�cq����"9GD*�^JL��HJ���4���V�-�܉��4*��u]�[
���,"ҏ�i!�r~L��_�����8 ]j�?x���<k+%w��Bk��=�u�ڤ��>%2Bۃ�Y�n<jBo������Κ�0M~�t>�#b/jZ�}���B��Q��#���6R$v�����k�R$c/:�~���(V�7;)��ߊ[̣0?F��;.�*ݪd������{A`w>~�i=D�c��������Y2�X�q~�r2��8@v=f�?��X��S�"X�j?��@$?�����x�(�k���c7��\�����>A�=fpM?9d?�׻{���)f�.⪝���3�������f,N;"��,N���X��*�"V���"��C��?���(2=���A��1�Ul���h�8Ao(5X�B�X�>S�j��s�!
l����GgGp��>�v;c���V�N1���-��K�S�=6PiN�fNq������,
�3SWx�ei����f'�*�r�rʹ̙�e�7���b�o���>_i��M�_��V�p�r�9��X�$�����B���t5�4#�B(E���3�������`����I�M�e��b6_����{~�f/��@��B��Y����E�4��޲�d�O�$���M�����ݖv�P����TR�oj~��+}��#���"�]1Υ_���nR���œ����^pQ2�7첾b��3�ba�\��uu2�~O�G�����5�^>v������m��?���mC;$eT��C񎋋��V��8�:��
���ʱlt��~e]�cC7dl���.�i����\w����/..F�Q5���œ��`�o���E����E�͛�ٽ-�o�z�"n��/��[�����ͳI���S��Dڢ��V�6��!��esq��AC���ڻ���OMk�y��{7`c0�ٺ���5C5�yiw��`ps�OC��f�X�5oQ�\_*m�f�)稹"���a2$O;�]C�A�;V.���c��iޢ�R5�X��t%�s����ȸ�; 5�����)��X|?����9&��wĽjdn�{��7��/����q]3Ɲ�}�[��yF~�Q0����x��U�� ���˘?����a�;���/yޫ�����6.��C}���&L��9�_�ս�w�o���W�^�;�^u�xoݖ��Q8����4��kW��'����:9>����Xp5H��ONtL��=��_�&�0��H"Q��|H���4!���]�'�!޹Eܢ���}=soϢ~	K�$���`"!]j�+{'e�M��D]��=�>c��xS��Y����X��7�7+�Me̯/���u�Q����i���Eg�9�g�RU��#'��ޑW\r�aS�/3�"/v
IgX���}ٻ���ʏr�r���_��<�6�Gʋ&���z%�Pl^d����㑭v�ʎو�w�[���Q��k�K�����IWˈ��`/�Y�X��9J"��_��V{��je�i��6�<�ZS��� �t���W�Bg��@5���..��X�eʡ��*�HRgkD^>�y裝"�9�+wQ4ABR������^�k3�>2�����x�C�l���f:��#gщ�s� ��ߜ��ȁ���+���A��˾�g�1K9Cܹ��:���T"!I������Hs�;���ue��9@#ChE5&!��'�2�����w*a/Q��I	�E������I�w�����?��v })B��GQ�n�h"]0��]Z֑���.}�&~x2��
eĞsF�n�+�b�e�i����0Ix�y��Aѕ���
[1�B�R$$����:�4E疳��#�4���y���ӈ�6o1O�V'��7]�H�.)/)�OwW./�g�l��£���"$d���}[���t���U~�MQԲ�$��~��c��S�M�a���ш=��diH��(N�+U�D����f"V�"�����.ƈ�#Ͼ�eH:�x��d!k 6�J�f9�GW�4����Kp��T��3��~��G�؀��,�zZ��澰؋7����v#� &�r+O�@Ud7͐�$�\�D�O��W_�Ew�ͻ�7��oD����y��,��Ƣ�cƙd	���U�u�:�#�h6]�R
�U~	V�՟R�V������/�:r�F¬�k?|Ī�r\�<.�^9����?��]Aʻ�iT;vg�PpyM���1��},�dY\e8��I��2�wjM��S/�p�1�\^�6$4�F��(:�\nۢ�2�}�Pm�X�'.����U�3��bq�nXK�i_BD�_H}�r;Y^�t�<���o��#gw��2q_�|�^�<��E�h���O�����R�-Ɖ���S�	!��z�1�+iH�1G���+<����~�;|�F�{�}v�;s�j�Q;�٩�;&f�}�������tL ���#��Ъ>;��z���?U˽�~������e��{K%��/:F�/<�n�2k�8�x��S-�5�`��ԗ�H�{���R�y�S�(w��ѥe
�	0���w�޻�U1��7V-Q�̶ꪸ�g�X��3V&�T[+)b����2���(���B��,��z����9���B`��!��o�ע(�W�RZ���m��%/V�&��|g��f��*[_��nn��M�M`�%��)��Z�K$�����F�� ��$r^�k�K,	u;w������X���;�L�eoI�6��y%����~����)���0"�zc�BH�<�kW�E\.�b��R>mٺ��<����͑Թ���a=2X���=/��_;	Ρ�e&o.����]��2!�嫈�"I������j�höR��͒\L�0�e������,)ýf�; ��E��0��<%�Q�Aø�x8�� �]eQL�;|���꼬z�W2
�H�z�_��
/K`J�O�O�Y�~j���>����d�v��%�ެ7�4{%��٥7Z��>����|��5^�\ױ���:��Z^;��U��s�)��#�|�.̡���R2��j����şBб���*cMvD�W^{�������m�D��0�,������#���?O����
����?z�{ȓ'�|����/�����/�����/�����/�����/�����/�����/�����/|�           [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b52e2x6nu124s"
path="res://.godot/imported/index.png-0c78d14d192abe5f22f8c25928ca1ab8.ctex"
metadata={
"vram_texture": false
}
               @tool
extends Control

var plot_sin
var x = 0.0
var draw_enabled = false:
	set(value):
		draw_enabled = value
#		if is_instance_valid($Graph2D):
#			$Graph2D.background_color = Color.SLATE_GRAY if draw_enabled else Color.BLACK

func _ready():
	plot_sin = $Graph2D.add_plot_item("Sin(x)", Color.RED, 0.5)

func _process(_delta):
	if draw_enabled:
		var y: float = sin(x)
		plot_sin.add_point(Vector2(x,y))
		x += 0.1
	
	if draw_enabled and x > $Graph2D.x_max:
		draw_enabled = false

func _on_draw_button_pressed() -> void:
	draw_enabled = true
	plot_sin.clear()
	x = 0.0


func _on_clear_button_pressed() -> void:
	draw_enabled = false
	plot_sin.clear()
	x = 0.0
         RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://examples/plot_sint.gd ��������   Script "   res://addons/graph_2d/graph_2d.gd ��������      local://PackedScene_s8wdj L         PackedScene          	         names "      	   PlotSint    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    Graph2D    x_label    y_min    y_max    y_label    grid_horizontal_visible    grid_vertical_visible    metadata/_edit_layout_mode "   metadata/_edit_use_custom_anchors    DrawButton    anchor_left    offset_left    offset_right    offset_bottom    text    Button    ClearButton    _on_draw_button_pressed    pressed    _on_clear_button_pressed    	   variants                        �?                                     t[s]       �      @      y                                 ?     @�     @B     �A      Draw Sin(x)      hB     �B      Clear       node_count             nodes     t   ��������       ����                                                             	   ����                                             
               	      
                                            ����                                                                                      ����                                                                               conn_count             conns                                                              node_paths              editable_instances              version             RSRC  @tool
extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var my_plot = $Graph2D.add_plot_item("My Plot", Color.GREEN, 1.0)

	for x in range(0, 11, 1):
		var y = randf_range(-50, 50)
		my_plot.add_point(Vector2(x, y))
RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://examples/single_plot.gd ��������   Script "   res://addons/graph_2d/graph_2d.gd ��������      local://PackedScene_qc3mi N         PackedScene          	         names "         SinglePlot    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    Graph2D    x_label    y_min    y_max    y_label    background_color    grid_horizontal_visible    grid_vertical_visible    	   variants                        �?                                     Time(s)      T�     HB      Y    ���=��h>���>  �?            node_count             nodes     8   ��������       ����                                                             	   ����                                             
               	      
                               conn_count              conns               node_paths              editable_instances              version             RSRC    GST2   .  �      ����               .�        d�  RIFF\�  WEBPVP8LP�  /-�) � j�F��w "�?�p����Zy��xZ����m���� P�F���\F ������p��L�(hۆI��nw D���w�!K_Զ{�m۶�N]
+�F�Ӻ�ڶm���>۶m��<���mT���yǱ�c��+IU���ek�#I�sE���=�*�6�p��O��
�6,��s^S����nf*�ɶG�$]@T�܃$�l���wУ������Y��nf*DI��6�⌈��#�?�����z}��Ͽqf2Q����v}���ڶm�h�6�U�&m3q&��������t������M�$ٶQ237�p�Ȉ�U��*k.ffff���k��j33%gD8������I�������CTd%��a��/aV��əf�*"0p�HQ����2=A �U � �M -m  $�hI ,�	g�w{G,�;�(����H�60�i��	Z���$Zʆ�bA�:���>]�z����g@ꔫUG���NTX-��7�� ��XM��
h�@� y�+p�4��
P����0J��*����,o� �l�m+��B$ �#���<hc9�؀4�8#"-@4&@KS�]#]���6<px3(!P�F���:�������`Xi,(@e1��6[b!)X�a���  𚠈 ���HC�H�<#-��
P�I��R8�� @��������O �A�& B��b �J��ƛ�Hφ��Җl8�`�T'�ȑRC�D�xg����d%i B�F-i���
 V'�ӎ��$?(&�/�Tt�Ϫ��&���d��``|'xO�� R�xu�Hp�����O�*�8U�ETμ�*�Y�PR�Ǜ��P�,�� M�l��#  6  �8QI��0���!�+ha����A��3yR�� �0hh������U� Hr2�h����$�q�a�S?B��'�����Cx_]�e�t�xy�H8"U���բ�80�X�b�,�#[��+ "`C@�a� %�$��yR�[�O>�$�a+)�����vP趸��ޱ3��o�2F�lYP��0��b`�X@��`W|�\|��S,�Bw��AMiQ��it�i�
�U`�L� ���n���H�_�#x�����V��z8Ⱦh�����)j��:�  	 (;���^Z��k�0'�� �@ �  a0)� (��5<��� ����p�ߏB�p�,0��=�<n�af�����U�V�� �I 
�� ����m��ER&��C1*c�ƦB�3
�V��G��3�X(�Y ��}�k�n�x�� �CcP(��̓��(â(����]o�.� ��p�_-o@]@� @��	��m7��w�ܭ��Ű��w��)[��m�ֲ��z��0L,V�� ���k����(90��e��a))�0�Š1��()Q a`)H��7�  @��� (
 ���p�� h7���B��B�#o�R	m�5yi�f)�H�`�'������$
<D�0� Z<E� �|,���,3(�0ĸ o��lP;Z8W�X1��
��ЦNK���L}{�`$L�w���*����ٴ3������PĈ'a%r�����K���&r5#�;5Dd��xOfZz�����s�r�����u��[���	�~7#�����o{�0�b��t�d�I3�>Z�_��V4*�*�H��u�5�	F�19U�^�!	>�B@F�� @���G!1�dpR* I�A����B�X@�G	ȩB b�%��f�{�k�8f�m>c� ˂��%{8
�1c����!]ֲJ�$���q�����i���x2���@��z�s���C���9;Kla	����b�j�08
Ak�=����@) �8,���" ,�/�%AFx�%��pX@0����W?�?_�O�M���/|��_"s�O'r��Q�u�������^�:=v�	����W�R�yu�^|���2q:�s+�s���>~ŎcCP�SҠ��x-��N�����Çz��C���E��`&�@aa�*
��Y&�\�Q�ǅ��o�u@�0�p�>�����&��}~�5~##<��_��_D�a���9�0,�p�9~G�>��r�T >GDη���CR�]��+�3 Z¥�\�@�:]l˜��?{\��>}��߿�L���[��Y���_߮���ޏ*�Jq��ϥٍ'��.?D�4�gY�x���n���_$�Q{�_���3�~��E����=��߼������L����
x�����ױ�_�M�n_��g�o�d�.?_��4̵��������X�6���ni��g���aswC�s��ŗڜy:���7�<��r����k��O�<	A0����i�3�f��)~�Q���T�����8���!��T�)5v�8�O��	���.�0��?����?M�?�]S��4��?�oD�o�z�I� ��W� �5\ȿ� ��LJ�' ��g/�xR�ڈï��|��ɫ��u����d�S�JN�g�����SgqoǅkD(Z�Z�aTpf��;{:���T�����#��^:�Q<�2��o����������#�����6F}�ᠰ4�r�|�����l����Hs��������������n�9G�⎯��L��<�!����v����n{+�d�r�I�W��Q�}v�b^�7�|�R��;<���N:B
|�ky.� (1@L�^ɇHo�3��&9�=6�4���1����$�`�܂���Dd��������8��A"�2@�FDJD� C����4���+��74�Pڢ������s�����sVb/^~Q�w=[%ޜ����YY���ք�m	u�� �D"�!�қ�2k�{���dM>.��Sq]�Pk�ǟē���i�/ӫ����yn>��D.?�C׿z�3�<�o��ƇA҉��Q��ܳ�Ë����_������!31i��&_�U~�|Q,���<ͪ#�ma�Ֆ������/�8�	�������KjCbW(��:�s-��J+cI��)���0	E� J,���(�r��h,��������F��:� ��!�Dd��� Ű�Q@�%�*]j�� �ib��P()����:��� M�ctf#�!�@�rw�i�x���Q�K�>������{H�!�@^X�j��"'�E�w����S���Ch�s�� ��,���!9�?#|���rw�@�;�iD��V��N����_�n���8TN~���.LΌ�̵���i�؀0k�|<��������q��,',���26� VX�y	MB4` P@08d�x `�RPB95&�G�^֑C� ���Y����/���hha2.L�W�?Cx�`8�K@(��8� ���]�ҡ��`�:�% C��#� @��O����VE�\Y�i��և3�01�:j��<�aG�a!���9���w���C�֬�ӟg���穻_���A����d�ސkN!��瞌onG�~�3�xṠ%+��݈���#��y���N��N�}iH~��<�)>�t-��{�XAd}_pZ�?V�z��r�~�mFZ�u����וz������O����r��˿<x21����غk�m�����L��S94��賵ϛ�~ΦEN�B�<�HC���g��e2M��h4)�ֲ����z<@���P��_F�d8��ˆ��.�Y��,��ී �`w`@��RR ]�����a�CPb���P��@J��Ơ���κ�EN��.�m��H%����]�tk!{�^9��̾|�?L�q����r������b�2!Y Sџ4���'�\��e���ղܒTk�1�ϴ�*G�N�^��&���� 8��Uu"ڳhP|����Xْu9�x/�)]Ӭ�"��@�HH� n�F�(�c�iZGkg�g��_H�V�#�2��@�P8� A�:�P�ݬ'�G��9� ~Fç�a3�ð�u���r�H�qH�C�s�9 d��X8G�mz8{Xm@�6�;�/Y�S.>\��Y��˫ex~C��~���������h��'�݆y���v}s5���{}��n>D�a*�:C�2�FA���"�Z���>���l��y��_�/_������	���1}{�;���;����@5A�X�E�Y��Н��A����R���F�joyX���|�v��*[*�^��?/>H>���6+ޞ����@~����/r��S�7n��7D��ݤ�H�3K��fV/u������A��X�5O�����y<���*)��:�ʇ��n��" =����=�5M*���<�맥��r<��Y��o�uX���Օ��}z?��Z�kr����ǋo�����?:�Ί��ܼ��m#�+@(�s:��`�"\6CA�� �p @ x^� X���c B V����Qn�S8myM�--��f�qg��
���* �<UR�DT���a��� �  ��Cl�O5��H(�Ø0�T�bڀ��O�B���m�����f�ǆ��l�ݞ�5�J[�2@F��D�b�,�����*,���
��5A9 M�{ص���\�('q�n�0+r��!�KH�n�S�p -����x x��Al�2&G ��7 �����z���
�L��_L��S��/��=�7_�0H�@��Ǝ����^�^���vI�0�y �j��%���
�MtH� ��Mr�8*���(F��rW}���9�Ռ�X�q`�J;R	�"x=l�<C��:m������k��ј��������Ǣ�F-���o|�!������ѫK4��i�l2�{�D72�q|5�7�  P��)�2xñԚ�	?�;�(zwx�pS	�wl��VPH�5�,�ӊ8m�)<��w��a��-�~mvm矎L,�4�E��X��n�!@*��\{�u�
-�U�4�dc�,8�)�3�H"���!�@� ���J�W؁� �G��ĠpR}׻���nNu@�� &G"PtՌB0�&89@jD?� ��v���wꬹ�)���[��1�q�����x( ��B!,��+�  �J0i��T��$vR�t2�^��S�̹2����P�Ǐ����2N�j/M( �ό���j�K��6t�.�f��~�������wSE��̦��N��	`"�q�Ȟ���%�m�e�@Q�+��� H0q鈔l�	C���.7i)X�a���iGe��`\PF�l-s�mA;�v$�Y��i�rc������@u0����03 �0�y6����L+^!F�&!�*̊y{4�S�мݤ]C9ʔ�e��޻J�R�F�Z1T���#�� �@�	���D��A�b��SSa�G2@��Y��f�p8�Jqt_�X�{cw�wK�G��Ͽޮ_��ʚO���a".-�xV_P�1$� ��Cj� �M��vaC�.HE
EH�^�Ӛg����<T���7�����Q��b%!���Y�{,��	ġ�d�C�OǦK��B�ռ���5h=�R�k�7g��s��[
�+�1�S�0/)��87	@P�����*�&�% >�BD��@|���cEK��8�Y<�C@,����` ���B@N�%�� � �TJb�#w]'Q�N�1|R����� #&wrmGH"�8 (	
ɖ6�X�r�Ȗ�[ǵd�ى�un�؟>����7rP��V�2���I+���Ť���?�u$�~S��bR��X�
!�
>�>��oM�"x�C��o�:C�����:Z1
vAq ���$`�8��:�?�h�(�Q�|�I4�A1\�Cp�_��Ax�!������ 6� ���枟�6�-3-�a�ͧ�R�#[m�d�⥤t�)�#����t�t Ҧ���C�4�������-� ����Rm��Ɔvy��V�;�`�ϛN��N�K)��k�����p&
m��T�
*ss`7C��2�.�"��;R��?h�= Ѫ:�m��u17�qWL��wlڷ�a�#a�.ֲE���2@�$P�}ƚO���C�F�d��2?��أcC�KD;�AZ��ilZl
�/H�}:t��u�]π���g�>;�gG�nf=u��;�9T�j����ٛ��f~+��\q�xq�f��Rǹ�  ,Kͥ���� `�S��O�0k� ��i @��=l��3^��@  ��ᕠ�0����i2 P�rq�����H�xC�����?y+�^ 2g�#� �o8��x�xP{P�N ��� %W�CH4�8�����<���HT�$�S�W7���� ���[�����
olp���o!Z:+�}�	�FZ.%��pʴ:e/�d��T��=ſ��S�u=_ (�<�#+�;��a)�5ܲ���&,'0h�lx2^aJMF̀ϑp��s�b�:%G����+���;��q*1�|�x��~�|��/�3���CgCAI���5�1�c�Y9�-	a�"L��eu>G}J��P]��Q��T����i����.�1XQ�K+�{�_*��/w��_N��(�Ē-�� �E��c�c��1$Xt�5Dʒ���3��ܭ���)�N��s���:]is7����t�m����5ɠ���2�)V�������]LD �Ჰ�N �x�Ŕ(�2p*�������E��iCH9�B�Ϛ��&�@
Fû�"�^
ڦ����ټ�t�$�Ψ{x�������[ȡ>+�[��ƢSeeda�7��-�w��N��[<��4s�~ae6�����M!��  �t�#Ⲑ(w�P<#��Y�g �I�Ƿ�%�"�d��¨�� w�����я���e�0բ�t�\_�AC� �m:""����`���t���Y�3:�ΞK�^*(1P(���=f���Z,���80!�r�0��~����D�0o�)*ä��4=�pQ�������(������ ���m �K#�!;���d de���f�V���X��V��B0h(6��Z�ϐwI�CL�!P�Q��BЩ��1L��m�	���Щ� p�d�,����`�k���#I8*9K;*̲��U'-���H��x��"z���6%v0��#�s�>��]鰷A�q�����v��u�c-�Re5�H�r(K�k�'�3�j�G5����N��i�;о����N8։;^{NP��4i�5��C��W����]���&?�V6��k���Ʒf��q۫�y�,��ߖ���uە\��:1����=��#B0���@�=OR�2�e+�)� ����,w�KL1������&i�.pT>��@�c�=-�S�:�ڋ�dE֭h���Cݜ��������v��T����u��dZ��Q���YnvUl��C%f�>��������B$=�X�9�.'�Wԛ�4(��k`��#,���Dq�x�9��� 1���]��Vb1={1��v��H\85*��2�i�9y�z��c��%�3#kY��D��-��`�� ��M�<Xa�8�.3����@u/r:��؞�ա��W;��-DA�@B(C �GB𧑮t�%�8	�p�.�q�<ֽ���׎Sc�$-�([;�νd��=��/�[�tڸ3a�Q�� ��њdm��c� �TL��@�h�"Kv�S�#M�YL8=A*h*CQ󼣯Ũ9�P�p�6�pR�k6��,uV������h�R��RtR�Ѡ@q�}ړR�!� M��\��(���>�8Ē%������<�eܥ'K�A�Y�Y�Ѧ%֛�5��k�t���_��X/���n����<�[ʇ�<��l)���/�S�A8�ױSf�ZvC8��sN�٘#���I�N;m�������"�ߵ�>,2C�:��@ `	 ��6��TSՁ,U�>�_���e�dSU}	�Ͳ�b��/��s���ġ�-�_����q����5C1��b�&B��`�No��K���<�kiaC,&$ŵ1�<o��sC����,�w#��l��Oo1��2�ڽ6����?����ě��趜�g�9���;��S��O�Lx��7�����'���C��m=��Uo��J�YvZ�ayq��)�%���(o�1 '�����yx�߈!��oQBpq��ٓ=1,��q��
}Z�P�9��e� �x��� "Dw\����hp9�܏��ljH*�N@�7�T?K��gQ��j�2	��i�d��#[8<У�&� �#W�X�8�^�8wr
��q��Sͻs��Рqw[��t�+�4�7�kb� ��X�:;J�<KP p3� o��8�2l��"I��� w�l㔒Ό��e��/P3ɛ9#��Z�!5Q�%�sbu�y [6c�!�3�*��fx�I���Z�iPR�PŁȔl9��ʰ�Gv�.k F�e|�� q���82 H|���j6j�6��s�"[�T7#s��G�Oɳx�j�NlZ����M2{v���|�l����2V��A�k�}B���5���PL�b�n�Δ�����q&�C���Ot���;���w���7q"
"� ���09��� R��[��F�ϔ�EO���Ogյ��V�z%���":�?�t��+�58�L���\�,������Wu
��A%��S�Y�m�X؟�ק�A�"Rj&�2
i~9zJ��TOKa���Zf>�'��\͉ݫ��dS����X�=C�[����^=�u����7����)�:�w�:�<V��]0��8/���c��T�}vJ9%y���~Ր�˴��k��7�2�dS򼱼)��6����1��f��˯b�w�`�3g������*������"s|v`�"g6�����L�K�g橯FQ���I���aR�������bNfU�`1h4���nf��(F7���u���(�� !��-��� �sPVY�$�|�=�mB����P�p7��I�^�A�$˫ScT��/��p~r����Ac�
�⣌h�wҠD��/��4�����H^� |��%n�q'���)ގ����vZ%_��z�b�}-�~�Ｒ�3�c������6�0J~M�N;�2�\�y>[�>��2�t�!�>WFY���d9}�/n9�[����R"7��b��(����|���C��۟g�e�����]���绕g��l������C���Ͽ����=o�Y��a������o7���g�����~��?~�)�������W^]���`�?�e��{���忕?������Xp����?�������ȿ��u�dLȾ��b�1~��]���v��b={�Sx���	�|�l���3�}Ǩ?̈����ߚ�T���Ŝ�"g:�9�u�£�O��?�"����������}n2�˫�\^��� ����s6|���/������~j���܏o�����i�~��}|^ -�_��s˯�?v{�g��{5��?��G�-��ŏ�����2����5~���!~������y�[����?:?���_��>4�m�|�������W�������~���y������������ނ�_�  ����������=��K����W��3��_���#���T�J��ｼ��~����U��o��oˏ�#�����q�/|7��yG+�����G�}S��
�"�1H� � ��$�#0����M ������S��U�q��m&=���c�>����-v���<���ٺ��c�c|�`�c�p:
KNd�3��5S2~��e���-�yL��0c�3�
�Ȃ�So�d����W��+���/���ǵ�0��t����U�ѱG��L_�s��ȈL��   �9A�ل�&�Vz�oq��/�}<�23����$����`����?�P����m�������w��*��%?�ߚ�=QX{~��o�����}^�7�?,�� ���%�j�kӟ'�#X@u�0�9���k�7��b?�C?��-�qfgx�e��3��[�P��4i�Ei���Ň Y��$h�1̎b��gܚ�B�\U.K��\����>�ss�Ųb�v�anS�ц����@���u6���x��J6�k|���N%^^^�ىk�("�	�-�cd�nS/Wu�$�Pv�d0m�1d��+L���\ȕ�{�s{�Bu��Ã3�_�s;��DjA�М�X���,�س$�Q���|!�����v'/�;yF���V������I���c�z-bQ�@2,GO�$DLa*���K$��@� �m�`��wYP1� R�gx6��-k��|�T�o��	�f���.���6Ǹv��.]'A'�g@m�%Nj�UP���(�"c��!�Qϊ�Ṳ#k��x�߭����5n���!,8���Xg�;\��i��.u�3�ɦDwaaҒ��h&���fm��HL\<�=@�0���*��eQrX��Ĕi����a�����"ՎZ\h ��ӳ�B��JC���AR�h�<-O8�3�fL�pwW_��dϳ���>�%!,��vc�,10	D3�#,K�����k�ǈűd�=2f�T4�n�� �У��p����A���1!!0����&c�P ��S�����W۽���	������~���:�C�Ƕ�ݣ���
5%�h���k�5�:F�X��K�,���\�vW6��V>z1(�`�vp�shIs`٦�4�7k�͈%�
������!��ְ�3cNb��qk7�.���By6�`��h+�tD � ��I��EP�Y���]Bǽ>��z���m�� ƙ�Y�$xSn����#�`�b+@�Ŕa@U8T���&�(f2b�0j�M��k ] Ȗ��}eF�Eh�}մ���;�vK�[^�i�����<ޯSŘ���=�ܜ�vٞܨS��P�tk�@ "0�@�r�fȧ�hCO3��P@���T�MrLƒD����12�C����l UuU$�2����700�8jj����ɀ@ZL�2fƯd�%0'aY<K��d���M�=.�KJ�,�� ��0-  @f(��`�	���g��>Ʊ�-s�)OT)J�AX�x"K,�	CD�;e�^��죔Q���`�e�92����!f���v1M���@KK΀�>e%'ߔ-f  � ���cz8��Y�V�Dq�L,��<^���j�sܒ���/X�T���0�,HW��`g���%?d�k����r�h�d�ȶը�4J�lϧ[�)���]��]�˰�j��S��W{$��J��p���[�)�9��2��kH��nõ�`꜆y�`(AH�K��:��%�1l�F�n�ݧ�$�Ⱦ�EW����n�OCXf�5��`;=n6X\(�l��9M50���|�@S-��b�;�:1���h�Z@�����Q+��qq*�'�8�k�KGk,��R�Ͷ�e��-�*8=�\��9˥<U1��?�`�Ȋ��;�*dY��3.����� O�@��!K��9yy1`C;e��uj%K��D�� �C�.�10Cz���fFC`7�Jb�0���⨰�Y`0 ǈl�cDY(��(|�L�B`*��`�.�ݠ8�ȍ3+���ih�������xd�Q ���lg̓<�p���Mn�L3 4����$h@�9f��@�a�\)-��铘3#�a �$"��jl櫰�?�/7ZQ�f��=�U3L°�aL����!����i8��BQ,�����'w��U��rҥ��=]�G;ֲF���Ϙ���h�a�sLIL�-�����5�#Kd�}�z£�l��/��JC�PׇkܥaY�}DCBh)x�1�|=j�Ր�%�q���=f�+;�.dYD��lm�%����˴��^Qq�8.w�b1�i ]-�n�3�~���5E��`r�X�������	$&�}��V  ��	��� �3��k�1:�+*,��ð�*晟2=WA>D�z1��4�	���!�zsG):�o'��
�`�4����/:��ZZ�C��QUb���X�����Rd�OvJ � -3I��hh�/��a@�`!�B�<%#F)y�ӂA.@4|·x���Y�����Hb  Nۇj �n
  ܠf�S�c,y���à���:撟�%�%�!"�<9D$�<^�G8�yaP�DD�+���P�r _��O10�n��.��{�!��4�曚���>K\-�^޴�GvR�%�Z�lva��阮4hB�k[Q&k�zmRI>܋� Sh���#�& ��l�1 UT�$�� 	4 tҥ@6�s(�H�H��"$�HB���� el���2�qY�k��ttL�
�
�l��$�1Nz� � �@� 
���a赒Z�1��AAs����Z�X
�� ��h���.�K��0K;b�{g5#ק᧰Eh6�|��� M ���5	` ���KSR`P���0 Q�e����}$i Ը�1#6�Y������@hІ	tf��H��	�I ��0�T!l�B"!(+܀�,�щ�+��P.��dH3��	+�V�!�=�@0�"�X��W���3�Yl��d��p�
��%	to>V�B�BK}9Ӑ�V�1=�>�^Bxy������l2��d2L�ו����U�5,A_��E)�K��P4�(.(*Nu+��� �@@ک  �� �� <-��� ϝ`C$V��O$(�WQ��BQ��T�t 4�'UY�\ P@5�'@�f{������k������*p[
�ZI�mf�P-@�@)�:�`� dk��i|T�����u��<F��{�wz���E#;��?Э�84���&O�Ǡ�0fN�56pD���jHJBi��E Aܢ�#���6��}��)��N@ h��@EQ �NtAI(��=�r@I4 ��$)�H��^��Q����Z���U���1KZ@�s��&��!�L�ų�d�&��f%�O�$���b��aQo�R�cy�Z����TQk%1�=�`0�V��.E��ϫ��@G$�Wi�#G���~z�p�p��@4�Ӭ@.W 	 @ԭ�Z@�  ;  E \���aj��F�z[P5c�x�#��l�k�TX���׀�� m�� �n 1 bP ��O� 4   p{���B���YOu�㈄�eA&����(� ��<w@s*������'��$ڬH�$�U9 �'������=�I .	hЈ �RhI2rJB x�W��OQ�d���qD� ����%3��˔#���1�  :����P��9�n: cqM� hH	(O�e�	�Y��
Y��V������Ƌ��$�C��OfLi!��9@ � �9Lp�VU�)1]8�� �Y�"w%�g�̶���]��[����C��6��v�dt����x1�]RH���B
H��'�^+ϲs��b���`�1��
�j�c`x6��� �%��`32|F��	� �!@�;`Ną��gX�C@�8�i�--���0=z����h6������ p� 	h��@G��@̗�);-	�0�錋k��`qٻ�F�d?/E�T0���*��TRl  @ �$>'h�߁yk�>5�{���@&S��"_Lb�z{�g�9f��z����3D'�A(
 � �����&�!P@�i)Ra�Z� qJbA(�@�!4l�}���P�  �PNY�(B$�H(�a�p9��C"��<�
,�� 3�1X,�
�O���9��s���3e���r�-�� �>��5��1 ���`�%�S��\��'��r�͑�C6����4D����Ą9���p��d�XJBY(
5-hh!�
�N��4� A�EH�D�g"�0�a��8�shP:bV��(�H��	hv��l�|�m�!U� tC(@ �q�N��9F��:;�� �z����Q�>{�2�5̬2����q(�Bl�� ѐ(�#w��H�0��i3�`�@d�	�u�Qc�� � @Ѡ	��7h�h�F ��%!$�!�1�; ��)ț=-V�N(mP:�*���(
 �7���7:,�P`�ո���g�s	1� �Z���  h�ECO-�<�Hg�{�9ጂ�Βp���(
�0���(������r̂�+�M� ��
�aC�\Y�cp8,������t�Q�P�4�8�F<��4��F�]��2�}���2��\ �T$��@� T�H�(�@ @� )�	�\ O����}��kv�Q>�3h��f^�ñ�DE�<Kj�5S�W��3`N ��ȹ�-2	�y� 
a  �`��`N�s��Lf�V_Ը�Dj�KRR�$���;8�  ��<D��A��	8�� ��~ *J"���S]�O\�pK!q�,�Z�oҡأ��<{DV=gޙ0OA@�$�
�  %�a�-�B��ÐD$�0�ʬ@��:� hCѦ�Z\(J�š�pr���X� ��@I(���؞� pv�rn��� ��2#��n)�4?;p�Ϧ�o2�
���  �\@�d��2�$ �zYh�s��Y CK]2ɸ�dFŠ2?�6'R�E�(� �1(LA��h!\ШiHC�4�i �"$�9�l�!KJ�D � ]c�(
����3_ A0 p�@0 Dg�+�$��%Cp;�������T)�K ���(w�F唧.e%�g�� s"����%[l  2ei*�7aV��Y�`���Ξ�`X��4P3��aX��׈@����Y>�#�"���<$�!C�]Jj�ҏ�eZ@Wm� \�c)@I �0   
���% ����3-�� wD BA&�iU��̞o��}����C�rH~�Ч.	�P,� ��&����
 �4C1�:��r���4k'֣��cj�ڞ��Қ�M�.o��.DJ7[�:&e0� �/9 �%<��(C��7��⨈L�Q��*�֯g�% <gÈN��44��)���L��C��ᝥ;���@(�	�Ms 4@�İ��a���1�+����%;�Q�XLKA �B(�ի�♇�y$:; 26� 4�Qf�T�?�#>�L�_���6�.�@N�9��\� Б���@Q [,�ld|��Z���=�\ء
 �Bh  �cY�0�rv~  �����&=��x3`����ƅ�T'
�U����j+gg���+����><F!��x��P��q�a��(ݳ�
\h6&D � ��� �}�^�� 2��Qj�c��I����F����|����:�x�g �tR%B%����Ƌ;��C>|�Ҿ��}]'��"t gC�����*� 	����e��I{�O(�X��jp�a5aC��a���Α_�N%Ѣ�X/�d��3vɹFE�b('�Y.�g|��> �<�v�����#v�3�3�<�Љ��1,%��T�T� I�2Č��R�����v3�1Dv*O�CpL��bY$Cg��c3f��γ�N�� ��|��tr�� 0�H�ܛ���ͽߧ��h����A�l�@�q&���:�" 4 ��
@��('�l��@�@Ӗp�[�I\@9=� j��$I Η����*;���%2JՃ�"��g��3��r<%����I�	��:lP x�n
�Q2�����3���{���,�`���o<��s���J�ۓ. �@�EFNv��\� K��)$�P@N��,�q
����X7N ����5   �)��@'�S�3	E@!"۸hH)!��lŠD��4	(��3��[I�XI?��"�������	(����p��7��}̞�1[��Q��\Y�a����z���!*�{)�~n�� iD��L@��75��P�B��,TdҺY	���G�9�G�&�q(  ���� �$��(�!�W���8nR\�7�Þ��hiI44,�iH�dGCML�<��{ZvB�ZVF_�� �,�B I\����s^Nɧ �j9��BCԴ�m�� ������7gu��� �a����8H�F��Sx�.D�}S �jB3��N��b0044�L{�h1d��d�ԣ q�.c��n��<z�"4̙R���W%��	x^B�J�*��
��0���HS���q��>"�VDl�=�V��,K��?RtD/'M�\@G]&@0�   @/@h6P��.�f���=��c������B���m<���2�aH����$��(����L��1d�p"��,0D͜�R�����<G+�s�0��a�����)�Hc`��49��AQ�!�<u@��F��D�aO� � .,���j�g	;��|[G,����藍�9�VA!�(�8�-J�-�� �$!q"AC�õeXe%��bː5<f�'�dx�bP�?�g��'�T�I`&@'@%���P޷%���1�~1�\Q�XV{��u2�wa��,v4�y�x�@�4��<�@`�BՄ ���w���{J�]Pe��vq�(iB�R` 5Sj�Ln�u( 0��h!
���0)�a��FA�~Q��R��YSG!��u%��T�X�C&DJr`I�����:f�=j��DbΔ�h�p�dXΓ/8s�8&۬8f�jP.&�����i�Q F���|)�x�cڍ�l~Ύ+T��f@��%����a:MW��"'AAFB`, Xζ㙕�h�$���pLMI�lI	</Q��
���9 �"O��_�2;��ͷ1d��#h�E����˚q���=yVIm���F]
 (h�n�fH@�@< ��� h'�f�Y�gc�Md���pz���`�{�E9�S`���¬��A�D$Ѳ�:�!��M5C0C�zS qJ?W�U�gf��v9J@08�����)�ݟU=$P��eI �a �Rs���aa��:�l�C���	���  @6G�0sR��a1�}2�D�*�V3�/���Iu2�%i�IXM��;"H(����4�Q�Y\#���@�(C\� P� ��a�EA ���(	�y*�$�*aѢ0 ���t�g1����  `X4�a�n!���^'�㈊�;2�n�B�yT��@	AX�H]wAf�6�J�����H����:��&��u���f�!� P�\�4H#w�ǔ�"'�����U�'��zP��GŌ#�xf-��6#Bѝ*C (��<Zm��o�79&g�-�� B� �@t�&V\'4�:Q*N̜�ˬ1e
��z�5$�P�e�f�>S�1����[jjZ"
0��Z��B���ar�̨a���Fò���!�@���(I&�(�S��#Cڂ���D�U�ïn���B�3�x霼PH��ed@�˒�M�U{� ��d D'N �Ύ�s̓��w���lb��C� � (�iC8:SN�­"���1-�K\�`�	L�ًVY�8� 4�@�AvVZ�-���,n������{ãy~���N���b����,���_A�㟵,*g�	�0����p���)�J{(�##� :����(G�է�ݣ����n%v_t�4(
���l�[K�YB8,%s�, �*v�0���!j�إ���s8, �C6u DU4HPA G�g�!o�Č�Œ�W�!'�f+�t�C @��pcn���ȴ�v�2I��|��R�y�����U���(�ȂH�Ax�I� �5� �0�!99��,Xc�56�h�M�b?i�d+"D|��8�ё���vŞ}��p�9�o^Z&�CB5x�R,Y��D�5��L�Nɐ!%E@zZj�р�Z"��7�NƄ1��=�M6 �j� Í�� ���pJCZZ��Ԣ���:�b�q2š��).��� �(�K��R�&���o�>��{b㯾����9 Ɯ2�;�������g��D�`cj7����
�L0��x�٣�-��Q3?���Q1*%�oM@���4���R
�V�i�Z}� S(��$Fet�Ēs��55����HMC��dH�0a���9fJ���Y<����82,�l�N�1�D,w	,8�c��0c0�`B1�Sy��(@Q�lq�ʤ���9��-W)��E(�$���Ą��S�!Dz0����@C0 ��0�Y�R�,C�ئϜY�Y�7�5��\  +�rAP75[��:��%ף}�!�f����!+"�M����#<�B2*6٤�gĔ}�pĒ� �F�M��c10�x��)GN�����r�ǻBDH$��J��#�G��GDXr�1)T�7�o�d��<�f�t4@@�V��Kס�LE����������ȶ{�Yo�= ;sA}�L6�i���w0���6� 4йt���[K=�&���˼s��N;��GbLX3���A�6�Ox�4�������r�B���D �U�4����^���p@��C(&�$������@x,D�#r�H� ��< �hi	DCM����,�A��zP`�#ZZBŪ���"��b�14,3����)�so6%�%5-� �D�eI���`IÔ1��3�I�@t%�,Hd��N�;�,Y�ڒ&J�28��nA�B���``���*D�� ��mP����2�h�n�������8f��H\��j_�����C�����c���v�%�!�����p��܊۾��f��<3�ւ�^�j��;iDL����ka
Qa ����и(ш��}�g (��(G�_*8O�����q�'��
eX���K��R5::g9�l@3T*z�7�T�$lG�N�$ q8v�� �D�b��!�÷g.�bҒ��&L�M';Όr�K����GE�h=���F���`��Q���b���������ؔ[ >Ά��"�}5`'j��V��TB���V�d� l��6
 H3a�RT+<�3�
�" ����040� 0�s�>���|ȊoТ0��������a��'K
E�!���Y�2�	��Xb�������N��]$ �0BK���
--�-�`��lP���b�%O)���#>#�Δ�}r��PC,������L!�e�$"z��E�!���%�֔85(���(��K&B! P��)��Ys��P��a9;@M�3�E3�3c�wfѷÈ�^d��G��Cq7�{D�͗�r�WaK?�G�);VJahs_�4�[���r���)�VT�޸B"�����;�9��tl��h�1  Ӟ�)�5�أ�IF�	:��,ry�DH�苚e��*���{ !6�̙2��������F�m�MJ���p�l�T	k��� �����I��\�������Qg.ڒ��1�A/�#A��K�Q�&WK\:K� ���.Y!μ /���T�#O��D3�2�]��>J�=�᡽����)v��ʜ���_3��\+�:�!�����)�.4t]V��O�á���4h�;�DD(`��I���ObɌ����,�I`�%Ϙ��y�h����Pih�(�� � ����4$&8rz�S�`���i��nfO�h��A��	�J!:g�-���{ٴ+�vd-[�I�m��!!M	�ͨy<_��{�l��q���2�����<t|�w���:�+��%�_�f��P��2��<s����L�������0e����,��m�p;��(
 ���=�܀��� �8�\� ���T��f � ����Q� �v����E���Fק�|���X1�Z�0�vZR�X<�Mzl��g��}>|~�o���emJ;w��a1}860o��	�a�'���Jй,����Q��Z�	,/�Rui��YS
��Z_ 5�hH`����� ����2�$R��=�Mц徭���0��[�"k|�!c,�n���O���s�	� �	!�Zj�/�|< �_Q�q0�B~b,���P�R� � ��4H�!A��;4�yX�tg9�Ȕ�����Z��E�P�Tl�͐-6x���f�F Ԭq�����g_�;���`0:k@�� (SG��5�(Y'�d�����1�.$�l�[V�����0g�K���@���j�JG%,:H4?d�����W��W����u}-����4�Ƅ�]*����O��G�>3�mL�<�f��%E���?���k�r:g�ed��0�sʣ�DP-�jiL�#�caz�PN ���r���erK�%Av���3afC:3�x�-q�=�ӆ��?n�~��=�؈`���nϗٴ�hx<7B���>3J3���UnP�o��5>��}��g��D�����&o�p�Í����=d�#lP�9o�z�a-J&X��5U��R�X@��D�4�fi�( � �;\:u;� �`.�N�)��ch�Ϸ������]�x���,�'!ñ���ߺ�s�@�Ij%aIͶwC�m�W����iX�`IC��e��#&�iy�
����t���)�G�cDA�e�ضp��>��y��9�L�!�,�1�i̒>Kf,<9O0��pȀ;����5�S��z����[\�eIp�x*}(q�a���DX{�Ʃ��A�M� ���Z��a,� ���  (���Ч"bk�"�0VI����.?��!5o���������%;Q,[b��|z�����p�_=��I|��wX�c%�1�r����/��K�{m?8u�R���(ɕ�U0��aa"@�����qxh9
�����w�,[��y,P?'A2��Rx~bp��H}�=�	�����ݟo�<�zp:\��%K���<��S� A
5������o}k��No,����G?t�z�~�os����9���J�q��e��������ioW�[��4��#�����^��T$(�Cф�D\6��{  4B��j�� � �t|��J��Fx"�ӣ�������Ӭs��a��Px̒m�v�����X5���wK_>��`�P��5@W�`q���7�������P	a�6�O�y�_�5~�S��� �U�1aq��k��Wݿ�q�&w�Aw�M8�K��vZ�bЋaaOԀjNs_WS.ca.+\�)����:��f�	n��������G4��L���fY��Q��|h`�N`��>;o���d=>��f�۔G�{!u�d1� ���Z�����'�T�������6֨��:���6��t>)�_U�)��-z�����9�u�A�)GV:   �	���Lʗ��j������)�?3~���_̭��&e�6���XK���[{��� � �AM2� 	�\�z	h4  ��  ���CD$�\������O�>�+8��"
s�5
kȜ��b�%c���۸�L�6��|N�cJ'��D����#K�2p[c�"��00��0�CXs��-�}���N���p����p��Mu���K��|?3n��C~Tꎙaq� h��4��_�NWK�8˖g�1����O��b�?�Q�=v�������Mƛ�㈣�	
k�,�����	�������I�6?`�讯w������S�1�ie���  `�<�i�P X�_�\|�������x[6��@2Z�N�sl5#��{�F���\���ǣ:k~�%���XM�� h����:�j�2b���s�/={�7����(�/�
C���ZW(�@� ܭPr;  4@�� @��S��Ut^A�]W���W<�����y�CP HXr��,�Y�QsL�*�iX�ٮ����Ed�y�!o�VB83DV���Ol7=��&a�a0B"2�y�u�Ü'o7�X,BP �+[�D�05Zn�9�|����s�_���#���p������w�kc�N�A�`�%E��gI,�6�@���@�WB;b��6�{П
���vs/ u'�����[�6�>{�~����)�5�I딍(�;VK��#F��1Y)�EG8�H�⇙�Ι�H��]n��b�f��ɇ/�1+I  N���g�,�Ba��1%b���+v�p���'�%ֿ|,��e����l��@A
���,@�C���ʀ <Hn�L�/92W�l�{�|�:_⏳�=>�%Krރ(1 CHL���p0�Е��-�us,�9�(�zU�YJ @<=<��x2��5��Ң3=<��H$"��u���6���]����
A���r��拢hh�+�KA�5*��S|��C�0q1X "�����	q �@#��T
�	���Z���An�?S���؟~�����|�R��\��db���L��j��<��ْՋ������6]�_�<Rg�${�ko�)�ǫc>�_�g��koO;d�g ���}�Ч�J�O� �  fP @ ���s��}����|��Ғ��G�~�f/�������{t�����C?|��8��fܧ�/���/�����>���ɀ6)"L��Sa��ؘ'E�ΪI h� 6����^Z�42#]��)Xf4�ߦ=?���O�d+>�gs}���:���-�	Y�Wt� @w�S�n��'��nfhp���� Рd[0�(6q:�$����Sb���d�� 
P�XbXc����1
 ���g�GXА3ҹ ---LI���%CJ��z��돋t��(�3��� )M�8�j��`�kLy���`����
cy-\m����*f$8X����b��cZ9��Ŝ��#�֬��N�j�?<��0F�{Y�KL9qP���������T��A�F �������Ƨ��O/�}e�� �>����Ep/�0s � @3V���W�!VG�=���x���S=2o!��.v�,�c�'���rK�WD��ud�G`C�� �(�P-~+^!�%��ןO����F$ � u�vi�ϓ����|�y��,�M�B�=�X2��JC��dj70+�Aq��f�{���U���5�4[8�8x�ƣ�C����#���9��/�hiH�� "B�� K1����̨aG�.���aD$��"�$����6 ��#��������� 0�Da�Hg�hteQ��%C^a���Yv�b#�c8\QQ�<GR7P1�ux�{���~��z.N#bi.Y)!��>v��x�������9Vǋ3�Q���� ��kBg�� ��Б�|���;+ٸ,�U��Eң7���r]���hY�����>��)$%(J�1;��)���Aౄ쭭Q|�e�S	����cS��C�'�9��Ѯ#�K9(��T<�3X��Q�  &� ,�����J���[yP �IU5   @� Q  ��yoHc)Mݔ��)^��5Bc,eu ��
��h7	˒'���X6S������.C>�`�*��AДh��ڬ�OX^�����3�x�p�9�+�j���H ���,&H� �0�"��$dx����v�0���c0$�E��.�
��)6J��@�4��J�Yӌe��ğ�ye	�xrj�ט�>�r��q��4p-�2�iG>B~|l����j��K¬�RX���ߝ���W;Y�/"�8�У`�������	>mݽ4qo�h�Y<Yd}��]^5<���~����0~�����&��%���q��NC\5��ffQ�Bm���u��6���n�Y�/�o��=��oyy�g�韧%E:��v��c�ǥ�3��~qٻy�L;6MT,%@ ذ�4��fw�K��vRg�$K�rP'u�@��: � !VA�[��;�s;_1��U�c�A�C�P�Ҳ$Zb�c���R�Ye�Z�4�e7�F�h������K��df��C�I`}�8F��{�~l|����ᾛ%#�΀���^�U������1�6�}/�p���U�?���)�>�>4[��n�+ ��A�{��ǟ�	��A()����IpYa���WSl���\ӟtX ,���y��5F�(�jJ;;�4�C~,�{|�է��]E%�9:9"d����T�ֱ~�X�x,M_5ɒ?���s���I{�������T��:��a=2fb��y�+n>o<ů��)�������C"�0׵%���U�a�h@���P1� � $ ��9?�������������'<��t��	a�5۲���>?�Gol���Ʈ��ܾ����n>sb��Ѝ5H-=�����$e�`9�yR&��_�X�K�6�
%|Qk�z����$�y/  �� �:@(�G�WU��lϖ9 ��yұɵ�� $$�j���j�N���Z��9��,(���@� X�絾�	=(NՍ��I�M��^B,%� ���&cm8��BR`�X/H$R�� ,X����������{�����n @�
�S��]��y����$	���b�08N�cp���Υ�F^�4
�$* �_�3c�	���\UQ5�� T+2�L!���8��s�P�T���Я>.C�O�wu�J|��gؕz�B�\���~�yJs��gͬ]��O=? ������;����|�s�/�����Wl}����"�� (P�|M3��%o@�hX췙{�_�׃�;���	~'Hdl����Q�2J�wurA�������w?��a-���]��H�a�a��,��NY�5F�����-��~,>��uB�d\/&�� $� �  @$��6��cƽ�C��52PA́d����4�YIH�@� #%� ��Aݨ��0�R�F?�ch2�Z&�u��c;79��U��Y��q0�N����[���G�ɜm�j�   � p�wC2�o�v��=r-� 8�aw�n�T�-���{���{����d<if>�#oFFE���"���qf�- �\e;		��$����?-9��&X*2��* O�ұ�U�:,�;@B��"�f�����E9�=c5�&|=�0�C����K�	�eپ��v�R��x}yW�?_��h�h�O~��}���=k߽ކ�:��� �(� �TE�����ѹ<��Eu~2y=v}:`�x�����+|��;�,Ռ�0z�ͯ�Q:�;���A*�1��H�{�;�ˁ�$^;Uk�X2|3*G~�h�CMĲ�}45�����Y�ʢ&�0=�*  $ �L�N � � ���h.`�J�Q��c22\@l  T��+&1ᐌ�(��p���{�D�k!@��B�I�5����²ψ}Wl�r�fv�X�ѵ���u4.=�Wp"A �9A� �DwKT���:��m��x�:��PFK��7�Ff�}P��}��Ov������~�b�*\T:��wk{�g�}2�Jc4��E�~2�� 3��3�� ��P��xp�%���3�b�1%ۈTi��BPM���aoj�0��i!�JD,����O'C/ħ*m� Rۻ�Y�'�ߟsr�Y<����/���[C|~!�˕1@"I!H��(�J>R���CQ$@�3��nLcH^��A�����O�};(iy4ٔÜ���&m�����y�/�ȶϳ�c�T�a� ��o�fY\�e��������q"���[��[�2�B]@�����8	�d$�n ���Gb2,������MRK�dH������Ĥ�x��s�����X 0����595O�(%�����@! 	"��@(�.'��&7�q�۾�x��ǏG^�6��f��@IY�K����18P����}���.��B��0 �(̹�����`�WT�Т CA��wq�ݥVp8{�$�tzh�M'��>D��s�J<��� ��( WUb�Շp`��%n�� �!q���G.G�0��Pt��L��H�.M����>$0��	�o$��~�?|r��73N{���i�������_Z����KMp�ʉ�/I+ipd�(4�*�\,�b)k�+o�������ǵ�_��U*�� �����z�\w  q���<3�S��2^3z; ͍�{nT����C�rr"��H�������$wR6��K
����"�D��Ƒ@ @X22�D�yD( XD<%�HB WY4�c|���b�K�bh��2H�̈́5�;!��x"0I( ��8l,�����d���e�В , ��<���e!�R��ur?@@7� 1 � � v>,	����4 t�.���[��`����%�RY�B����K4�	�� P�c��gP��D�3�@'3B!Q��� u D ��y6����;�������
C��1gH#L� ����R��W�T�>��g�*���2C&��� �a��Ġ��KGH3�b�4�� @ 4@�@�Pz�.V	�nH@�A������ڌ/�~�C>��|�ǈ��hSc�8�p<1/.���΄��3� ��080�l
 ��$Q��
@T}R�G�i���3^�9��(}�8�:�E���{�{�a�i�K�q��a�Z�Ml�� D  4�*���Y��|@�.��`SXHsX��@BG#�і��`�b �	� ��1 8�#��X���bnF��,�!Z  * " 4��▂�
_�K<(�L�"�E�+������򡃂P�?�B8��ቈ`0�bSsvs�N�h�l�A�1W�6�	���u�6-�a�^��qƈfYz�Vs��J˳XW{����;j�	�� �*�
�D�`����%PV�#΄9����3������n0�4@L@���14nKIQ�>e�,�ѦxƂ�@�0A�8��0��A��j����Q�OǺ�f�ʸ'�PQ4)�4P7��R@PGI�d?=���ь0
e�Ur- 0X,����>���@ �r��᠒ J��$E��DD
fq��l�oR1!�j���F 4����17��2b4NɞP��D95}1��r���:M�:�ư�� �����t�Y<�HI`S p�u�P�&�h���a?M���V��I��S�� %U&�@�5�p�!OF�z�m��_�_��+x�kA�2 �N �� ���8=�����q�;q���ρ{c9Xg����8Ҕ��
��ٳ�@� ���|x��,��4�%��I fe����<w�<?�j��,��(#bWS�� T���l �h���GP;��b�����=ۖ�K�,��vJ�QL�9��aRl l
��>��C�p��R�0�:��0ؚ��ӗ�%��Ӗ����|�H4���!�D���(��+p-�-���:CZ��|��?ǻٞ�*$�:��+�PP��Э�D�fN�y4���M�|���+�uLcY���C@0 ���t���Ays����K�5�� ����a��M�~���y� xĄ!�qb���,�꾛"	 ��b����HS%C��xW����Z��'�h�s��%�6׳��`���� ��E3�6�a�I�a�,��JR�E'X��!ؙ~%a"-�Yhif& 
�R48��%ǀn�B�	�:��Yg��՝��� ������d|�͏0�1l@@D�͒����ՁA�,���o)� Jo۵}z��#EP�8�"(��$r*��m�S@4��@�(\M�m��O
@�
�9PSS0��-��+w���F�2���ek�˶㷥������z�E鐽_4���7i�?�[��f��?zk��8�5 �Z|�l��sVS��\"��՛G��CL����(�Ob���;��fY���*�zV�Kfd��1F�IM�屆�)-�߲X�n�4IG`�j�6ށai�a���������#p ?��'��R|����{ta�GK�?�(0CJH;8�pH�}Wt��:��y�y�p������F�ea�hY�Ѥ�<WY�A	'� ��pU2��eap��v�_��efd�QB   \q!%��K�w���>�F���Ť��o��җ8�(1k�0DI�|���p�	g���%Wz�a�in�2D0�!�A��Q 
�Rp�
}�%	I�\�﷯��k<f� �R!"�Х�z�!%1��*���(��pr&�����~2d�^,���25r��]�������!q�͜LϳI�}�8p6��yJjh$�������k�Z��q��b���S���Q;���]HH��'����C��OF	���f��w
j��Mq�4K�	��bT��b������g�����g?�Cŉl�{Dc���FT¿8,���,�ir8�X�4/��Ջǘ�e��G�T�J���p硃�\���l���t��p֦lfO���C�QZ��ᖪ�&{c�x�V�iы�_N�_��ᘎݧ�o������3�e�Y&�W��9�j�V[�n�z�9�Ԛ^��������(�t+�������܉�˹�6X]�Vѻ�҈�DJ�5@%�J���7j�O�-k(��  ����4�p�2Q),㼟'P]b@�'�Z��c<�e�;�?p1	�έ�z�$疹��DqRQ���)���1��:��Ù�>�f�3��щ��T��䘒8F� j,�=[�}5�KQ�+/�=����F���k9����[\���C=w5�;m=Օ�����X��u���+�wܫ8������q;��T5������#����^M{뫙�f'����C9%Ψ�ݴ�r�%��6>_�K��0�VD��s<��:�_�Pv�x�,��ިq��r�xs����@���@xA��@@� �4�!
SL�cD#� u�)�gy^
���|n�ku����>������:��ǠA���M�$���������b�|��]h�oL�~�M�|s���Cu:ʪ��>m@k����C�����n�aV�yJ)���->�g��{j�XW�CzL�ݴ�v\�)7�۬��;~�'��"��P��'Im�r��)�Vt�X+/����O=����8������~��%����O5�Ŷ�xmd_��P�{���R��rZ!�d=T(���sy�cai���u|u8=��G�5���W��3�u�D�V$��P�ݴ8
�h�� 0X��P\V"��A��G.ȣ@�iAC�F��H�ޏ7�ߞ����3��L��Đ��M�n��6�P^��m� �錒��bd"�TD=�T��2���乛X�N0<��A��1�e�cNs$KĐ�ێ�}y'��oP�5Z�=V��)� [�5��Rƒ���Z	4�����N�q�t}5-�y�12H�m�b�"�5�{G8%���z�­@��طh��C aZ^���\l�~��� H	A4�R�IJ2^���mLD��V��H6KԊF���2��k���)LkK̮sjW����%���T�����׺>D�Y�8?�����Fo]�v]�T~��u~���;������K��b�6 	����c7�.��r�$�Z�o�e�}V�?�%gc�c��iTWM������XCs�Nu��LR;�&6��C�Jw�u��K8���r��J�XO�c����1�ME@Wȩ�N�rt.JL}Lkj�<0Oh��|�.���v3�We�xV�ɡohU~�( ^����?y�U�{|+�v�e��*҄ۆ)�/�|:�Py�Vg���L��$�
5A* T2���$��Bi���$@E*�$�:�=�?�h�Py�0�+��K|�g�-s3<���fb���֛������$�b������PNF��#�w"
���������������S��.>�Q���s��i��!��qڠ�g�M�v��-�Ѽ��X�����F�B���M��mdB+Ґ��@fc-qڜ�c�n?_-+�����8O��@����q���'�߇��͟{ma�0��Tq���b9xṵ�y<�i�a�ގȶ�Q\�#��U�)[����'�I,9`�%�E��  �1<c$��5&�C,�}w��^���ؚ������<����:���Z���ֺ9��v�=��v��f��]��=��ܣ\�)��\Ӗ��_t��..�Z�~��%�Z�>���/'j8����Wo3��+_�T�VN�x�7�ޏc�[�*�$n��\z�oheb���|Һm�cg���X�N¦AbY��	�4x_����:^�!��TsF���:�T9����ϕ��x˫������xL)&��;��/���CAe��:�+j�?��_x��{uuɷ� �~������%��x#������T�3>�{��?�t�&�q��L}�۟b���>�c^�)
x�F��lm��A��if`Lz Z��A,�:�����B,��56wV'��1o��⏧<E����u��eB�oRN�w�-��A8�=t!�7t!60�!������;��c��J��?��s�^3r�ZG�Oˑ���c�.�øu��g�{e ��Љ��<�A��V�P P�������eL��^�":r͂a�!��y2�a��P�%���^��X�"�`�-V�;����kiӸx��&ແ��~�*i�e�a-�wf!Զi����
��Y������>�V0B	~R��/����B/��ֳ���~�(�V\}��,]E�L>�a�e \�lc���!�ҭk�c�.xV&HJ�!�D����P,�~��a|��9���N3�s���S�«������6�n�r�"��¡?|�I����3]_�mnIWj7��b�=ܻ��;v۝o�/���]-�OH���'l;I�L*���LG�h:h�N8�HQ�l:��解����TX�K�eү�t�Ԁ*��&x��͇�/���ͻ.#Op\�L����F�10���� �D�0 T�9����D ��i���N��*tr���N +�䵑�8�/�ćQe��hE \8�*��P�çA�p��� ��j���*FQ� ��8�0��3%'r@��5%HV�E'�+A*��MI9�����b���[�xu��rx��a�ްx����F�w5�X����E��:��)�v��[(7aHqpwi�����������Z��Z�f=�U�H�E�W٧�Nk���8t4tY�[��9���?.<U�_faǥ��u4�(�@�ۂH+9)Cھ:-��CQ@� X��`UKH�ls�n��-z�^�k��o�fs�?�h�U9��z}Xo�����"L�0�W'�~:^�4��!v�<Z#K!l��m\�|�>Wjr�Շ3G�
h��6��2���`�b4q�l'��y/��`��Ik� ��A!` Ă(S�i��� `w/0�� 
XxW�ǽ '�Ѹ9�R��eZ%�Hl&�(,�rd<$�AR�h�j�+�����l��p�:���!)�����T�[����l��E`�("V�n����S�@����1 �ThA*R�<�%�nJ�h��]����c19}Sg��C�<iM�!�
��'Fd��#�u�-�xr7����v�%�\u��mlMA(����%��7۵�W�?;����}޲�o/�/�3B��	]�Ӕ�z<��a)r{%}~h��b�NAk��Dmyo�&P]�}��TW�i�v��D��3V��`���/@�����	�3@^��8��\����JՖ��ܱ��bb�����#�e��|�;��B�n���J��o�o�����1a��V'�xJ�p� �j=�.�%a!
��S��bxfO�;;��(���t �8�6=�����(A�^��N2�AڃDaCS�� ��vb�h4�O��� `C��}�XL,�I�`H�a@�D�2L��F�0��ǻ���21����1E?�gNMc}�n'��=�I���]��6�	���(q��G֪(a�`p DZW ( @6V  `M����6m?�u۸s��]_k}q\o��䮒��-��O��w��6D6��j�2m*��S|��=��U��~�m�~��kXz�)�fQ�*�(
��[����PC���5��W�����Ł�7�����?T~7�~��~Ju��K��^�Aˤ��I�w�tK�{:@>�{*�߳�&�Cuٺ���m�H�-��O�X�٣��?�2��'@L�8m48_������3�귓md�<�L��{�'Oo|*���8���������X�p�X9��ܷ?�{��]�j!�ͅVv�G��SK�S��8�?s%2:��J�i��)��#��Q�՚D
d'IQ["^��[��w6���3<��=�~R��a"$	l�m�\p:�R V'����P&e�e-��T:c6��a�l5�ca%T��FԲ ���R2����E��q�öZ��FB���r��j��*��n"���P�6�'ņ��*;�ܦF�_9�9�T^�T��ŻM F����q��g~��廥��8=��п��um?���v����#ϝ( �/)	l���M�yCPv�?����)�\�8��t�w۫�.��3��Y0$�H!>���2�-(�o��n���e�oa�}��\��i5���D����N��9w; 9]$- yaex��X�:k�M���C�72���wb��$��d�nz���vҩ�o6'3��BZ%-	�
���� I�a��� �pK�P�  Y'a(vc�rf:4v��TQ��jA��;�x 
 � ��h@���hQ4n��pIVI����Abb�@M���7ϭ�PP��忑�qO�/;�V�6��E
��o1�Jm!%[��[^M�ǃ�`���x2��@Õ4�Ct��d:�yZ��'�sJ��KN~�f~/�R򫵓���������s_f�/4s��ws��qZ�,�g�C/������:@�T�vr�@4W��ue{2/�%O���1�m�yJq�����ngnu��ɠ����8O;f�� c��KC�:2da�	�N��[�\�l���:B�*��G������.h�˯�^-8�J�اS�ͯ{�ʙ�-��K���v�wSj�T�H���RN��	�s5� Ã��&����2~v©��������6�@_��A��-{�a�qs�C�1ۧ�������)@S�y�J�� ��r4D�$��
��LM��b�BBȔ{��薤��H@�}����1|<��dS�9���ܭ@�A	�va��<��3�O���}`���1Æņņ0��x�Ц����m6C�F��эӑ|���H 7���9��˃�q���~����pvNNG��ы��!u(�Nq;�,/*��,�L���pw����gǏ�w��E[zus1m��~��`�iҽ��c۵�����}�Ř�J���5>���m��s��TmI}QI��Df(@���qwb[V4�;";4��D�:�����|+>��.�|[<���e��R֥jή�����N�����x�D҂�D� N�|�N(/�hP�(��`5˼"v��-�`�~�e~�s�4��kH�Q65��ǰ~{�]�~��Юv�pP���WC'o�8�*��B,EG"!Ww�a!���� ��1���g�C��(����� S�s���d��P0�.[� 0Xx��(���
����p�csOQ�#[e�������Y�14��Џڞ�r�3��P�h��}M���/���������2tLҵ���~����9s����͖��KB�6ձ�rz����?�뻗��G��ӧ����0��)yza%���l����O��M��r�U��*�a"�D�K�����'o���2����7A/f���g�|�~d4j.����t���YN/�	�a� oZsuY(���G���5ůzȾ?tj�Gu��Zyr�����c����[�1��o����d���dHp�bR�V� =^�q�<��!<�3�6���T+��d�j��>.MpU�Ǿgݭ_��Ǳ /��q�bv��I��|}���r/ءW0[}i,������i{�;���_�\M�I	������-��}�J�Cx�[�/ٰ����m$��e<�l�Y&3:M�=�|�1�DA�[�wMtO���;xQ��i��ږ����Ь�i�y�ٿ��%����5qp�K�k>$�}	�q�������d�(�1�}�;xm:d��Dv�r��`���*��j��}K��Ua���wO�Y��o�%�*9��(���ࢸ�����o_~�Ǯ?��u��-�_�0���y��
���C��G�{����w#i�7��r�'�)n#���4��OΞ���0����®6>[�_��k��KJ±l����C��L��v��~?M�,U�����Ԭ�h�毮e�������=��_�|���/*য়+��~�����|yxЛ�`9��a�p��_x��η�xw�/�|��Z���k7?p��������t������ڷ��|q/��F�+��=��� txH2|���/�Ã�P��X�J>qX"��L�-{�ޫ���ۄP��dF����8d]�b�rO���H��;�܍d�éP�GJ�4a��l�R��!&����#�!'�sq~�%����s�2��N ��5jD�m�Q��GA0�t�}�a]�w�~(�����wP�9>�
��9�P�?��]'��H��S,Ќ�9�y8C�>��
�(x< 8rB��i�bC=L����ջ=���d�8h�}��ta���)���_�iv����T�Ų�������5`������KP�C�ݝÿ̖ٚ���Z{����av~<cGM�_^�<G�}���[H���`E��/_
J �%���RPA�_n�6i�P}*��7G�z �G�j��p'~�!C_,!��=e���� ���2�{k�wx��eq����^�|8��쬯����G���V��� p|@������yQ}VMj;����"���X*�뙲z��o��r0�O��ƈ�(�qu,����Q"0�������
f�yp�����pxP��D�����H�YA��@>��
%-9.
P08%�}Pj ��(5�����4��e�i�M,�R�R�� @��E�pt����<e�'�0ʚ���@�����4V9��.�0#�8)I�wa��Y\�*�Y��=z
<��9*4����}�-��>���0��8�۲��J�4F��?���Ѩ�=��'5&����[�fz?2��)�����C�1l��(@�����A���ƅ�R�Q���o���t(��WG��\Yׂp78��F����֠�\��㇘������J�MAZ�,�3�'1=VE��Q�pi,9.AyAq��;��{
�\.W�`�: Á�ir�44�~��aJ�S9�.�鰟��潽}ҏ���J���!e� �PaKlg7�sƏ�:�O#b����=��y�ps�X{r7��u�Ű��,0M?bB��(貖:w#���"aP�CDLA���T!܎��pl�x�آ�q �C�QF����P��T0,1�KN����(�\5+(g��$�C�����Z��r���_��O���)����=c�B�1r���bo��.H� (@` :��`�}�?� ��oz��C��ƒ�����^��W��}}{ؾ�|�����iQQ�Y�)��G\��8#Ʋ����d`J��V�o�THI�[AJ����3�j������:�$/�7._lBϵGu�&~���{��Y⿹�e�_��,y>���QB�q/��P�r�uq�`aj��{L���j��3�A0P���q��!p�<o+0�'|�a�/��#����Pђ1d�-6�S��BC͂���&�6�4��)�g3�I���(%�3J�3w�a(��S����}��p��D��i!,�ц�����2D�̙0���_�>Jf�
@�H����z��� D'�5�D���G|;?@�o�W0d��D� �A݄�"�@�񹣌�ӯ�SDx�bꍠ@�.`^v!i�@D�'��0���	3�1�1� bg*�!PQ������!ed�eV�T��& �HP��yB�IF"�0��"#0%�����a`�	+/����tt�rR��G�.�����>%����"A�$	E � D��ca�AmR$�D��I48��� P���dd$�Ĝ9;l#�iq����<�l�F CN	 _�kL�_�pȜ� �J����L �{)�0Y+!��( �Ҋo����Q~�Wq�O'BW .{b�� �P ���_$�D�Iy��(@���  0�Y �I� ��g�a�dL!���� � {�IL̞p��Ts{��4%f\������Lp�d���<���Ex�;�� � D�見,�����t�'  �+��_�O���d(ݍUP��@Q�b�0L�&� 4O����aF(� 2Ѣd �� EK2�L8��e^'c��q�._�o2��I��x�/�K��M�o�o�ųA�<=9`����R��*(��"@PAQ���9Q���OH|���[dLb���$!LC;���>(i�@3�R$��� �$�]/e3A�s� ����)2))i$Xd&�b�	L���g�Ba�� �mfK?ɓ.�     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://d1oymq3qcpgjs"
path="res://.godot/imported/3_8.jpg-7433ca77380f5a9e06c9e5c08bb7ff9b.ctex"
metadata={
"vram_texture": false
}
 RSRC                    Environment            ��������                                            d      resource_local_to_scene    resource_name    sky_material    process_mode    radiance_size    script    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction        
   local://1 Q	         local://Environment_tjyb5 e	         Sky             Environment                                RSRC               GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /�7樍$Ir��G��3h0h�H��w�y�'�F�$��ß���@�m۴5��϶��~;�� �g���x=?�F�o聇�@�a@"�(A�`�� b�H��%��`$�`��h`uSO��<*6�q�p��8�Mi�ʨ�5��`�0Q��g���B��0",��L�A%���R�0zT�� �$P�8��R�����9�.6�$��5Z���l�q����-lXD8�6i/Ge��9���{�Z�*�oĮ��Z�x�Z���os���B^X��w�㗝�����9�\����`�����.�̟6���Ӷ�J�SL��1�ø�0fff�-��]������������:�%��$ɍ��������|Y��~1��l�ԧcr��l� ���[���I6� b%�cb�ac�9̠$r�C֑�U���嶏�o�F(���V�!�6��R)��!�����3���%�M��}\��q��3�"���ņ�(��d2M��vɂ�׳�ɰ�J5�.�,c=)5�Ȳ�T;,�
/)5A���Տ@���������E�_lX��*��Џ`����<U�� �����Ku%d0�p�*���Gpxxt5�� ����:�f�wG7��q�F�� ]U�8wB�����5�����;����B�a����'�� �d����.]
<"[��"����$d6�8��ѕ臙0��M^���6LơC�t�.����';�.D�8g��qH�n�:W�pDn�8�������#���ϒC�-���4��[h�� �ѣ��h�[���R���8N"�L�5�1��C��H+�dvt_f!��:�E�!	�O-UL�
��0�m d2M�R�dL��p���D�[����n���8B�-�I�o4Gw�o2��R]ߡ���&��]@>tO��0�|�j��]�F��'��Z���Aݘ���{�qQ�p����FR&O�-�q��R���g���8DC;�J_�.ccU�c	��zӭ'~ȸ����?�����G�rN��b�rt��}��1d녴�ѭ�~�z�t��1���)[o����^[��}Ïɤ�'��ի��ztW�A�m�1#���K�&ǣ���B�x������D�e�ߔ�vt\�!��)F>�7����\�n�����ۆ���g����<wq1�m�8�1�|+#�Ct�wR�5����8��u�y�l�0�\&uWq����F�TR�o�F�ɍ�����5�F����q�l}P� 5O�8�]srs�$9W�~��[�p�I�9���Fj	���	�}��t��D��5/.�	����%��b�z�6j$��y8������C�u�$�l��ց,#��_��ܫlNSEdc�-���_� ]U�	@��a�.l���XU�$�nu���c�ȶ�U]ȃ�Ռ�_���T15O A�z$V����<����c�O��~i<�r��l���X��m�G ztw-�B����#p�����k;Ta��k�G7�֮M&{`�����`�X2Y^6v���+/翎�j�x����r����i�������9��G��W_��Уk	�����]+��X?�]˭A�f�#P{t�@�f���m�؂H]�yF�X��+���(zt����߾J�9�W�JuW�>˃�"��XR���A�~�\��MG(���-�7H�\mݻF��aXGrДE����������BDok�E�����            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cv4t8y2ige0fp"
path="res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctex"
metadata={
"vram_texture": false
}
                GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bd4jnhgemw03n"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                GST2   @   @      ����               @ @        �  RIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
 [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://6v8ya0o1lqy4"
path="res://.godot/imported/icon_2.png-1537e13e6023d6fb620bd63970db43fb.ctex"
metadata={
"vram_texture": false
}
               extends Control

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

func draw_y_axis(x_line_h: float, n: int):
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
			draw_y_axis(x_line_h, n)
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
	if $graph/zero_x.position.y < 0:
		for x_line in $graph/zero_x.get_children():
			x_line.set_point_position(0, Vector2(x_line.get_point_position(0).x, -$graph/zero_x.position.y))
			x_line.set_point_position(1, Vector2(x_line.get_point_position(1).x, -$graph/zero_x.position.y + 7))
			x_line.get_child(0).position.y = -$graph/zero_x.position.y
		$graph/zero_x.add_child(x_l.instantiate())
		$graph/zero_x.get_child($graph/zero_x.get_child_count() - 1).set_point_position(0, Vector2(0, -$graph/zero_x.position.y + 1))
		$graph/zero_x.get_child($graph/zero_x.get_child_count() - 1).set_point_position(1, Vector2(500, -$graph/zero_x.position.y + 1))
		$graph/zero_x.get_child($graph/zero_x.get_child_count() - 1).visible = true
	elif $graph/zero_x.position.y > 348:
		for x_line in $graph/zero_x.get_children():
			x_line.set_point_position(0, Vector2(x_line.get_point_position(0).x, 348 - $graph/zero_x.position.y))
			x_line.set_point_position(1, Vector2(x_line.get_point_position(1).x, 348 - $graph/zero_x.position.y - 7))
			x_line.get_child(0).position.y = 320 - $graph/zero_x.position.y
		$graph/zero_x.add_child(x_l.instantiate())
		$graph/zero_x.get_child($graph/zero_x.get_child_count() - 1).set_point_position(0, Vector2(0, 347 - $graph/zero_x.position.y))
		$graph/zero_x.get_child($graph/zero_x.get_child_count() - 1).set_point_position(1, Vector2(500, 347 -$graph/zero_x.position.y))
		$graph/zero_x.get_child($graph/zero_x.get_child_count() - 1).visible = true
	if not $graph/zero_y.visible and graph_l <= 0:
		draw_y_axis(x_line_h, n)
		$graph/zero_y.set_point_position(0, Vector2(n - 1, 174))
		$graph/zero_y.set_point_position(1, Vector2(n - 1, -174))
		$graph/zero_y.visible = true
	elif not $graph/zero_y.visible and graph_l >= 0:
		draw_y_axis(x_line_h, 2)
		$graph/zero_y.set_point_position(0, Vector2(1, 174))
		$graph/zero_y.set_point_position(1, Vector2(1, -174))
		for y_line in $graph/zero_y.get_children():
			y_line.get_child(0).position.x = 5
		$graph/zero_y.visible = true

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
       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://main.gd ��������
   Texture2D    res://3_8.jpg t(κ }
   Texture2D    res://thomas_simpson.jpg ��ܲ*�Z
      local://PackedScene_hxuqu `         PackedScene          	         names "   3      Control    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script 
   ColorRect    offset_right    offset_bottom    38    visible 	   position    scale    texture 	   Sprite2D    ThomasSimpson    graph    clip_contents    offset_left    offset_top    fill_above    points    width    default_color    Line2D    fill_below    zero_x    zero_y    line    l    r    a    Label 	   function    text    placeholder_text 
   alignment    clear_button_enabled 	   LineEdit    a_value    anchor_left 	   modulate    b_value    n_value    output    updt    text_changed    n_correction    focus_exited    	   variants    ?                    �?                            4D       
    ��C ��C
   '@�i@         
    ��C  (B
   \ �@jm�>                    �B    ��C    �D    �D
         .C%   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        @   ��w?��'?��?  �?   ���>��?��1?  �?%                �C                     �?%        zC  .�  zC  .C%   �                                                                                                                                                            �C                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ���>��?  �?  �?%                             ��(?��?  �?     �?���>��?  �?      B     �A         
        �B     ��     �B      0    	   Función             ?     R�     C   !��     :C      -10      ��     @@     �A      a:      ��    ��      10       b:      7C   !zC      21       n:      YC     xC   
   •••       node_count             nodes     �  ��������        ����                                                                ����         	      
                        ����                  	      
                     ����                                              ����                           	      
                       ����                                            ����                                            ����                                            ����                                            ����                                     	             ����                         	              ����                         	       "   !   ����   	       
   !               (   #   ����      "      #                  $   	   %   
   &         $   '   %   (   &   "   '                  (   )   ����
      "      )   *   *      *      +      ,   	   -   
   .         $   /              "   "   ����   +               0      1   	   !   
   2   $   3               (   ,   ����
      "      )   *   *      *      4      ,   	   5   
   .         $   6              "   "   ����   +               0      1   	   !   
   2   $   7               (   -   ����
      "      )   *   *      *      8      ,   	   9   
   .         $   :              "   "   ����   +               0      1   	   !   
   2   $   ;               (   .   ����      "      #                  <   	   %   
   =         $   >   %   (   &   "             conn_count             conns               0   /                     0   /                     0   /                     2   1                    node_paths              editable_instances              version             RSRC           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_k553f �          PackedScene          	         names "         y1    visible    points    width    default_color    Line2D    num 	   modulate    offset_right    offset_bottom    size_flags_vertical    horizontal_alignment    Label    	   variants              %        zC  .�  zC  .C      @                 �?     �A     �A                   node_count             nodes         ��������       ����                                              ����               	      
                      conn_count              conns               node_paths              editable_instances              version             RSRC         GST2   �   "     ����               � "       R|  RIFFJ|  WEBPVP8L=|  /�@H �(j�R�M��	!�� �-`�SJ V�Q����w40h$IQ��Jx��^B����C�.P����H���m�?�]1��6�V�ߦ%��o�9�Zk+�2��9�ڶm۶�d۶m���,�#6��"*#�{��;�mՖ$�Z{�sP��\��b��T�)џL0CRpģ��={/Oֶ������~�d;(3~��<k<gf�<;��ق��c��193"#lK��7&������w/{l�h�<8���[��R�C��T�C��kkq�"!�&��df�l{t���HB3���Gk��H���d;�U]��=�233���6033����4WfUf�m�րm�"��u�]�CI#�e[2C�effff��a^��a��l8ٰ�l� �h�g����cx���2�T�"B#<SYf�^`�' � )T��O-bT_�b?��_� z  ��5�@� N5@� J��$��[���`� 瀋F�Z�a	�%M�'59R(���
"�ߩ�����~�6�~�A)�ǜ���dEO%�r���<�%�ڶ(�J!�K5� �H�pO�@�@� � �� �b���D����YΫ�T����Raɧ�`"�H)��<��C�L����mٱ���Nk�O��н#B�;͡Sٝ��yjI�S��O�����g�g�����2�/�Z�R �0X� Jؼt��X$ �P�m�p,��b�T����H�g��E,bo~�o��̔��M4��rr�DB%����V������Q���x���\>�~�|v=<�$�/��'�����:�_Ry!7�b��S
�E��,`wc�i�u(�"�"` �۞�*�~:��(ri>I7�F���ZТ��"�s'L���R��]j 2 ý���:��ח����'��x�
��>�l�{<�N2��[�Wf�#/1��z5G�
N�H�,s1��^�,�,���$*�L͵͙\v� ��dm����h�"����<���G~3H&�S��-~�g-|����M+��u�gߦA5f)��ݕ{YHSo�����.U�8�
����ԹZ�6ϰp,	>�}��_w��y����דh�M��]�+��X|w��
N)o�������x���o�ww�j�0�<�ߺ>3�zu��|a�@N�W90��R���xdJ]0� ��#����MF�����Y�g�[�?���s�X\���Wܓ�����g�&��RHrer^<�G/o�Y�STy���>����/�JU���2,%�����ʉ�w.(����u�#��N��_��A��ף���ʊ�����?��os���=T��M5�Y�+���|��ܯ�NT����TkO��'L����c ꫂ;&  }옵� `p<�r|P��U�]�7�����!�OW�W�u����h��C��&X�$� 9�"�����O��'�0��c�[�h��k ��\��I���G��7��ZB����{d��~��R��2Y͜i-���fH�㩋�\4��./�5\R��1F.��w
���sκz�6WE:vB=�� �	�4o[���" f-�aeVR��k�c�HU!5�6
s7�ii�q:�g��f�,�1��6R���qtO��*�8����޲e�iJ ���J`s��4*�R"�I뿗�t�����ϑ_��>�,��f��񝀥��{ �UV_g $� @cL�m��P�ݾ�?������x5]�����ﭚM	j���������3~B>� !�����7����y��H��b)�D5��e����ٟ�J��\ P[�;� �EIJ	��tW���}�F�����5�������A��j� x���� �#-��J����v��ܿ��[������}�F.M�n�^ŝv���"�2��/\��Ǻ~��虎�����n(�ɥaR	�
��{5�c�9#����@  A�+�9	jugO\�{-Q���,������=�z�i�@֭ ���m�'���f�~~��K�N0�����]�����jԶ�l;U:j.fJ�ju�"�r�"�h�vW�ڦ�;�QD�Ԏ\,�� ��Y�a� J� Z��} rmRu�����k�y�x�Wm�|da� �����4��Z h�vh��HU�����m���@�j����]c�����9[p��t�7[XU�f|�V �R���K���.s��ǿ�J>Z��"���vo=w,�$0n宨�.oe��w��;�Ҹ�A��(� �Z�Z�D��O���}��/o���C��Nq��5�̒.�	ؒ�h���J�m������|����,�?ݺ�٧�cP���+���R#��B����O��k���]��`��,�~@N]�-�(h@́�H �H�����vO��O_ae�tlhy����*�"0�(@�1��zG��E�`�T�

?۬ ���^�M���8�������3�$+Y���7��[me�Cj�U���R�w{��c�#Kx�S��/��m�Ej?�  �j�E(	s����s�a��㍨���<��V#�� Z �����䀕������.,{����̑o�ί|�gٷ�0\��ϸq�,q��J:���xd`��LL�"�I�CV>o^�O~�G��Z��i�=APk��m�}i.���B�rk���D;����� �|;�� ?�����b
���t���W��Z���h��w���' P�Iԕ� I ��A���D ��3�~h��&��em���#�J j���>�LU
N�e׫v���4jS�^�{�r��>�F�5cCU�Yj��8��v��{gt�s���=�3��$�e6��HZ�ˢj�f|���6�v�NG|����5���?�l_���Y8�$�������%�E����*g���Qg��r�q�OW7�NV�g�����l���b�y'�V��]�ThS�Pj�,��9��.��kя��*�.WW�}�oqh���&!���y{?�A��`�	0XMrĀ6�"	� ��T"bZ:^�vFoS�����NA�:���@2� �:n������G�fG�6;�FN�b�4���7i���:P�W.��.Z['����W>zW?|�'{ۚ��]~���=���m���s���i��0�IqhoSC���2� �`\M��J�`F�����p���d�����7=:<?0�]5�\nq�'����>9��d����Gzy~�?��M/���ȳԆ)2�m����Ss_�3��� ��}@$P(X�x���l���k��g�t_ *-p�c�F\���ۋC�����=����q�3%{�X�I_9��ֳ����p�ߖ|��/�X�M��)�KXt�f��J��}�:<�^���L�A�ڭF�[�]1�:�y`�TȵT��bа�H��CW:�)��F�7y��]N]��=�9���8�%?�z��:ǰ'j���$�)�+P�����fUU�ީF�r9?�'Ł�6 0H �X5 ri
1�	O�[?�K �)�7g���p���_ !7]�p�����7TlWn�c]3�ԼD�#[���bi����n��p��?�k�i�+�8/���t � �vԪ¼G��=���?�
���H���"DI��Q�؍Wр�"�u�8�0|�{�$�#�X�5cS�tQ�g�0첕Ls��`�o�z���U��yG�a��+p�aU�UeN3�*DBm�3�K�8�۹�!>m   (@)d%�=���>��d=�J�� ��Ҏ�6�4m�>��/vԮ�_����/?<s�q��]F$��8rO�ER.a�c�ۯ ��`���w�Zj�n�� _J}yV+�s�m�Ŧ8oG�����x�^Y�akS�K��0���Y�� ]
&M��q���<��CY'$W�Sr&5��M�x�O�R qmmdH!k`� M��O�q��XZvͺ�i�/��PZn �f��R���4 � �!��U�&��Z+5'���^��������\R�W\Ϟ�S��Rq�5��\1rJ}oX�s��V�N8��lɀ�r��-p\����|���%�v��+v��v���;�<�S���ؒ����� �C��"��|�Й�_��Ҋ���yy0���)8��[d
�r$ %
w5ꑊ)/���ү��T-Ev#�Ji��Ia��=�,@aa0��   l΀�%��;!i�T��xB[���]�����৏sp�}��j~����{y��:S���S��s��k-�n�1��|��8��m � �W��!�=��ej�V*8���p�\gq�Vu���Ǻ��om1�
1���6�6Y`�L�3F��<G��z�s4��ٰ�Q0��%�����.?�*���j��-��b�
a,� p@��{l�P���$\"���I  D����6���E��,��I3��]G=ޏ�]��,J��&��g���vg���&�B���Ir嚽��;�W����=��Ӏ���U��k˹6�0n��zZ���;����Vw�v�zx�79 1 A��f6C
@/K��H'��w�.2��"c��fs�յ�b���A�Hhk��<�Y:�����G
`�ʹh��ݰ���=��;�&�L>I�����Mr �p�+ij�o  �5@����o�v���7�d��ؾ���~�W�x����.�H[����c��^��u@i�(tW��:���1w E0p�\=�����>���=ӿ���s�{>��r�������r�ş�ky��G\:�gGYq��ܘV˒�v���| �� `�:�m����{d������3��̋�v��;�?{:�">L�ot��95@�G�bi�3j5��,�����;�B�J�r���>�K�I������|��9�n ��%dsc!PrЦ[��w�����Z6O��ŷ�x�:���Ug?��'_��O�����s~�������rG�6(0�[כ�1���c;h�������%����1/��~i���d���0t��޻�(1����N�_/��ۿ���������q�g�vu:����e-c1�΁� �Cm�G�V���r=�勵{r;����|�]�Ati�8|�/�
��M1�"�K�n_\.��f���	k���˔�I���H�ad$ 5K�S�ǧ��x�GVFP%�6mo��!���nqK|�����*g��?�`���j���zz�����뺛��9����i��cX]��6��h��wOܣz���|ȧ�?g���֨>6�>�7Em�i>2J�o�u멇���]_(�>;.��]�2DD
Y�D���G�P���u�%�i�㘻f��%�w�Ӵ�ʎ��M�ߙ���G@4������& ���B���W8ϧ*0*l��5Y��lw{R#y���K<O�sp��$�Fɫ5�6�Y?���t����9��,��:ɸ�;�z��wy�g���'��;l]rv�/^��������QW��ǭ⹛������������R��ﻄby�c�嬔��OR����X���)Ol"��'�n�Z��1C>NU��5T�����r(W`�3�P?�o"Nm��t��g�u�e������W������r���q��{.��S�f�`$٪7u�00�;i�q�JV�P9��Y�~?�x�UN��ɱ�n��o9?w �5Ц[1������5��_?��Gù��^�ҬۋQqQ�Ք���ob�_�K3���Kw�����v��r.�X��\ƺ[�þ�߷�~��Å�o�3޼��O�Oլ*g����z�ށ˕]9��ߏ�fwg�_��׆�k�CV]/Wj�t��#�ղ����i79��Ƭ�/���z�ʗ��9H���)9
��dU�v��%uW�H����y�d�5Z�,j�^hONuZu0j��;1�Ȗ�x��s�g�x��L3,�,���-����� ,m���@h7Y-g�q�۾�x�����L�8�𐳾c�~�C��j�����Q(ݽ�)7���U9������1��f^_?ooD�ֲ�m���{O��:���{x�Hn.6-2(_.H
��K��a�P��������ͷ'����R�v��XwG��X�ڙ�F���e%U���&�g�6K���7~p�s��Gj�m����_Y��T�^ރ	���e�����9�'fC8����aM�YL�`������%�j(�g*5 �ۦN�f�Ù|��Wp�˯~��������Y�_ۅ�����~���g����	=w���rx�jο�������Ŝ�G4C���xZ`���qW9�T3��h�V����P����R���3�;G��8��ڬ'�����7�C�j7��b��4{��j�N�=��m����7CgG�l�Y��f�;�<���e���C�<�D Ap�ahQǥF��΋\����R����2&57����h�mE���s}���Z�]�~5S����O���㵠�vkM���_v3���'���>��4�{����t,%��A�eB�7
�Ӯ`k�9���0r6$Ԫ�=���z�������A˻�/���>��TE7=�B�i�uޢ\����{%��Vl7R��Р�V�Moa��(BxD��$x��C�	�h8>�h�R�1�29^���t�[uv����JW��������yE���ws���b~P;�O�dec~㧆iLψi�n*���z�	D���:�� j �g}@  h? �(��:�kV�/���/<t�q�K�nP`7B�q�o3LR��I8�"�y���{���ŋ|�G^�IouO��VX��t�A���<1`����xxF�L�Y�|�7":�
짠���94�<���|��>���%���fz�"�Wk��������(K��0�i��bb��
�� @��=�,�C�Ӽ��C-)j���H�s��w._�t�p�j2R��v��S����Mv�5�I���1�z�JSxѓ�0�.�1`�K�� yz؟���&��@���Z�am g�]�i��k&3���T6���[+��"����=���9����Z��p$��hAV��x��!�N[��`�8��4(3���bvMW������Vc����Q@�5�%G� �-np���[��6R��lL�I�IJ�!���`�x,de����J�)���&�}wj��8s�Ƌ�ԃ/��o��e���v�O��_4���R���)��+b��tؼ D�Y�8�8b��1c��a?U�ִM+����aѤ5wZ)o7������R|㮷�f��ɞy����~�piQd��v' ` �4���W�Ϟ��(ivU�5�&�U�� O5���7�b4W�Cл\i�vz &?_]CO9l��l2N�d���g@-��v� z4!E�!��x1��������C�4NyN�/���	N��<4�N
���l3owg���R����)��^( 0 0�p,	��!,���%�fV�,ٴzW1�R6�Ȃ�� ڬ�
mo��	���:U�p�&��X,�m����7s\w�`�?�c>9����<�]i`��@,W��90�c���\B49����Y�S�z��q�w��Rc��hɌ��)CD������@�wg��'�^S��&Ǜ�<D����"�`F��ǅ���c��4��Ǡ*��~20�M�U̍�e�$U�
�u
d�@ۑ�.���- '�>R��G���_�/�����'a��o߱�cK���{:���a�W�y�����9ޟ��Ic�Qâ���dz)�A��ϋ�;��R�h,�e;�2c)AP2`Kfe�f|�5��°���L�$�b!>�e��d��	��1��e8��#f�N�Ӂ�0�CP��*�X7S
���`O�Im��� �< � ��@̱L�i��ٿ�M�/���{�Ċ�mǠ��1Af�M��c�J	�W�� ','R	Ǡ1H�1��G8��~g��(�]�4q��x�4�P6����N�]�i�F�F�ׇW�S �REQ�0�4�0@4aH8��x�H�����f�c!_md}YX  ���S ���3mր:� g��� X�S�αNk���O�����>o�<��ʇ�|�i9�M�L�>7��Q�*3��:�o�[�?y��!�ssXuA�����c����ïݻ�
�yT��̉`�H�  D   i3�E����9���|_�e�"��	�a8���`�0 Qd��2����at2�`!(@���T��%��!g�CЇs����z�����?�u��� \�1]����m��_�D�#���ʒ���%�o@�:�Ƚ~�3z�����d-(,n2��hW�䈄�F_��	x�i��ޓ�������{㱊��A081@,âhQ�-�9��$!I�Ю)���-�!�]���Ds�"�f`jtW8����옟p���=����'�ߊZv�� �x9�м:�(�����?�?�<]��?������<������7G�k4`�H����4,g~
@Q#�]��1r�3����s��{��0$>FJ�B�Qp�Ap28��;��;��@AX �g� 4�r�cPky_��`i�c+�mv,F>�K�t>��w?�_x����9�������Qx����E��k���7k��c��g�n�x���tk�W����Q�("�_  I[��%�&9LZ�1�:F�f���������\�,�b[q��bhS%�%V���n���\͇��9��y�BC ���hϔ��.3��Z	,@�W*��K��I.N%`�n.RBK��9s�� X���W/z��˕���u*󞿲��O�g��M��ݿ�I�x|�q䚝�����}��ۭw�����sjq6{�y�R�
 � �r`Xh3�d�F�HRSP���4Z<�_v?��'��p(�K ZA�<�g��͗?��I<Ǎn�L����1�Ѱ��{X���>������M9�����9�����bUK�ɥ`B2	р琋 �.�
���Z���<<$����{p���������_׊���+��\jJ/��^��i�RDz��Q��x����^W����X9ݔ�W�M��^���9�#=���|=��z]�fjsUuqM.Yh!F�PH��|�fd�6g �D6���V�d9M��O�>o�9iuy�s3=���#RS�vr���<�[�$,�������H��-<F2Q�yue�zu�{q3������Yp\	,gH@`�	h�6D. ��%�Wlk��ĭ��m-�2��Ͽ��͏号oux�i�6�o�`�
���;����*��K��&Mot�tz�7v#=���[LS��c}�}��J�8´_h~Ľ9dsTC������8�& � %!�x���Lå�y�{Ӟ�-N�/�1���u��]���LI��$ ����XYn_������U��t����:�M:HV�w�N���ˉ�������1��<�1%C��GL�T�v#�К�#����n�<0͚F�v�,.A)�<���ո󧛀GЍ�B���u}N:��\yTV�x"͝[�۞�O_|�b��-^}{��>ޖ�A���L�e���+���O���_7kW.���d�pF	?�q�>�� h�P��nT0I�SJ6y��Ȕ��5�u���t�ط9�)" �H����J�V�H�P
�[�#}�Wr:�����!8U'�L5�Yr��n�������wP㫜��9pL&khu|��O�t�WD츊~6�w�x	�ɑ�9�y��2E��\�� �a�7.���������!�=̋�݌��,���o����|�̩���d�����_�/M����=���#~ێv�l��ʟ�Gx�i�>���a�ӗG(��f o.��a5�47ggXH��Zj��Sm�����+#RD��� �$-E5m&O�����l�8�k~�B�s�$��M:F����@.�=^rDJ��'9��&Ym3�4;�&~���m$�W���.NqAw�J�qX���_rsc5��e|�{�P��)�K����R���4c)��7L�9@h�X-8>Mb���W$�aK���YEғ�sP�V�2����iG2�{��r�����XU请���\�h�|�t�M�	�4Z�tV�����ڥ_�u�����nf=;?l��e3pVu?�B=_��[��������>�^����������v����
����O�:�/�N����6p^ g�60����U���n)�K '���R f� �4j����~�34�e��il�hZXLs�`�Ŕ&5��tJ�XU�k���9�=z��勼��S���Չ!G���ȏ���y��@��}i�>���y��(�_��w[#�!��E�c�80֒	���%+��V�au�|	�����n3��"�L��Z�v=��8[H��e�Fw�)N ~�K�o�S���V����$�ĺ�~�f)_.���p6���ˏ�`8.������iT��2�,{W�Bq�J�f,���8�H�������9�g��9���n��J� ���Υf��!�LDF�u���ξ�O����YC����y�.�-VDW���s$�[�k���fJ������:(�� �i�P��f��7{����m���{�2��06� X�P9t�*,Wk�Ȩr�*��|�3�z���X�(��"o��C��o����I�5�1��:S���𞷇��bkZ{��g����<���������,�=��O�����]���	��P�}J������?z��_d�7�w;��ε���Z�b�'���e\�g�\DtWx�,GS*�?�������7_����G�x������
�)F�"U:���S��09�d�@=錐�R :h=)|d:xe������1��d�����Sy���b��O� �l!Y7gJ��J�3��vw�<h��s�\�
��o���pS�G����f����(I{E�D峞~ß��g���\ɉu�� ��`���t���� �2 @1pR �� P
�k:���������U� !��
ߌr�ϵ�����~�V���mY��#�px(����I�r������N7bi�튕y�O�g��9bt}S�Qy�*�~)�rM帝v\tO��_�Ƨ������x�����>�����_\YF)��u7��+�)�#c�r.��0��G���s���ϧ���&�t���ĺ�����|�,�/�z�Z�/�4Oj+IT �-�9`�:��$����tU�A��C|8�Zm
�)��XWj~�]����?���:���ߦ���J���x���z�� 3`d9���Ň��w���C��S�ӏ���*�iQ�	B�?GB:=��+�꧶8�Β����Į>}�;?w�2��E9���Eow:2w�
�s�K�R��aE|y@ce"�B�����<}�N%������K�����O��*��#@�
��v��>����_6�z��]�O:�H`�36 ��?�K�N�;.�m��#��nq��n������<N��3}Ru������M���O�W���&��s��"o]As�SiP�
��k���ګ�j��p��Q���v��r��=��X�cNp8[��x������qjOs���L��[�>��hR ��J�mt���	��i������`���i��omc������ǋ�y��_�������g��Q�燿�K����NU
h�G���g:<v��P��{�y������^�K���mv�EO:���Y�����~�<���?��$������/��7�l�����������k?����~�V�9����al\�囌1x��4;�<�x���˔�� ��m<��[>�K�v��/b���U~���#<�9�R�"����1�[Trfs�T~�U�w�d�s8û�t��P���W�l2��S\.���w���cFޱĭ]��3������˵.W��A�s=�k**���!��MRf��ND�  ��~^�7��]����M|]�y����?8����V��/ڔ�<����z����/ϱ������n��2)����õ��}��q������.���-r}w#�,�`��7�X��͛��u7�����?���ܧ/k�;c==��o)�ь�nm�����6�[|k��]���߽e�y�A"sFV���I#��t�'�Yd+?�^�ދu��ٗ��kc�
.�Nct����}��~s>m4ȅ\i�~ܔ@���%<��M��.����@�[g��6g�:�G�hd3Lu��M�����?���~�c���#����*�{�D�v4r����պs��l��w�y�%N� �m�)�SvT��Қc!J�}�r��1���rOe��5�����t�vK��.cΗ��<Wj6~t�T.;O���z��R�nBly���8�f�p�����M�i7�Vs�����ȯQ��_,6>��ω+?5����+���J@9q=/aCG��e7K�Wh��Or���k ЕE��w��q��&L_�*S>�_}�w���_��n�?���W����� o�/%�����VSB�Lׂ����<h��4VҸ9$5�J�j��<��&��y�N�\v�V?\�����zȉP�����9�^���⨥���9����ZgNt�p� S���JR㘟��%N<��>�����<-���(�������S��:���7����v?�n�0�Z�  H"x��a	x�- `��R��{�m�G�d��V�5���������o���w��m��<f�=��Hl�������o���zU��Z���ŕ��\���/E}��Mw�?y�y�z�����5_�o��O� R,Z D�GML���_����/[��y�*���K[Y���VD]����o5��~�#������W?�͙B�;�=!nFCH	����+5�^�������d�A���߷�����+ܼ�/�/,��<��9�ɦ����K3�_z���s�����L��MN�������>q��r�`!, �Jr45?�_�ɿ����{�z�g[������� �	�5�y{��L�ϔ�l۠W��mW�W|����{���_�}�I�u��{p��ן.�������k���^m���iӣ�>��a_Vgҿ����7�6��{�v�-߼�y� �  �-��&�HH��]��B�Z�N�������ly��c��-9�Z�!x�>�~��#j�������_��������X8{.��+`�z�	#t��!!$��#���"�~9IU5TR�S�ÿ+��>��Y �S�d�?�ؽ�1j��XF�.8~)Ulux����NVYa�Z�����8䦶@޾�����q�,]�m0�!I�-�v����_������e�H`� Dvi�0�fa��J��NCC$ Ȁ\"�y�6�����q����s��߿�m��_"��&7[��[��������􁯤�__��܃o��K�VO������5��>�껏O��l^r�����;{}��%�����gh����v����E�[ �H%%:wR�Tj¾S뗞>�5n���?|��f�7��]� �E`S���;c}�r~×��7~���9�ww&:���0,/�{���"�h8,�%)�L`s��ɿ��B�tR�E�|y�79�>��8^���b�����u��7-�>ޒ	��ڇ\�� y02�ν���4�Z�`�Huj:�����<�N���[{�A� H ����JQ����?fmc�/2�ԚeZ(N f��}���)����Nﺎ����O�׫@�:����`^}K��Q֗s���?����)̾wf5[������|7#7�SX| � ���A�PJ�b ʁpk��<t�hX۬(��Yz�Æ��#G�b0}��[���]@ �vt�{�{���[��������N+�i�a��G �hT�F�EC �u��e6�pS>/����|s�?Lʧ�q���у�Afr��,5"�H��%  @k ,�b_3L7O�.�ũ��08`ܢL����:����{�A��F����R3#�i�3E��t��"�id,�6ۧn6��3=>is��_o ��a���U�;6�/L�����q���[�f�yr�:|�5�t�\0rҜI٦Ȁ)9H���w�P�@ &U�/�2V�4��*omoۃn�ۻ\i�ߩ��(��)���'��qnE�}�b�_�Q�u_��������wܮ����*�Q���rb����y� E�0�r�&��x�����qj��\vvϐ#E� �&�p��A��lu���2��TlsQ+�\��K� �/4�A�B�WO_�Δ�ֺ�V�`��qky�P���S0�<;d���D�80��bΣE	���4�i]�� �NA�l���`�ׯ��_�^}N=�|�x���M�I%�
�_<�����2Y�Vh��l{�݇7*u��f>����]$�	�9�	Pz�]�@B���IK����`Xo�z9�u�/^>��软c��;<Ө?$am��t?0eX\-�e~�8{sx�<|�w����)s�H��O�0<��2�^^�H��P��e KL%GX�|i���6˳���2�r0���k�j)a�cNIF���ƉyG��P��{�c`\� $  jY��i�;���pr�&\�p��5Rկv�-O���UDPh� e,H��)��\�D#�q�Y�8b�(k�1�U���l�=:�Ҧ��\�y��	H�u@|�"��z�a���4������4��7+w�ke8 l����!��9�%  $�4HT�[������[��(K�4V�c�݇Lָx6#w�� �}�*  o;�l��i�Z��ݞ���ċ/�����:���%MWK���D8��(��Jt�����轓dk�u�v�7����1��5��N�<���V�p�պ��IV���I  S&*�C��������+5�Y۴�`�
(zg_8'��)f�"�R
qp�N���A��{K���/�Md~�31��|��wG6g�fb��;>���,Z ���ejO� �t<� P�A8v@Zj@��M �==�x[��,��5��۞����>��U����s=M��4Ni��������
  "`D`6Mԙ��.Y�K����9/���ױ��������}
Ҏ6>#��	>�A��I�$��:���dd���P�9&+-&�w]-La�n���9B��yO��B�xǔp��i,R�)|dnX R�FH��|�R�H�{�U�|h�D��_�k����r�o�{���Ůi��fҴ���i
X�  ��� @),Z@)�k-� �  ��&��g����a�����f�7^���ï��򩇿[�c����Z  P� ,Z  D c�����'�Ճ�R�ڦ����[p��f6i)�R2���A���p�cK���8���!i)Z�M��"�u��I��9,ĺVFB+�7O��V�cS�c���T�.�-v����LH@�`��)c� eN���_sh��?<����'�^�.W�0�
�E��Z�p��	y<��  �  �s@)�% 	�� Xk�!�R�|m�_�ߞԸ��`ֿ�k��W����0t�Y���;����" (�m�n ���g$T��B�oOn�=9{��TљD���l^Zѵ�h���<�)�"b���&�3��P?�Ex�I�����$B�)�<��:l-Q�Z��r��޹)"4$0)a��K�Z��@h�D�		�8<��ܲ�|�����޼2��W�o.}�� z�ݿ�+de�� � *P�ǁ ��,Z�Zh�� ���4�B߇'�yA��^ �c��/��iu�~�;���J?�����i/��$J%� �����z#���g������ߴ�2���#o�;��&������/����2(���Gq̍��0D$8�w]����'A`1�<��N�]:��uU�B�x�6��0�I)#�FjX`�0��B� R����X�W���/s�x��/�������Q���W�_}��׿3�ذ=>��\k3L`�#	l `�%@ ��L���$�c)WԺ���w�8c�j�R(��+�g�8���o>�jU���j/!{�B	�ւ��X K9��a喨6�~e��`ϻ)��fO�4�
LG��fe� �Vzh�$�$&�������k�m��q��O�~+s�z�j�R�fc���&C���aX x�K
!!@�f,5ׅ�Q?7z�?��  �a�&K�a�Z�b���}ۨm>E��rސ�-�,�
hk90�,=X�c7vb��e;�/��������Q�,v������g��_�Y�vB������5���2)jDm8� �"�Ֆ��:� �@�� Wtח0}�i�^��o�:ow�z;�)��������7OF��&m�u�ZY���o�����3x�������-)ѥ3�zC�f6i�X��<��ϸW���Gw{ݣ����m	�<�0�l�N��ISƲ~�5r�����\�Xn��[=��l����Y��/�lLư@ �`�q-'��f1�*����m�]�:�d�����m8���O�t�_�E'�Ƌ������y	t*U��F�S���9�uKO�7/�$��`)O��n2 ]��U����w��Vv�>��_y�2>�ޏ5�?� �����4����=uj36O_f���"�Z�Z @���Fw�d��Zmv���fu������ܟ��?YD����|�-�����߈i�Ϋᦟ�<怢�
�2#w�H09HH0)'���C��Z�_��%vf��b�{S@m�[ �A��Ny���(��R��E��^�Ѝ�R.�>�{�ܤ�k��j���Tw���i**  ���)µ�0L���$�j��[�v3�'�N2W�ڸ����oz�7�/���DxD�q�\h�Jsɦ��È��
�y��v*�֛3�>7�c0��h^B�
�I�O�ݡ����d)�[2�<-s,�������Y��+�Xy��m���,9	�q)0)r�  �XM�ո��~V���Pm�[�L���T����:����
��R���ύ��Ϳ����ۅ�����&�		,p̭,M���+��s��ȿ���]���S����p�e# ��"0%�04>�p
@���e]^���U!]�~s��-|������Bj+��43t� �m��:-��a$p��o�`>H
БZ��u�����tۘ����޸⋈��+)RZ�o&R�Ϋ��5Ύ~}�q�N(u��/�� L���c�p��G���+�,!%�AS�8	F�Z��j.f����Yv�q\#ݖ�I�a?��<h�]Ԕ_l�*�ߢ����x��˕4�>�$ڞ�H�	��{@��s9k��{nbYK為��\/��_2�����|������3���W���f��7r)o1Ԫ6/��ju2����)<ч˹�,E^���� � X������~r � <@3C�"O�:>�<�َ���=K}�`_˅�1w�]�*W���n�ekX�ePݬ�:�u�����IA�`R��u׹�s|��-�iEƩ�c `a F�������ƾIqRnٗ��M^����aGq^�֏6I���E�0@
�G� HQ) $��Ќ�3���i�#5�:�fj����9}��N��ｪ��%|�W�(m�U������������D�D���4)�O����v���R���g����O����t��c�F&2Xd���`0l�,"�D�4{6����Զ��Z��lKͶP $�!|u�.�V��R
D���C 4o`Y������m���-a��G�A����#⛞9����u���v��U�3����s�w�D#���\oX�\�M��d�����?�K�/�0�$#D�1��8����T[FBJJ�#,��)|��� �  �!��{q���l ������ے�؆!>l��]�¤>�<4l��qq�^�x����ۊ8�G�,���Z-��]�⦵2�tW��ǟ~����q_z���'1n�%-<�R4!A"K�d2�D��nKD���)8v��(I�� �!B�٧1��9���Z@)L
@ �<�5 ����`-p ����-��z�$�Iu�/���,���Y8��S�������x��>'��C}�ԏ	�2e�BvSf�߹k������������Y�	&8�h` B@JC A5��tJ�!D�q��������ȑ��3�Xd���&��؂E(v@�dS�
j0��/X1�t�5E���77h�X|�����FԚi��h�I�$A>�cq,���mb�O�.8�4�%�(��l�Fmz�]��tR�d����3�[
ȋ���I�Q[���
ˁg	�ٻZ�^��P
�R ,�`)��# )��  1�"�LI�" �� LH[�Sбע����J�!!]��(�F�%߅���R>V��F'�w͕ځ#�(��c��P�x!`  @-�1R�8��1r(�FIiq"w��>��� /s,` | Ps   ��% D ��RyZ۔�v,�e����>���<Ы�`�q�aWYVKj��l���@֟(yPr����v�n3 x����b	���	lK���[�$$1J�8���V.)��Lc�]�#��&j����(@��L# ���ۑI�����	Ga�`d02��,� D&���H\  Gb!�X,����SP�Q)  `GϰH h1 ��>�  ���yb/�6{�#F�
�\-q�����&�ov�͋�����KIDۻIӈ��z�-Y	@������DB�������)bEC9��  �	P�d�lNU�K�ߥo�`��L�R��, �M�� C�#% ) ����E�<a�(8  8�$�Ԑ ��.��`)���`krH!0�2 ò�7i  XJv4  4ɓ��   ��l$ېw&�Mn�Sr���)~Y��18/���]&l�x�81��
`����:��3�8%�8Ѳ��Rd�R ,"������dG��R �. �	�@ aՓB���Z�dvx�X x�����  `��� X$���H�	���4}�� �be$$*��00 C��pR �Hl�!0 G �epR\ #Kx` �f�$�� $�@H,� P3    "  � �*��g�0Y�8,�\ă@-XY�/:�,����Ed]`��s��8��nLR�E (1]ƣ6XD PJ�U�1Cx�%T �rȀ�Q�"�N�8��� �0��aG�p �0�.�� �I`"�a���E��H-��Z�Qgh1u��#ȉRS0�"� � $ �f6� 6�`0WB$X���� ���贎c�z�q��MY�]��y��;@.���<ĺ��6(�R ��6� �  �G�[y����- xd`�X AH��H���������2P��;���ȫ�
sكn�ܨ�v�lʩ@�E�۱t���ҋY1�=і��763r��%e&\G�����<4.��h[�\l�h䝀\��)f�d-�����RO�k5�@�X?I馘� X�Z�, *� H@�A
 x�#`�,B�Sz��!g�}�\ �� �����f�Ŕ��0L4�GMǸ��L�Oʈ;�?'�e�Y�j�*Oțox�L���ޑ�Ĥ����E���ٌ�0�r#ȥVFLS�v�����0&���ʵs�u���}+`�q��8��} @0� �@���^# �  f ����ҵHN)�OSk5@����e���TD��Ԡ�0�~�F���G�x:������*�e��`:��qUQ��8�;؝qJ�њ쁉7G���d�+���o�b{����:Qx%/�Ku��kD��''D9-F7��&{�����h���O�j  ��qR �#@& `P�������*9���b�� � �P�@z7l1��Zq���}��r�S5s�5���X"T��ˉjG�
ǼP��fh��c'��?��e���ϓ���iL�E��{^��N�@.Mx��P�X���9�P��#�|��:'=6x�����N]�?��� ��x [�;��)XX$�B+����
 P�O�%LA @ ��$0�����⼜+�
�o56���1#�un`]�P��������7/m���_8
Dt�t����r�H�i�A�9�/]����qx��P�"YQ�4#x-��7F���V!��V��HGHŁ�0  ,�`�\Z!5<G.lƩ���a�s�������F��Mֱ`�D@�(@����Κ��.�?������Np���K�q1G�7{�f�e�~���2��E+*S���7��F �ʐ�8�gx�U��' F�É���%�%��y��ո� @-��|ދ��K�6�����On�1�պ\ݻl��ڟsf �R j�����9���|�I(2|fq"�C|�!8���H�ܟpQ�L�-5�Ef`(=]
D=
��B�0��<�ۍ	pd�\���sV&�C�Qx��,�ʌ�;��\�������� (@) 3$ ���M�Í7>ܘ���י��������&��-�gl�L���b��yXF������ց �bV�2��@#hA�[�X,D�2@�q��3SPP�|���>;�*/�N��Ʋ�O�ùI5Kz_8��㎕�������m��$�`ȁ�� 2�d�?�1�����t��e k�ԩ�V�\{�I���5����⁬d	��U���*D���BY"Tĭ�# p$ T�$.@�Ս�o�pu��bN�F����o�3+��kf���3{���L�� ;%@� l�A��v�h7��]�����#9[?�������9��n�mW1�Q�ǹ���U��n�}b���?����M���G�}�0;4�	rWZMo�  � Ig�������韔o��y���9��˦�e��D�����H�׬qu�N���~Oz�7�� ?L P�֧l|� �rv*��U�m�,�:�[:��I�@X@c)���#�Y�?�ov�8�װ��x�;��0��5	!!!	�3�/B�X@���#n�꺭��,b�������q�[]�����r&H ��#0%6� Kv�p����.$�}�Sy3���k�7џ����G������U�ԟ�L�4��������n������|ew��lF9'W�ϟ=�g�����ez�Y�Z��p�w� �>_��轼�׽���.R2���2��J/9��Y-S�������@=o@�JT��2����[z$�D#��p%敿���y�ep�4j[�f �h��OT;���p���M?�{��"�!�B;f�3�b����mWk�P2�w��t�ݩ�i[�<���,�{=�s��9!0�br�A�dR�r��jZ��W.�9|Y��gJ#gW��iT�ĺ㋫j(V�e�n)ԖL��$��Dm�͙I��`;�̶�hW�~5�_.�&N�۔9i>j�:  �e�/�ʴr�L�Z]�ƅ�̓3γ�����T�|A��ʢ�<4ᶁ��"�a��"�G�,aI)I����H>�6���A�WZ���Ԣ��w/�\�����c � Ji��$��D�*YN���A.-2e`�2��;�@"#	�
����M�#k^��`�u�,Ѧ�v`�
�!D�v����B#�02�!`X!��6`�VrB}�"ԛ��<�H�3-ʜe-��Ӫ� h�I�E���=�cT��njϳ�2}��|9/�7Z��i�HIL��w�g�π]��"���(*	F���� x$��ױ��{@s�^��@u��� O����]�Eie2�wȀ�Ґ���i�z���h|r���Ƥ?��`��g�8���>�����^��"����,�6 ���'4R��N1Mkm���`��,����y��@��H*Ya���p ��8��`���E����[R	CJ`���F���/��-"� ��H� ��r jP3�hAv�ݮh�y���	;�Tr�����,z�0��d��T�>l	��9�Se�## �Z���G�(f����Y��u��+� � �t�#0�2 u�$�lɼRZD;$�@c �m��I�|	4�7������|�m��c�\��P�lZu�l�"JN) d  D H�6��vi$�)D��g7��ޯ��p�� ��Q% .\l��,��!2e� N�	8\�T-��I�����6�h`0~����4��q��p��Sg���bj&T� ��:^
���R �w���o~�|ϓ����آ�R�:N]�@o �-HQ��P��! Z 2���� �@��
�%7"�P�2T�!S�� ) 윹f�U���I���uA�P��k��=��;5�~u��5�yy.�%�m@di����"D� ��Mo{�V����C���M9�o��Lj��i$H��%�c�-���(I$�P���>���y�P�uMj	` � y��E�@�  ��Dm�Ε��������	 �% ���#��� �L��my�t30��S
I�j�
S%��� ",��q����1�n���&��}i7�r�=}�$��ow󘋥1�)�O��[ ����  �D�ýsU��"�n����^�f� �[	�U� �B�q�L&`�:�D^��3�ܐ���V&S����` ��$���$�� �"T �.���:�7�z���`�9� ؒ��f����5� (�6 `��0 d �  ����伮[�e
Je��%��Ѐ���-L������u���Y���Gc�|������ �᩺E������a�D�&)@H&�w�M/MM.��-a�u��)`���o���{����k6�H�,�T�d �,Ks� &H,�E`�؜ ��� &�����䒏�<>v�cfjǗ]� ��E� D��"�[���� � �3���K1�.�@�$2@) DX`��G�(�O/�x�|Kp���_�z�ɟ��9��v~����n Z�l�e�t�H�B�ý�p���������ZIBB�1(I+��Ipx�>沔n,-Ɣ��ĺ�N�f�n4#i[;>��&ny� ��z���ݷ�������3��t�W0��� �=�e�+ �&�b�V���Eo�귟ot{�l!���p?gu��@O��ܝ��˒�g����M���B�}$���R��xՎ�.�O�,x�b�Ջty��z?�~F���+�a�r�B��كG���́`�C��`��V�� ��٣��Y ��d>���|���oy���̑�H���j��u�� Q�QZ�^`�5B���B�L�nO��A�*t�.��.{6��x���fl���������yu�/���}�Ͽ�<�~�;x��>a��XgD�wkY�\F7B��ǔD��k�"��1Z^$��8$R���ws�:+�u	����͢�����r�2�[�������w0Y�͙p���
5[���
G Cg��3�Ѳ,�<4�p�)�<�7@�%� ��o���+J]G4/���oV|�W}t�4��ձ�?���x�x;}^�^��OZfrZfX��Ӹc���d�zh�~���=A7M�_DGCC�5:@iqNiɦ��C߸�D��������������~��i����[T�D�f�0eW�}� +���sB�e)T\7�
1LC	!��3<�7���<&��1�طH^:�i��|���Kד屲�Կg��W��+F�oS�~t4ͷ�lmˮm:�Ü����ő	4"ǔ�K=��aI�0m�$f�i�93keٸ��>�x�F12�<`I��*�i�����Y�4d:{�̩, �DT�,z`�TX�(�#m����,�K�p�7�@�\��U�M����Zvf����f��^q�����'~��IT��E��b��Ӕ�Ӷ�n�=�2K!j���E�A:V]�E��X�0'���:����#���=� T ��r�VY&��&
������bXj��jC�9R.� Y��!I�� �T�������/W���s�0����V��혘.��w�Fe�U��@��-�u� �T	���^Zx4�j��3*�בI�`�#k�{Ӕ`��}�E�R�-w��ԣ�� �(����n�CJm1�:O���A* R%UR%�HmR'�K�<̖���6m<5f���7��)'LIƛ2�sslG��JnSo�(bA*���<�G���e @P9��{�x�y��а`��J kY C��D��gj<P3��'��� 5ނMj�Z�h��|ÓO-����Ӯ,˱f����c!l�[h�_	�6!��;G{Z�h#� H �Gx�u��)HE����ƚME�Gv��r�@bA5ۡ7ei�*����� @�џ�A)���e�����?�?uO�a�_��M�c�Q � P�2�T&��~ do�g����������Z�\lE_|�������_�� ��B�lȹ�;�?�_.����1�e���.��oWUp��r����Σ/�p����Q���7EFI�eH�$� ��mcMZ�o0
T�����r���(�[�-�&�C0D�l �p��Ő�D�DC�7��਄<LgN��b�S��� ɳLf�
��<B��5륻�Y���(�����@�d�r1V^��p*������ ��p  ����e2��\;���d[W�L��˺r�i��Xt�m�� (Q������z��].f�\[k3�) x� 8 .���h�� @ U���\<:}�����<ó#@&�d��}���	%�G�� R@�Gy����B�[L�H0� ��ic�X4����B�G4�	d�I}���p��Q�<2D � �\<:� p�/�֒@�\7� ��*Ȳ,\�`�-Y�mD��e�:��  e�� 8�P�h����z#�VD�Sz��}ώ�g=�3��A�d���%z���`�2 �@OXĠ�s�%�\�Z��Tob�7~�H��u��^ߟ��_�@�����k�!D7L[k=��%�v,�q(7��k�h-�m�.�le݀]$0��FZ��5;(��W�-� �0-Ph�
0�62�Z6�ȔĻ ��[���  4 ��fo�SK0���3 ���� .roګd�2���f1R�F� ���
��~o�����m.��;�V`�2ǪZ�1`�)�!0r��,���@���,$Q�oe'�$����  �8.���uϦ�� 8� �4:B63������ .��P�B���;�V��YhF��l� `ò�����рlP�0�C4����(=h�.Yc"yx�dx .�q����պ-r����A�G�
 @��62 ..��V��m�Qs�
ܺ�1��*F�D.�Ctc�-*l?f�G x��Χ�MV���b"�~������z��f�!\#���c Q�([��l�3��Lb�M( ��Z�f+)y�B��ަ#�#�`�[.@����} #���6���˻ s �g��ut�����m�#=� �0� ��[v�f��-��jQN�R @�.*b���.\)�(l��������3�,���3i��Ѝ	�`��H��@&�����
����6��l�P�g�Z��e_��a�j!9�ۆ�9:��j���������م� 8��f6#�(� �^�s���u� �� �E�Mubr�2
��5�]�9�*M�d��2���d���-��� �H��"��beV� ލ�]� Q.2	�p7��͙6Fi�����~'�~RZ�#�R~�����;@��@��T��v�(����M��0��e�E�����������l�V��9-S6� ��Q�v �\#5�5]z��"�yЪmU9���	�G/����z�����g�: H�� Q�xĸX���M�M���"YMH8 .�ܪ  l� 8�H�ٔ]�u��E���&o*�A �����@zq�@:��τ>�N|$/Z���l�aMuuW����Aȋ5M��d ��(� 3A��u�y%**NM���E]D�#=� ��7�)�ƺZᘧ}���֛]%i�zo�� ��8�8� pH��qv���2{��	�̶��*3 ^��8��?�<�7 �{&B�M���9m�<��A��W*@
� ��L@��(�+�̗9� ���A��i"c��k�jt�V
b�B�� ��(*]+�8 ��-� p�s�\ P��6�/ǽ�����֜I��2	�� D�U����������<{�4>'+.{�*Ci�T3��Ĕ`���
��w@��4�/���nW�'�g�1��	$�����#@�F�;�?7@J��)N1jvx��@˚K�  G�v!
��B�"R�##�s�ϫc��X���fQ8���+��
�ӵ��)� �`lI&PT��g�mZ��=�02}-�r���k�K�+s�N���y�{��A4�5іMC�EmU,�v��7J8M���
~�ĩo�������6�U����O�����0#�Ba��^�W_�z���gs_�E���҄GP"��hQ%���Ad�H5�m�&J4��������gӊn��*Em\�F��2	=��@bb�rmc�=�;�S��Џ0�D�]z~���N��~�����<w1z�C�>�Lg������>]b,��ޕ+ ��B&�H`�������ڲ�Y3v�e�����7�֏�.L3<�C$8�;9�L�^x��_v��J������c��o#/?�O�ً�+�|�/�FZ��1��=Uu� <<jt���,����sO��hX���^/�09�N�� (���b(�(�H@�嫼�Y.BH�������>�XU�h����\�p��l�ϼ̿��x�K˝��㧜Zb���`� a��f��|�#)�o�s]�\�MS���a^�~�T�w�{��������g`�HM:2U�9T�F?�q��B{��c��[�|��v����?�_��'�]"��p'�m��*t9�>S`������k��S���Eu|����G�����h��/{�R�6��#E��A��62����#@h3�~^+�#`��|����
/������P�s��#�#�w�����gb��x�|��#��S��������ul=��r���>g<&����c�Ϸa�����oL/�r�J4��W�če p`�K���*����x�bSV0*����pof-�E�1��ɡD�?��]�O.�.8"3P�@"R�߸��m���?�=Y_�/NxaV����ޕAԳl��T&k�i$X4��/z��l�mE�����K�,�/���,�E��k�5�r5e����ჽ<J*K��IGP��FȜ�t�I�lZ`0�#���EzY�f4�"3f4�IT$`�g ����̝)���H$��lqt�2�X�lZ��J�%�7��Y���[� Q�m\�+.j[���T��Gd��	�"�Z��HF6CA���C�0���;}f{|q��i>�K�����"2�qƤ��y��U�L��$�f�F�2���H�z�
b=��W�^�_>5��}���c����)�����V�_9l]�0g���u,�|*J�85�d�3-R_����rF\v���=7_������v�[Q:d� )��� ǡ��N�2D� �nu,K�\�
 ����=EWYY��e!5�PXQ��`n���p���%O��**% -E3���c��>��t���6kj2�t������i6>]5l��+08���p�G.�� ����B��$ؚ�:�=ё�� H%��*�T(��
e���Փ����IЫ���O��w�=o������z�¶i0��/z5���E6u}WtzU�*�d�^t����r����4�>�������}�����������'��T�٦�uJ�Y#� �C 	xM�6�l��t�H�HB+��V�:Z��\�P��q�u%(�Xr��䄓���ds�t����?�<Wvl}n���.[���JQ��E�-�.=11y�aƮ���塷����x���}��s����Q�G�|�Q|����tJ80��EBo}��}���δ�;��G�Χ�I�4���s��j&k�u�	DY�T�'Td�@������ǆ���}������L���!����s��9���n�$���k��9)i�9�V��	h%J3E�7��C�������O�����}���ʳec3��lk�7-�w��y<�e]5�va,������4sծ�����=Ztp �n�̈́�B�2�M���2���T[�,�Ş������믾}��~�DS�?�ev�%�ܷZ���>�;��q��c6�v@o�L����������8����q�n��j8p`�Ia�/ϫ%����l~��~���p��a�o=ٗ���I%�>�=ŒC�ͼ��-Sk5i�hU�z<�� O�G�=��
��w������˥�'Ww=��r�fk��Cfx��������w=�'�7Ҙ�5��a\�8�͞����<��T���ņg�n_���92�>Ⱟ����>�"�?ի��W�_2|2�����������0<���X�zi�b&� 7��e>�+Ϗ���~�ɏ�<η�ٽ�#��(E�kvIX�k_{�w^\ܿ�\�?�;t,9�8c�$Ɋ�c�&�c.Tp�Ƴ|��2����p�#��?���>T�k"`\%)��ϋ,���G,�'i��^�ƣ$���]۾�^x�%޼�M/zb�fLs4�Heh.x��1�&2S�f� ����;��Ѝ�1�����Jɏ���������)px���iM=��3Rόƨi�w�؃�An ��0za%Ϲ�Z��]�߆q֓×��ի��/1����  0Rֳ�C  A`���!G�H�Q��!�TA! *�����' �Ys��6͐�*\
��8p�J͂=z�h�@��c���o\����Y1l�Bb,4�E�Y��n!��C��"�9acp5�M`�j�q��aʡQb��LJ�r�;{��o���ِñ`�K��%~xP�b��M�m�EL�3�Cd��T<��j��!� ?Au�	2���B���~c���}�RZ&Us�Z�&M�ϐ�&bY5ƒ �X�b"�0,���1,��
(B��`8=�P� �#(�����аb`�bc�쌞�(ǀ  T�=kZ"F�;���o~x�'��� \ ��16����jI�5�ۏ-��K�l:���ȔY�J!�T�L0{�$�Ю����\�Z����k�l��Y�_��Ȝr?w��4���+��]rbf`�� �K��k�v6��;��*1���	�%}U����W�ݼ��K��^uУ��B �0E"����`0`�p!Р�'�t8��2FƁL��.�F^�(��$2眱�#�`��u�L�l3��A�Y0��\:�[�UMe,8)�E��|6N�%ؒ�7�X���kI���Y zk�Cf*a�b[:>8�"2����G�{N���� ׌�Ab�2�w�D�/�m�OS��g��{����V�g���.�	z�[�{���;C͔"V�D��L����p�0�	� E� �  ��` G�P�i@& 5@�3�8���Z��ac ==2KZ���psF%`Bd��CCK����b����<Ab$$Mr$0:��ly'L���[�BC�1:�<1�~Ɛ��S4���=\��Z �<��m�	<����o���/�٫�:�W�x�!�m��}�� ��,�@��**�m�/"a+L8._I{p�?/>³)#��0$��e��1�RF�Xa���GY6��#��!� p�x�;ls�9�Ԭ�LY�q�����iÇ��x�p��n`$9 8�)(��!f1["M���Z�IAK�a qkD@F�7 ��  ��1�o���Y.1e:�qq�<~��}�g@@ a�l��N0��5��p^cw�{�,��|O�9�$�Ƃ�"��C�Z
t0BL�2-�B@ <t�f�m
�0 $��h��[G)Ί��p̒{�̧�Ϸ��
1�N>�v�e$R�H�va1Uޢ;��HyOA@�Ew�@@F�7   �-��8�{�����c(�C��E`����p�p��Z�y��zܩ���Y/�T�O���]��$�;�HJ�8X�6�L���2@�� p����D��i�Pj��?D"P�B(JD�5K���j�������l��&ŁӰWF��I09'1<d���n�T�lz����&�e��t �<�' �s�����1m���q5P�(qG A 2a�g9ݏ��k��[��l(�l�bjB��*f��Vx�;'���qs�\ɧ��z~A��h��
BÐ�C�TgdL9�آe���9��N
�BOKKKOaΌ����~�c�;U�$��lK�-��T`F�	�0+#� 
� �)�a5�k"]KG	�Q�^S�4�i��G�zб��)8J@����LҚ.@ 	|�����#�a�/1���7KV[,iGd1����.�iX��� P� U&�&
	 8�ck"�R:"g�����˩�E	�DР���=g�W,x�7P*`�FE��X���k�l��|/��2�T �q��`�S��(Z��(�i�Q�A6`T�P'w�e2X�F,iY��H{�7n��|��7'�'>L���Ä���/�j�B&c���Q3�o2K:4\qE�;ҷ�;�>~陻��5�ɱK񈮗Э�! ��`�`�� `�q���i��)$~p@
�O*��^-����S��O����O�Y^ j�D�"!�B?�˭��X��{��|�O�~���� �Qw��_�%�ftkڈ@�5�o�" @#���D$(׌w�`�:
�0-4AVLA����$�`�﷯K^�e64G|���D�3�۞��t|��͇��5�V��B�G���NV;��%a*�� �@	
�TH�2DR���k( @`�`Fdx)d�K�҂���
��x�W��q��$bdA��F�U���v�6�����
( (D ���
�AъP�0@�ѧx�����Nɒ
���$M:f*���>LQ�E�P#(* &+ j�'R%G "��Э6L��u��"�q
p@���� �<�! p�G�T���
!M8N�h�'�F�u��{�@��h�J  Ӡ+u��@@� �X�3  lF9�R� P�[i�
g{40bEiR����o       [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://kvn4viwmra1o"
path="res://.godot/imported/thomas_simpson.jpg-149551adc74ac46570227c1d1e9325be.ctex"
metadata={
"vram_texture": false
}
       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_b0sii �          PackedScene          	         names "         x1    visible    points    width    default_color    Line2D    num 	   modulate    offset_right    offset_bottom    size_flags_vertical    horizontal_alignment    Label    	   variants              %        zC  .�  zC  .C      @                 �?     �A     �A                   node_count             nodes         ��������       ����                                              ����               	      
                      conn_count              conns               node_paths              editable_instances              version             RSRC         [remap]

path="res://.godot/exported/133200997/export-d66a3da3b8ec144889278b6de27afb4c-plot_sint.scn"
          [remap]

path="res://.godot/exported/133200997/export-c730f3ea937bb34a93f20155d0283d37-single_plot.scn"
        [remap]

path="res://.godot/exported/133200997/export-7cf3fd67ad9f55210191d77b582b8209-default_env.res"
        [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-7905911576ce011749a6dbe7433f5ff8-y_line.scn"
             [remap]

path="res://.godot/exported/133200997/export-3177379b55bf14c4233e71c5d79c0d0a-x_line.scn"
             list=Array[Dictionary]([{
"base": &"Control",
"class": &"Graph2D",
"icon": "res://addons/graph_2d/graph_2d.svg",
"language": &"GDScript",
"path": "res://addons/graph_2d/graph_2d.gd"
}, {
"base": &"Control",
"class": &"LinePlot",
"icon": "",
"language": &"GDScript",
"path": "res://addons/graph_2d/custom_nodes/plot_2d.gd"
}])
          �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�          ��@;��s"   res://addons/graph_2d/graph_2d.svg~ȷQ�;bc%   res://docs/index.apple-touch-icon.png �M~���T   res://docs/index.icon.png�|*��'?   res://docs/index.png?�n3%�^y   res://examples/plot_sint.tscn������2   res://examples/single_plot.tscnt(κ }   res://3_8.jpgr�婩�<{   res://default_env.tres���Ş�W   res://icon.png��Wh>�$   res://icon.svg ���y�   res://icon_2.png���s�s�L   res://main.tscn��ܲ*�Z
   res://thomas_simpson.jpg4�0� �)   res://x_line.tscn������-   res://y_line.tscn�
�>u@   res://y_line.tscn   ECFG      application/config/name$         Calculadora - Simpson 3/8      application/run/main_scene         res://main.tscn    application/config/features   "         4.1    application/config/icon         res://icon_2.png"   display/window/size/viewport_width      �  #   display/window/size/viewport_height      �     display/window/stretch/mode         canvas_items#   display/window/handheld/orientation            editor_plugins/enabled0   "      !   res://addons/graph_2d/plugin.cfg    +   gui/common/drop_mouse_on_gui_input_disabled         )   physics/common/enable_pause_aware_picking         #   rendering/renderer/rendering_method         mobile  2   rendering/environment/defaults/default_environment          res://default_env.tres  $   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc                   