GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex@      �      &�y���ڞu;>��.p<   res://.import/icon.svg-218a8f2b3041327d8a5756f3a245f83b.stex�      *      ��y��>�-g�a����4   res://addons/coi_serviceworker/coi_export_plugin.gd �      �      �����.o���d`][�E,   res://addons/coi_serviceworker/coi_plugin.gd       a      k`f�w�OvPN����<%   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://icon.png   =      �      G1?��z�c��vN��   res://icon.png.import          �      ��fe��6�B��^ U�   res://icon.svg.import    +      �      ���q���ܪ��>�/   res://main.gd.remap  =             ֤�\n�������Dݮ�   res://main.gdc  �-      �      ߗ:�-�#J��lM��   res://main.tscn `6      �      ���v��?�O�6��   res://project.binaryJ            =�(�sΗ�D���U@tool
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
               [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              GDST�   �              WEBPRIFF  WEBPVP8L�  /������!"2�H���q����V^)~��4����#d���I�\���A���,��H�m;�?&�R��{�H�w�޽ׁ$I�#Uء���VU�	NZ+ȑ$˩���zN���B.����x@��흓��F�������m�^H�~Y�{l۶g�te�;6ֶm۶�Q�H��y�R��ض�$��H�#]a'v+` ٶ�����''%1`K��2���F�"�y8����op�����bC��1���;����Kt�{\?E�%D�R�[�n�V�b-Dg�A0$�ѹ����IU�
LҮ1�0��e�MJ�!�����h(��[6�Z�䄻�i�m��*�J�7U�+L�]�t�U�I�f�-���	7��Oȕ̘O{9᪲G�F
�KP.�K�r%S�N��T�(��c�h{�r�C�dΛ*�����c�x)�\ɠ�ҏ�>�a�au,5*X�B�0���*D!���K�dұ'��e�2�MG��)���;�>+�3�JF��I9�>e��*S-
p��U�k��\���+�J�`�TA)!�Jf%��e8*11��\<zh�?����C��U���f�tsS�?a������}�<
?K,3L�?�"���r����v�	K�Li����ӧ�i/��S)-S-b󶡽���e-&r[����[|ښ�\N�tOX�3G���alH��j4WBJ�bD��b�����9�U=f��M� M�7L���i��1�����Dn+��<%�i����Y㼫�s�/�Uйp�S�]P�t/��ނ",5�p��FӬUNe���$0�}'���(R��!�԰)k1�)�hDJL����F�Ĥ������-")<L��H���C	�Wl��-DnkXЩH����u�r\Щ ��&�'��f�K�
��rϱ֙�A����n��S��\7�⺫i�JX2$3����U�wY2|(��%;�##X�lu��֞���U�K�S"aɠ4�1bWqɑi�vu	���Z(�CA[:�Z�OEBb�>0,n!�]�Y�wV�D���_�@�J�#�5� ;�4����O-aIҔ�Dn+v�ɚ�������HX�V����J���LX�8��"|W�e2'&oDț��%�"XK9W2[ E�C
Y��	;$�6�^�d8˫�q�:��s�(���|(=�Q�!'��G����3�T8�D�]s�7�WM7��zhH�E�(l_��\(�S�Z��wҞ��4;����]��h����aχr��iW=.�խ�w�?T�������������Ty���3���c?��o���wzmr���	�8�Ю���fg� �B���w�lp,[
f��H�C�T��<hQ8��8�x)�[�k�[_�hS������R��ġ�u�'@���k.r����-�"+�*��
P����X8�v�u�i�����(p!V7�C<���RX&Ɖ��v"+�O��7A���*y@��~)o�����o>K[�x�xD@��P!�<�v��`�?����/+q1|:���P����z(PC��x���VG�Od%������|+/^���Ь��G�F\�ΆJ�B�����(p9�߫��XÀS���EX�����e���"b?P���D�
w&T2��\'�@��N�}K�7 �B"n���`������@�S:&��\�(�.0�;Q��r`<������������� �ea	�\�(pp���nr��V����S@j�D��=��^�R�Q_(���E��'����:��H`Vw��7	��?��� �l}��4�2Ҟ���c`q 1�E�4�e�Q�������>S�g�@���sZ۟�B���؏	K�׏�|� ���9�w��s�J)\��z���R"Z��y|��z}}E����P�'�x�WҼM�%@��F��էV����K���A�2���Y�����+n��%��5���A`R�՝ꦹ��D��)�*?Y����E�g�nt�!kn�7�?h�}�{h�.���<YdQe&V�;��O~���/O��7���<��v͠��g.;�ݑyu.T7�����w���|�����y)ޞ��mn�*���~yy����~����Y&������Z������6��ϯۋ����OD�g�C�{����fg�7nN,�Kq~g�����2_�+�l�(�!W�������/��w�?�qbU�7��a؞;�Mu�����O�7n�ü8�k��q�|)o��e1�6��3|!;K��}yy��f`��>�������}��H��D��M|�.wd�y f����Ze�������R�%n�`���:�֣-�Ȁ�`���lik�E��&X�x��\�yJ�uj��;���-���Nx� ��=l�zr����Q�hu�'r�S��ߟ�������p�u#����bߤ��k{Ӡ��+�ky�p�����v�-ްoҞX"q=��^__?�n�>gUQ�A��--葽:�04���s{�K����a)a'��M+��K_��?4�̩���:)��[8�w�����٬�R�ݺ�Ď�Ey&PW�����������ku��={M64lϘ^ck����������>9}��}_M���:�,ع��o�lת�W�h6չp�懞��*�nm��r)�]��q�v=��&{=M[����tҖ�uGX�*)�1չN;���͚���*Wz6�����z�����qjfW7�O_�ެ�O��$����I��z��~>�{��A�S��N�/��x�a��ߞ�ݑ�Z�7�[�����țY��/B��W]:x(�0�[H�����&-D�B��6J�1H{���Di�R������/������K���g�O�wU�k�v�ϯt]b�ٟ�o�q>��2s�W�n�����Jw�X�!��T�<�-��!#vuRlrg����R�b����rΝ�I���U���n�^Ck)�N:�P���ؼ���Ф&s5d.�������Aؾ
=������6�:���/%U�J�TB,�\�*s�X8�C�z��ԋ�i87G�z&�\Ϥ�����	�O�I>�Sb�1v��S덽�d�E�#�kQBt*���"�S��Ӱ��#~�Ft��r:�\N��Ktk>�G�&�z3�=nf (&� ��?�,ۙ:�e���b���e��G��J��C���^Jqۣ&�0d���[��J��g�j�+��Js�����%��[�{�ZwK�-�S��4f��Omr�[�Sӧ��Dtk��*g+�� Hk!:K���X�3�SS�v�X�XB�D>���;��@�D簀���S�#QB9Ϻ�[      [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.svg-218a8f2b3041327d8a5756f3a245f83b.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.svg"
dest_files=[ "res://.import/icon.svg-218a8f2b3041327d8a5756f3a245f83b.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              GDSC   !      E   �     ������ڶ   ���������ض�   ���������ض�   ����   �����϶�   �������Ŷ���   ����׶��   ��������Ӷ��   ���߶���   ߶��   �����޶�   �����¶�   ж��   ��ն   ζ��   ���ٶ���   ����Ӷ��   ��Ŷ   ������Ӷ   �����������������Ҷ�   ������ض   ׶��   ������Ӷ   ���¶���   Զ��   ������Ӷ   ض��   ������Ӷ   ޶��   ��������Ӷ��   �����¶�   �������ض���   �����������ض���         
   1234567890        x         *         ^         err                                                                                     	      
                "      #      .      5      ?      U      `      k      r      }      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &     '     (     )   $  *   (  +   ,  ,   2  -   :  .   E  /   Q  0   T  1   _  2   k  3   o  4   s  5   |  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   3YY;�  �  T�  PQYYY0�  PQV�  -YYYY0�  P�  QV�  -YY0�  P�  V�  QX�  V�  ;�	  V�  �  *�	  	�  T�
  PQV�  &P�  L�	  M�  QP�  L�	  M�  QV�  �  �  T�  P�	  R�  Q�  &P�  L�	  M�  QV�  �  L�	  M�  �  �  �  T�  P�	  R�  Q�  �	  �  .�  YY0�  P�  V�  R�  V�  QX�  V�  ;�  V�  �  P�  Q�  �  T�  P�  RL�  MQ�  ;�  V�  �  T�  PL�  MQ�  &�  T�  PQV�  .�  �  (V�  �?  P�  Q�  .�  YY0�  P�  V�  QX�  V�  ;�  V�  �  PW�  T�  Q�  ;�  V�  �  PW�  T�  Q�  ;�  V�  �  PW�  T�  Q�  ;�  V�  P�  �  Q�  �  ;�  V�  �  P�  R�  Q�  �?  P�  P�  R�  QQ�  �  �  �  �  �  *�  �  V�  &�  �  �  V�  �  �	  �  P�  R�  Q�  �?  P�	  �  P�  R�  QQ�  (V�  �  �  �  P�  R�  Q�  �?  P�  �  P�  R�  QQ�  �  �  �  �  �  �  �  P�  R�  Q�  �?  P�  P�  R�  QQ�  .�  P�  �  �
  QYY0�  PQV�  W�  T�  �>  P�  PW�  T�  QQYYYY0�   PQV�  ;�  V�  �  PW�  T�  Q�  &�  �  �  V�  �  �  P�  �  Q�  &�  �  V�  �  �  �  W�  T�  �>  P�  QY`    [gd_scene load_steps=2 format=2]

[ext_resource path="res://main.gd" type="Script" id=1]

[node name="Control" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
margin_left = 96.0
margin_top = 120.0
margin_right = 96.0
margin_bottom = 120.0
script = ExtResource( 1 )

[node name="function" type="LineEdit" parent="."]
margin_left = 100.0
margin_top = 58.0
margin_right = 407.0
margin_bottom = 82.0
text = "1/x"

[node name="a_value" type="LineEdit" parent="."]
margin_left = 113.0
margin_top = 91.0
margin_right = 171.0
margin_bottom = 115.0
text = "1"

[node name="Label" type="Label" parent="a_value"]
margin_left = -17.0
margin_top = 6.0
margin_right = 23.0
margin_bottom = 20.0
text = "a:"

[node name="b_value" type="LineEdit" parent="."]
margin_left = 114.0
margin_top = 126.0
margin_right = 172.0
margin_bottom = 150.0
text = "2"

[node name="Label" type="Label" parent="b_value"]
margin_left = -17.0
margin_top = 6.0
margin_right = 23.0
margin_bottom = 20.0
text = "b:"

[node name="n_value" type="LineEdit" parent="."]
margin_left = 114.0
margin_top = 163.0
margin_right = 172.0
margin_bottom = 187.0
text = "3"

[node name="Label" type="Label" parent="n_value"]
margin_left = -17.0
margin_top = 6.0
margin_right = 23.0
margin_bottom = 20.0
text = "n:"

[node name="Button" type="Button" parent="."]
margin_left = 97.0
margin_top = 206.0
margin_right = 147.0
margin_bottom = 226.0
text = "calcular"

[node name="Output" type="Label" parent="."]
margin_left = 195.0
margin_top = 170.0
margin_right = 235.0
margin_bottom = 184.0

[connection signal="focus_exited" from="n_value" to="." method="n_correction"]
[connection signal="pressed" from="Button" to="." method="calculate"]
     [remap]

path="res://main.gdc"
 �PNG
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
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG	      application/config/name      	   Metodos 3      application/run/main_scene         res://main.tscn    application/config/icon         res://icon.png  +   gui/common/drop_mouse_on_gui_input_disabled         )   physics/common/enable_pause_aware_picking         $   rendering/quality/driver/driver_name         GLES2   %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres          