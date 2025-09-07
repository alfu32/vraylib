@[translated]
module main

struct Vector2 {
	x f32
	y f32
}

struct Vector3 {
	x f32
	y f32
	z f32
}

struct Vector4 {
	x f32
	y f32
	z f32
	w f32
}

type Quaternion = Vector4

struct Matrix {
	m0  f32
	m4  f32
	m8  f32
	m12 f32
	m1  f32
	m5  f32
	m9  f32
	m13 f32
	m2  f32
	m6  f32
	m10 f32
	m14 f32
	m3  f32
	m7  f32
	m11 f32
	m15 f32
}

struct Color {
	r u8
	g u8
	b u8
	a u8
}

struct Rectangle {
	x      f32
	y      f32
	width  f32
	height f32
}

struct Image {
	data    voidptr
	width   int
	height  int
	mipmaps int
	format  int
}

struct Texture {
	id      u32
	width   int
	height  int
	mipmaps int
	format  int
}

type Texture2D = Texture
type TextureCubemap = Texture

struct RenderTexture {
	id      u32
	texture Texture
	depth   Texture
}

type RenderTexture2D = RenderTexture

struct NPatchInfo {
	source Rectangle
	left   int
	top    int
	right  int
	bottom int
	layout int
}

struct GlyphInfo {
	value    int
	offsetX  int
	offsetY  int
	advanceX int
	image    Image
}

struct Font {
	baseSize     int
	glyphCount   int
	glyphPadding int
	texture      Texture2D
	recs         &Rectangle
	glyphs       &GlyphInfo
}

struct Camera3D {
	position   Vector3
	target     Vector3
	up         Vector3
	fovy       f32
	projection int
}

struct Camera2D {
	offset   Vector2
	target   Vector2
	rotation f32
	zoom     f32
}

struct Mesh {
	vertexCount   int
	triangleCount int
	vertices      &f32
	texcoords     &f32
	texcoords2    &f32
	normals       &f32
	tangents      &f32
	colors        &u8
	indices       &u16
	animVertices  &f32
	animNormals   &f32
	boneIds       &u8
	boneWeights   &f32
	vaoId         u32
	vboId         &u32
}

struct Shader {
	id   u32
	locs &int
}

struct MaterialMap {
	texture Texture2D
	color   Color
	value   f32
}

struct Material {
	shader Shader
	maps   &MaterialMap
	params [4]f32
}

struct Transform {
	translation Vector3
	rotation    Quaternion
	scale       Vector3
}

struct BoneInfo {
	name   [32]i8
	parent int
}

struct Model {
	transform     Matrix
	meshCount     int
	materialCount int
	meshes        &Mesh
	materials     &Material
	meshMaterial  &int
	boneCount     int
	bones         &BoneInfo
	bindPose      &Transform
}

struct ModelAnimation {
	boneCount  int
	frameCount int
	bones      &BoneInfo
	framePoses &&Transform
}

struct Ray {
	position  Vector3
	direction Vector3
}

struct RayCollision {
	hit      bool
	distance f32
	point    Vector3
	normal   Vector3
}

struct BoundingBox {
	min Vector3
	max Vector3
}

struct Wave {
	frameCount u32
	sampleRate u32
	sampleSize u32
	channels   u32
	data       voidptr
}

struct AudioStream {
	buffer     &RAudioBuffer
	processor  &RAudioProcessor
	sampleRate u32
	sampleSize u32
	channels   u32
}

struct Sound {
	stream     AudioStream
	frameCount u32
}

struct Music {
	stream     AudioStream
	frameCount u32
	looping    bool
	ctxType    int
	ctxData    voidptr
}

struct VrDeviceInfo {
	hResolution            int
	vResolution            int
	hScreenSize            f32
	vScreenSize            f32
	vScreenCenter          f32
	eyeToScreenDistance    f32
	lensSeparationDistance f32
	interpupillaryDistance f32
	lensDistortionValues   [4]f32
	chromaAbCorrection     [4]f32
}

struct VrStereoConfig {
	projection        [2]Matrix
	viewOffset        [2]Matrix
	leftLensCenter    [2]f32
	rightLensCenter   [2]f32
	leftScreenCenter  [2]f32
	rightScreenCenter [2]f32
	scale             [2]f32
	scaleIn           [2]f32
}

struct FilePathList {
	capacity u32
	count    u32
	paths    &&u8
}

enum ConfigFlags {
	flag_vsync_hint               = 64
	flag_fullscreen_mode          = 2
	flag_window_resizable         = 4
	flag_window_undecorated       = 8
	flag_window_hidden            = 128
	flag_window_minimized         = 512
	flag_window_maximized         = 1024
	flag_window_unfocused         = 2048
	flag_window_topmost           = 4096
	flag_window_always_run        = 256
	flag_window_transparent       = 16
	flag_window_highdpi           = 8192
	flag_window_mouse_passthrough = 16384
	flag_msaa_4x_hint             = 32
	flag_interlaced_hint          = 65536
}

enum TraceLogLevel {
	log_all = 0
	log_trace
	log_debug
	log_info
	log_warning
	log_error
	log_fatal
	log_none
}

enum KeyboardKey {
	key_null          = 0
	key_apostrophe    = 39
	key_comma         = 44
	key_minus         = 45
	key_period        = 46
	key_slash         = 47
	key_zero          = 48
	key_one           = 49
	key_two           = 50
	key_three         = 51
	key_four          = 52
	key_five          = 53
	key_six           = 54
	key_seven         = 55
	key_eight         = 56
	key_nine          = 57
	key_semicolon     = 59
	key_equal         = 61
	key_a             = 65
	key_b             = 66
	key_c             = 67
	key_d             = 68
	key_e             = 69
	key_f             = 70
	key_g             = 71
	key_h             = 72
	key_i             = 73
	key_j             = 74
	key_k             = 75
	key_l             = 76
	key_m             = 77
	key_n             = 78
	key_o             = 79
	key_p             = 80
	key_q             = 81
	key_r             = 82
	key_s             = 83
	key_t             = 84
	key_u             = 85
	key_v             = 86
	key_w             = 87
	key_x             = 88
	key_y             = 89
	key_z             = 90
	key_left_bracket  = 91
	key_backslash     = 92
	key_right_bracket = 93
	key_grave         = 96
	key_space         = 32
	key_escape        = 256
	key_enter         = 257
	key_tab           = 258
	key_backspace     = 259
	key_insert        = 260
	key_delete        = 261
	key_right         = 262
	key_left          = 263
	key_down          = 264
	key_up            = 265
	key_page_up       = 266
	key_page_down     = 267
	key_home          = 268
	key_end           = 269
	key_caps_lock     = 280
	key_scroll_lock   = 281
	key_num_lock      = 282
	key_print_screen  = 283
	key_pause         = 284
	key_f1            = 290
	key_f2            = 291
	key_f3            = 292
	key_f4            = 293
	key_f5            = 294
	key_f6            = 295
	key_f7            = 296
	key_f8            = 297
	key_f9            = 298
	key_f10           = 299
	key_f11           = 300
	key_f12           = 301
	key_left_shift    = 340
	key_left_control  = 341
	key_left_alt      = 342
	key_left_super    = 343
	key_right_shift   = 344
	key_right_control = 345
	key_right_alt     = 346
	key_right_super   = 347
	key_kb_menu       = 348
	key_kp_0          = 320
	key_kp_1          = 321
	key_kp_2          = 322
	key_kp_3          = 323
	key_kp_4          = 324
	key_kp_5          = 325
	key_kp_6          = 326
	key_kp_7          = 327
	key_kp_8          = 328
	key_kp_9          = 329
	key_kp_decimal    = 330
	key_kp_divide     = 331
	key_kp_multiply   = 332
	key_kp_subtract   = 333
	key_kp_add        = 334
	key_kp_enter      = 335
	key_kp_equal      = 336
	key_back          = 4
	key_menu          = 82
	key_volume_up     = 24
	key_volume_down   = 25
}

enum MouseButton {
	mouse_button_left    = 0
	mouse_button_right   = 1
	mouse_button_middle  = 2
	mouse_button_side    = 3
	mouse_button_extra   = 4
	mouse_button_forward = 5
	mouse_button_back    = 6
}

enum MouseCursor {
	mouse_cursor_default       = 0
	mouse_cursor_arrow         = 1
	mouse_cursor_ibeam         = 2
	mouse_cursor_crosshair     = 3
	mouse_cursor_pointing_hand = 4
	mouse_cursor_resize_ew     = 5
	mouse_cursor_resize_ns     = 6
	mouse_cursor_resize_nwse   = 7
	mouse_cursor_resize_nesw   = 8
	mouse_cursor_resize_all    = 9
	mouse_cursor_not_allowed   = 10
}

enum GamepadButton {
	gamepad_button_unknown = 0
	gamepad_button_left_face_up
	gamepad_button_left_face_right
	gamepad_button_left_face_down
	gamepad_button_left_face_left
	gamepad_button_right_face_up
	gamepad_button_right_face_right
	gamepad_button_right_face_down
	gamepad_button_right_face_left
	gamepad_button_left_trigger_1
	gamepad_button_left_trigger_2
	gamepad_button_right_trigger_1
	gamepad_button_right_trigger_2
	gamepad_button_middle_left
	gamepad_button_middle
	gamepad_button_middle_right
	gamepad_button_left_thumb
	gamepad_button_right_thumb
}

enum GamepadAxis {
	gamepad_axis_left_x        = 0
	gamepad_axis_left_y        = 1
	gamepad_axis_right_x       = 2
	gamepad_axis_right_y       = 3
	gamepad_axis_left_trigger  = 4
	gamepad_axis_right_trigger = 5
}

enum MaterialMapIndex {
	material_map_albedo = 0
	material_map_metalness
	material_map_normal
	material_map_roughness
	material_map_occlusion
	material_map_emission
	material_map_height
	material_map_cubemap
	material_map_irradiance
	material_map_prefilter
	material_map_brdf
}

enum ShaderLocationIndex {
	shader_loc_vertex_position = 0
	shader_loc_vertex_texcoord01
	shader_loc_vertex_texcoord02
	shader_loc_vertex_normal
	shader_loc_vertex_tangent
	shader_loc_vertex_color
	shader_loc_matrix_mvp
	shader_loc_matrix_view
	shader_loc_matrix_projection
	shader_loc_matrix_model
	shader_loc_matrix_normal
	shader_loc_vector_view
	shader_loc_color_diffuse
	shader_loc_color_specular
	shader_loc_color_ambient
	shader_loc_map_albedo
	shader_loc_map_metalness
	shader_loc_map_normal
	shader_loc_map_roughness
	shader_loc_map_occlusion
	shader_loc_map_emission
	shader_loc_map_height
	shader_loc_map_cubemap
	shader_loc_map_irradiance
	shader_loc_map_prefilter
	shader_loc_map_brdf
}

enum ShaderUniformDataType {
	shader_uniform_float = 0
	shader_uniform_vec2
	shader_uniform_vec3
	shader_uniform_vec4
	shader_uniform_int
	shader_uniform_ivec2
	shader_uniform_ivec3
	shader_uniform_ivec4
	shader_uniform_sampler2d
}

enum ShaderAttributeDataType {
	shader_attrib_float = 0
	shader_attrib_vec2
	shader_attrib_vec3
	shader_attrib_vec4
}

enum PixelFormat {
	pixelformat_uncompressed_grayscale = 1
	pixelformat_uncompressed_gray_alpha
	pixelformat_uncompressed_r5g6b5
	pixelformat_uncompressed_r8g8b8
	pixelformat_uncompressed_r5g5b5a1
	pixelformat_uncompressed_r4g4b4a4
	pixelformat_uncompressed_r8g8b8a8
	pixelformat_uncompressed_r32
	pixelformat_uncompressed_r32g32b32
	pixelformat_uncompressed_r32g32b32a32
	pixelformat_compressed_dxt1_rgb
	pixelformat_compressed_dxt1_rgba
	pixelformat_compressed_dxt3_rgba
	pixelformat_compressed_dxt5_rgba
	pixelformat_compressed_etc1_rgb
	pixelformat_compressed_etc2_rgb
	pixelformat_compressed_etc2_eac_rgba
	pixelformat_compressed_pvrt_rgb
	pixelformat_compressed_pvrt_rgba
	pixelformat_compressed_astc_4x4_rgba
	pixelformat_compressed_astc_8x8_rgba
}

enum TextureFilter {
	texture_filter_point = 0
	texture_filter_bilinear
	texture_filter_trilinear
	texture_filter_anisotropic_4x
	texture_filter_anisotropic_8x
	texture_filter_anisotropic_16x
}

enum TextureWrap {
	texture_wrap_repeat = 0
	texture_wrap_clamp
	texture_wrap_mirror_repeat
	texture_wrap_mirror_clamp
}

enum CubemapLayout {
	cubemap_layout_auto_detect = 0
	cubemap_layout_line_vertical
	cubemap_layout_line_horizontal
	cubemap_layout_cross_three_by_four
	cubemap_layout_cross_four_by_three
	cubemap_layout_panorama
}

enum FontType {
	font_default = 0
	font_bitmap
	font_sdf
}

enum BlendMode {
	blend_alpha = 0
	blend_additive
	blend_multiplied
	blend_add_colors
	blend_subtract_colors
	blend_alpha_premultiply
	blend_custom
}

enum Gesture {
	gesture_none        = 0
	gesture_tap         = 1
	gesture_doubletap   = 2
	gesture_hold        = 4
	gesture_drag        = 8
	gesture_swipe_right = 16
	gesture_swipe_left  = 32
	gesture_swipe_up    = 64
	gesture_swipe_down  = 128
	gesture_pinch_in    = 256
	gesture_pinch_out   = 512
}

enum CameraMode {
	camera_custom = 0
	camera_free
	camera_orbital
	camera_first_person
	camera_third_person
}

enum CameraProjection {
	camera_perspective = 0
	camera_orthographic
}

enum NPatchLayout {
	npatch_nine_patch = 0
	npatch_three_patch_vertical
	npatch_three_patch_horizontal
}

type TraceLogCallback = Va_list
type LoadFileDataCallback = fn (&i8, &u32) &u8

type SaveFileDataCallback = fn (&i8, voidptr, u32) bool

type LoadFileTextCallback = fn (&i8) &i8

type SaveFileTextCallback = fn (&i8, &i8) bool

@[c: 'InitWindow']
fn init_window(width int, height int, title &i8)

@[c: 'CloseWindow']
fn close_window()

@[c: 'SetWindowState']
fn set_window_state(flags u32)

@[c: 'ClearWindowState']
fn clear_window_state(flags u32)

@[c: 'ToggleFullscreen']
fn toggle_fullscreen()

@[c: 'MaximizeWindow']
fn maximize_window()

@[c: 'MinimizeWindow']
fn minimize_window()

@[c: 'RestoreWindow']
fn restore_window()

@[c: 'SetWindowIcon']
fn set_window_icon(image Image)

@[c: 'SetWindowTitle']
fn set_window_title(title &i8)

@[c: 'SetWindowPosition']
fn set_window_position(x int, y int)

@[c: 'SetWindowMonitor']
fn set_window_monitor(monitor int)

@[c: 'SetWindowMinSize']
fn set_window_min_size(width int, height int)

@[c: 'SetWindowSize']
fn set_window_size(width int, height int)

@[c: 'SetWindowOpacity']
fn set_window_opacity(opacity f32)

@[c: 'GetWindowHandle']
fn get_window_handle() voidptr

@[c: 'GetScreenWidth']
fn get_screen_width() int

@[c: 'GetScreenHeight']
fn get_screen_height() int

@[c: 'GetRenderWidth']
fn get_render_width() int

@[c: 'GetRenderHeight']
fn get_render_height() int

@[c: 'GetMonitorCount']
fn get_monitor_count() int

@[c: 'GetCurrentMonitor']
fn get_current_monitor() int

@[c: 'GetMonitorPosition']
fn get_monitor_position(monitor int) Vector2

@[c: 'GetMonitorWidth']
fn get_monitor_width(monitor int) int

@[c: 'GetMonitorHeight']
fn get_monitor_height(monitor int) int

@[c: 'GetMonitorPhysicalWidth']
fn get_monitor_physical_width(monitor int) int

@[c: 'GetMonitorPhysicalHeight']
fn get_monitor_physical_height(monitor int) int

@[c: 'GetMonitorRefreshRate']
fn get_monitor_refresh_rate(monitor int) int

@[c: 'GetWindowPosition']
fn get_window_position() Vector2

@[c: 'GetWindowScaleDPI']
fn get_window_scale_dpi() Vector2

@[c: 'GetMonitorName']
fn get_monitor_name(monitor int) &i8

@[c: 'SetClipboardText']
fn set_clipboard_text(text &i8)

@[c: 'GetClipboardText']
fn get_clipboard_text() &i8

@[c: 'EnableEventWaiting']
fn enable_event_waiting()

@[c: 'DisableEventWaiting']
fn disable_event_waiting()

@[c: 'SwapScreenBuffer']
fn swap_screen_buffer()

@[c: 'PollInputEvents']
fn poll_input_events()

@[c: 'WaitTime']
fn wait_time(seconds f64)

@[c: 'ShowCursor']
fn show_cursor()

@[c: 'HideCursor']
fn hide_cursor()

@[c: 'EnableCursor']
fn enable_cursor()

@[c: 'DisableCursor']
fn disable_cursor()

@[c: 'ClearBackground']
fn clear_background(color Color)

@[c: 'BeginDrawing']
fn begin_drawing()

@[c: 'EndDrawing']
fn end_drawing()

@[c: 'BeginMode2D']
fn begin_mode2D(camera Camera2D)

@[c: 'EndMode2D']
fn end_mode2D()

@[c: 'BeginMode3D']
fn begin_mode3D(camera Camera3D)

@[c: 'EndMode3D']
fn end_mode3D()

@[c: 'BeginTextureMode']
fn begin_texture_mode(target RenderTexture2D)

@[c: 'EndTextureMode']
fn end_texture_mode()

@[c: 'BeginShaderMode']
fn begin_shader_mode(shader Shader)

@[c: 'EndShaderMode']
fn end_shader_mode()

@[c: 'BeginBlendMode']
fn begin_blend_mode(mode int)

@[c: 'EndBlendMode']
fn end_blend_mode()

@[c: 'BeginScissorMode']
fn begin_scissor_mode(x int, y int, width int, height int)

@[c: 'EndScissorMode']
fn end_scissor_mode()

@[c: 'BeginVrStereoMode']
fn begin_vr_stereo_mode(config VrStereoConfig)

@[c: 'EndVrStereoMode']
fn end_vr_stereo_mode()

@[c: 'LoadVrStereoConfig']
fn load_vr_stereo_config(device VrDeviceInfo) VrStereoConfig

@[c: 'UnloadVrStereoConfig']
fn unload_vr_stereo_config(config VrStereoConfig)

@[c: 'LoadShader']
fn load_shader(vsfilename &i8, fsfilename &i8) Shader

@[c: 'LoadShaderFromMemory']
fn load_shader_from_memory(vscode &i8, fscode &i8) Shader

@[c: 'GetShaderLocation']
fn get_shader_location(shader Shader, uniformname &i8) int

@[c: 'GetShaderLocationAttrib']
fn get_shader_location_attrib(shader Shader, attribname &i8) int

@[c: 'SetShaderValue']
fn set_shader_value(shader Shader, locindex int, value voidptr, uniformtype int)

@[c: 'SetShaderValueV']
fn set_shader_value_v(shader Shader, locindex int, value voidptr, uniformtype int, count int)

@[c: 'SetShaderValueMatrix']
fn set_shader_value_matrix(shader Shader, locindex int, mat Matrix)

@[c: 'SetShaderValueTexture']
fn set_shader_value_texture(shader Shader, locindex int, texture Texture2D)

@[c: 'UnloadShader']
fn unload_shader(shader Shader)

@[c: 'GetMouseRay']
fn get_mouse_ray(mouseposition Vector2, camera Camera) Ray

@[c: 'GetCameraMatrix']
fn get_camera_matrix(camera Camera) Matrix

@[c: 'GetCameraMatrix2D']
fn get_camera_matrix2D(camera Camera2D) Matrix

@[c: 'GetWorldToScreen']
fn get_world_to_screen(position Vector3, camera Camera) Vector2

@[c: 'GetScreenToWorld2D']
fn get_screen_to_world2D(position Vector2, camera Camera2D) Vector2

@[c: 'GetWorldToScreenEx']
fn get_world_to_screen_ex(position Vector3, camera Camera, width int, height int) Vector2

@[c: 'GetWorldToScreen2D']
fn get_world_to_screen2D(position Vector2, camera Camera2D) Vector2

@[c: 'SetTargetFPS']
fn set_target_fps(fps int)

@[c: 'GetFPS']
fn get_fps() int

@[c: 'GetFrameTime']
fn get_frame_time() f32

@[c: 'GetTime']
fn get_time() f64

@[c: 'GetRandomValue']
fn get_random_value(min int, max int) int

@[c: 'SetRandomSeed']
fn set_random_seed(seed u32)

@[c: 'TakeScreenshot']
fn take_screenshot(filename &i8)

@[c: 'SetConfigFlags']
fn set_config_flags(flags u32)

@[c: 'TraceLog']
@[ctraceLog]
fn tracelog(loglevel int, text ...&i8)

@[c: 'SetTraceLogLevel']
fn set_trace_log_level(loglevel int)

@[c: 'MemAlloc']
fn mem_alloc(size int) voidptr

@[c: 'MemRealloc']
fn mem_realloc(ptr voidptr, size int) voidptr

@[c: 'MemFree']
fn mem_free(ptr voidptr)

@[c: 'OpenURL']
fn open_url(url &i8)

@[c: 'SetTraceLogCallback']
fn set_trace_log_callback(callback TraceLogCallback)

@[c: 'SetLoadFileDataCallback']
fn set_load_file_data_callback(callback LoadFileDataCallback)

@[c: 'SetSaveFileDataCallback']
fn set_save_file_data_callback(callback SaveFileDataCallback)

@[c: 'SetLoadFileTextCallback']
fn set_load_file_text_callback(callback LoadFileTextCallback)

@[c: 'SetSaveFileTextCallback']
fn set_save_file_text_callback(callback SaveFileTextCallback)

@[c: 'LoadFileData']
fn load_file_data(filename &i8, bytesread &u32) &u8

@[c: 'UnloadFileData']
fn unload_file_data(data &u8)

@[c: 'LoadFileText']
fn load_file_text(filename &i8) &i8

@[c: 'UnloadFileText']
fn unload_file_text(text &i8)

@[c: 'GetFileLength']
fn get_file_length(filename &i8) int

@[c: 'GetFileExtension']
fn get_file_extension(filename &i8) &i8

@[c: 'GetFileName']
fn get_file_name(filepath &i8) &i8

@[c: 'GetFileNameWithoutExt']
fn get_file_name_without_ext(filepath &i8) &i8

@[c: 'GetDirectoryPath']
fn get_directory_path(filepath &i8) &i8

@[c: 'GetPrevDirectoryPath']
fn get_prev_directory_path(dirpath &i8) &i8

@[c: 'GetWorkingDirectory']
fn get_working_directory() &i8

@[c: 'GetApplicationDirectory']
fn get_application_directory() &i8

@[c: 'LoadDirectoryFiles']
fn load_directory_files(dirpath &i8) FilePathList

@[c: 'LoadDirectoryFilesEx']
fn load_directory_files_ex(basepath &i8, filter &i8, scansubdirs bool) FilePathList

@[c: 'UnloadDirectoryFiles']
fn unload_directory_files(files FilePathList)

@[c: 'LoadDroppedFiles']
fn load_dropped_files() FilePathList

@[c: 'UnloadDroppedFiles']
fn unload_dropped_files(files FilePathList)

@[c: 'GetFileModTime']
fn get_file_mod_time(filename &i8) int

@[c: 'CompressData']
fn compress_data(data &u8, datasize int, compdatasize &int) &u8

@[c: 'DecompressData']
fn decompress_data(compdata &u8, compdatasize int, datasize &int) &u8

@[c: 'EncodeDataBase64']
fn encode_data_base64(data &u8, datasize int, outputsize &int) &i8

@[c: 'DecodeDataBase64']
fn decode_data_base64(data &u8, outputsize &int) &u8

@[c: 'SetExitKey']
fn set_exit_key(key int)

@[c: 'GetKeyPressed']
fn get_key_pressed() int

@[c: 'GetCharPressed']
fn get_char_pressed() int

@[c: 'GetGamepadName']
fn get_gamepad_name(gamepad int) &i8

@[c: 'GetGamepadButtonPressed']
fn get_gamepad_button_pressed() int

@[c: 'GetGamepadAxisCount']
fn get_gamepad_axis_count(gamepad int) int

@[c: 'GetGamepadAxisMovement']
fn get_gamepad_axis_movement(gamepad int, axis int) f32

@[c: 'SetGamepadMappings']
fn set_gamepad_mappings(mappings &i8) int

@[c: 'GetMouseX']
fn get_mouse_x() int

@[c: 'GetMouseY']
fn get_mouse_y() int

@[c: 'GetMousePosition']
fn get_mouse_position() Vector2

@[c: 'GetMouseDelta']
fn get_mouse_delta() Vector2

@[c: 'SetMousePosition']
fn set_mouse_position(x int, y int)

@[c: 'SetMouseOffset']
fn set_mouse_offset(offsetx int, offsety int)

@[c: 'SetMouseScale']
fn set_mouse_scale(scalex f32, scaley f32)

@[c: 'GetMouseWheelMove']
fn get_mouse_wheel_move() f32

@[c: 'GetMouseWheelMoveV']
fn get_mouse_wheel_move_v() Vector2

@[c: 'SetMouseCursor']
fn set_mouse_cursor(cursor int)

@[c: 'GetTouchX']
fn get_touch_x() int

@[c: 'GetTouchY']
fn get_touch_y() int

@[c: 'GetTouchPosition']
fn get_touch_position(index int) Vector2

@[c: 'GetTouchPointId']
fn get_touch_point_id(index int) int

@[c: 'GetTouchPointCount']
fn get_touch_point_count() int

@[c: 'SetGesturesEnabled']
fn set_gestures_enabled(flags u32)

@[c: 'GetGestureDetected']
fn get_gesture_detected() int

@[c: 'GetGestureHoldDuration']
fn get_gesture_hold_duration() f32

@[c: 'GetGestureDragVector']
fn get_gesture_drag_vector() Vector2

@[c: 'GetGestureDragAngle']
fn get_gesture_drag_angle() f32

@[c: 'GetGesturePinchVector']
fn get_gesture_pinch_vector() Vector2

@[c: 'GetGesturePinchAngle']
fn get_gesture_pinch_angle() f32

@[c: 'SetCameraMode']
fn set_camera_mode(camera Camera, mode int)

@[c: 'UpdateCamera']
fn update_camera(camera &Camera)

@[c: 'SetCameraPanControl']
fn set_camera_pan_control(keypan int)

@[c: 'SetCameraAltControl']
fn set_camera_alt_control(keyalt int)

@[c: 'SetCameraSmoothZoomControl']
fn set_camera_smooth_zoom_control(keysmoothzoom int)

@[c: 'SetCameraMoveControls']
fn set_camera_move_controls(keyfront int, keyback int, keyright int, keyleft int, keyup int, keydown int)

@[c: 'SetShapesTexture']
fn set_shapes_texture(texture Texture2D, source Rectangle)

@[c: 'DrawPixel']
fn draw_pixel(posx int, posy int, color Color)

@[c: 'DrawPixelV']
fn draw_pixel_v(position Vector2, color Color)

@[c: 'DrawLine']
fn draw_line(startposx int, startposy int, endposx int, endposy int, color Color)

@[c: 'DrawLineV']
fn draw_line_v(startpos Vector2, endpos Vector2, color Color)

@[c: 'DrawLineEx']
fn draw_line_ex(startpos Vector2, endpos Vector2, thick f32, color Color)

@[c: 'DrawLineBezier']
fn draw_line_bezier(startpos Vector2, endpos Vector2, thick f32, color Color)

@[c: 'DrawLineBezierQuad']
fn draw_line_bezier_quad(startpos Vector2, endpos Vector2, controlpos Vector2, thick f32, color Color)

@[c: 'DrawLineBezierCubic']
fn draw_line_bezier_cubic(startpos Vector2, endpos Vector2, startcontrolpos Vector2, endcontrolpos Vector2, thick f32, color Color)

@[c: 'DrawLineStrip']
fn draw_line_strip(points &Vector2, pointcount int, color Color)

@[c: 'DrawCircle']
fn draw_circle(centerx int, centery int, radius f32, color Color)

@[c: 'DrawCircleSector']
fn draw_circle_sector(center Vector2, radius f32, startangle f32, endangle f32, segments int, color Color)

@[c: 'DrawCircleSectorLines']
fn draw_circle_sector_lines(center Vector2, radius f32, startangle f32, endangle f32, segments int, color Color)

@[c: 'DrawCircleGradient']
fn draw_circle_gradient(centerx int, centery int, radius f32, color1 Color, color2 Color)

@[c: 'DrawCircleV']
fn draw_circle_v(center Vector2, radius f32, color Color)

@[c: 'DrawCircleLines']
fn draw_circle_lines(centerx int, centery int, radius f32, color Color)

@[c: 'DrawEllipse']
fn draw_ellipse(centerx int, centery int, radiush f32, radiusv f32, color Color)

@[c: 'DrawEllipseLines']
fn draw_ellipse_lines(centerx int, centery int, radiush f32, radiusv f32, color Color)

@[c: 'DrawRing']
fn draw_ring(center Vector2, innerradius f32, outerradius f32, startangle f32, endangle f32, segments int, color Color)

@[c: 'DrawRingLines']
fn draw_ring_lines(center Vector2, innerradius f32, outerradius f32, startangle f32, endangle f32, segments int, color Color)

@[c: 'DrawRectangle']
fn draw_rectangle(posx int, posy int, width int, height int, color Color)

@[c: 'DrawRectangleV']
fn draw_rectangle_v(position Vector2, size Vector2, color Color)

@[c: 'DrawRectangleRec']
fn draw_rectangle_rec(rec Rectangle, color Color)

@[c: 'DrawRectanglePro']
fn draw_rectangle_pro(rec Rectangle, origin Vector2, rotation f32, color Color)

@[c: 'DrawRectangleGradientV']
fn draw_rectangle_gradient_v(posx int, posy int, width int, height int, color1 Color, color2 Color)

@[c: 'DrawRectangleGradientH']
fn draw_rectangle_gradient_h(posx int, posy int, width int, height int, color1 Color, color2 Color)

@[c: 'DrawRectangleGradientEx']
fn draw_rectangle_gradient_ex(rec Rectangle, col1 Color, col2 Color, col3 Color, col4 Color)

@[c: 'DrawRectangleLines']
fn draw_rectangle_lines(posx int, posy int, width int, height int, color Color)

@[c: 'DrawRectangleLinesEx']
fn draw_rectangle_lines_ex(rec Rectangle, linethick f32, color Color)

@[c: 'DrawRectangleRounded']
fn draw_rectangle_rounded(rec Rectangle, roundness f32, segments int, color Color)

@[c: 'DrawRectangleRoundedLines']
fn draw_rectangle_rounded_lines(rec Rectangle, roundness f32, segments int, linethick f32, color Color)

@[c: 'DrawTriangle']
fn draw_triangle(v1 Vector2, v2 Vector2, v3 Vector2, color Color)

@[c: 'DrawTriangleLines']
fn draw_triangle_lines(v1 Vector2, v2 Vector2, v3 Vector2, color Color)

@[c: 'DrawTriangleFan']
fn draw_triangle_fan(points &Vector2, pointcount int, color Color)

@[c: 'DrawTriangleStrip']
fn draw_triangle_strip(points &Vector2, pointcount int, color Color)

@[c: 'DrawPoly']
fn draw_poly(center Vector2, sides int, radius f32, rotation f32, color Color)

@[c: 'DrawPolyLines']
fn draw_poly_lines(center Vector2, sides int, radius f32, rotation f32, color Color)

@[c: 'DrawPolyLinesEx']
fn draw_poly_lines_ex(center Vector2, sides int, radius f32, rotation f32, linethick f32, color Color)

@[c: 'GetCollisionRec']
fn get_collision_rec(rec1 Rectangle, rec2 Rectangle) Rectangle

@[c: 'LoadImage']
fn load_image(filename &i8) Image

@[c: 'LoadImageRaw']
fn load_image_raw(filename &i8, width int, height int, format int, headersize int) Image

@[c: 'LoadImageAnim']
fn load_image_anim(filename &i8, frames &int) Image

@[c: 'LoadImageFromMemory']
fn load_image_from_memory(filetype &i8, filedata &u8, datasize int) Image

@[c: 'LoadImageFromTexture']
fn load_image_from_texture(texture Texture2D) Image

@[c: 'LoadImageFromScreen']
fn load_image_from_screen() Image

@[c: 'UnloadImage']
fn unload_image(image Image)

@[c: 'GenImageColor']
fn gen_image_color(width int, height int, color Color) Image

@[c: 'GenImageGradientV']
fn gen_image_gradient_v(width int, height int, top Color, bottom Color) Image

@[c: 'GenImageGradientH']
fn gen_image_gradient_h(width int, height int, left Color, right Color) Image

@[c: 'GenImageGradientRadial']
fn gen_image_gradient_radial(width int, height int, density f32, inner Color, outer Color) Image

@[c: 'GenImageChecked']
fn gen_image_checked(width int, height int, checksx int, checksy int, col1 Color, col2 Color) Image

@[c: 'GenImageWhiteNoise']
fn gen_image_white_noise(width int, height int, factor f32) Image

@[c: 'GenImageCellular']
fn gen_image_cellular(width int, height int, tilesize int) Image

@[c: 'ImageCopy']
fn image_copy(image Image) Image

@[c: 'ImageFromImage']
fn image_from_image(image Image, rec Rectangle) Image

@[c: 'ImageText']
fn image_text(text &i8, fontsize int, color Color) Image

@[c: 'ImageTextEx']
fn image_text_ex(font Font, text &i8, fontsize f32, spacing f32, tint Color) Image

@[c: 'ImageFormat']
fn image_format(image &Image, newformat int)

@[c: 'ImageToPOT']
fn image_to_pot(image &Image, fill Color)

@[c: 'ImageCrop']
fn image_crop(image &Image, crop Rectangle)

@[c: 'ImageAlphaCrop']
fn image_alpha_crop(image &Image, threshold f32)

@[c: 'ImageAlphaClear']
fn image_alpha_clear(image &Image, color Color, threshold f32)

@[c: 'ImageAlphaMask']
fn image_alpha_mask(image &Image, alphamask Image)

@[c: 'ImageAlphaPremultiply']
fn image_alpha_premultiply(image &Image)

@[c: 'ImageResize']
fn image_resize(image &Image, newwidth int, newheight int)

@[c: 'ImageResizeNN']
fn image_resize_nn(image &Image, newwidth int, newheight int)

@[c: 'ImageResizeCanvas']
fn image_resize_canvas(image &Image, newwidth int, newheight int, offsetx int, offsety int, fill Color)

@[c: 'ImageMipmaps']
fn image_mipmaps(image &Image)

@[c: 'ImageDither']
fn image_dither(image &Image, rbpp int, gbpp int, bbpp int, abpp int)

@[c: 'ImageFlipVertical']
fn image_flip_vertical(image &Image)

@[c: 'ImageFlipHorizontal']
fn image_flip_horizontal(image &Image)

@[c: 'ImageRotateCW']
fn image_rotate_cw(image &Image)

@[c: 'ImageRotateCCW']
fn image_rotate_ccw(image &Image)

@[c: 'ImageColorTint']
fn image_color_tint(image &Image, color Color)

@[c: 'ImageColorInvert']
fn image_color_invert(image &Image)

@[c: 'ImageColorGrayscale']
fn image_color_grayscale(image &Image)

@[c: 'ImageColorContrast']
fn image_color_contrast(image &Image, contrast f32)

@[c: 'ImageColorBrightness']
fn image_color_brightness(image &Image, brightness int)

@[c: 'ImageColorReplace']
fn image_color_replace(image &Image, color Color, replace Color)

@[c: 'LoadImageColors']
fn load_image_colors(image Image) &Color

@[c: 'LoadImagePalette']
fn load_image_palette(image Image, maxpalettesize int, colorcount &int) &Color

@[c: 'UnloadImageColors']
fn unload_image_colors(colors &Color)

@[c: 'UnloadImagePalette']
fn unload_image_palette(colors &Color)

@[c: 'GetImageAlphaBorder']
fn get_image_alpha_border(image Image, threshold f32) Rectangle

@[c: 'GetImageColor']
fn get_image_color(image Image, x int, y int) Color

@[c: 'ImageClearBackground']
fn image_clear_background(dst &Image, color Color)

@[c: 'ImageDrawPixel']
fn image_draw_pixel(dst &Image, posx int, posy int, color Color)

@[c: 'ImageDrawPixelV']
fn image_draw_pixel_v(dst &Image, position Vector2, color Color)

@[c: 'ImageDrawLine']
fn image_draw_line(dst &Image, startposx int, startposy int, endposx int, endposy int, color Color)

@[c: 'ImageDrawLineV']
fn image_draw_line_v(dst &Image, start Vector2, end Vector2, color Color)

@[c: 'ImageDrawCircle']
fn image_draw_circle(dst &Image, centerx int, centery int, radius int, color Color)

@[c: 'ImageDrawCircleV']
fn image_draw_circle_v(dst &Image, center Vector2, radius int, color Color)

@[c: 'ImageDrawRectangle']
fn image_draw_rectangle(dst &Image, posx int, posy int, width int, height int, color Color)

@[c: 'ImageDrawRectangleV']
fn image_draw_rectangle_v(dst &Image, position Vector2, size Vector2, color Color)

@[c: 'ImageDrawRectangleRec']
fn image_draw_rectangle_rec(dst &Image, rec Rectangle, color Color)

@[c: 'ImageDrawRectangleLines']
fn image_draw_rectangle_lines(dst &Image, rec Rectangle, thick int, color Color)

@[c: 'ImageDraw']
fn image_draw(dst &Image, src Image, srcrec Rectangle, dstrec Rectangle, tint Color)

@[c: 'ImageDrawText']
fn image_draw_text(dst &Image, text &i8, posx int, posy int, fontsize int, color Color)

@[c: 'ImageDrawTextEx']
fn image_draw_text_ex(dst &Image, font Font, text &i8, position Vector2, fontsize f32, spacing f32, tint Color)

@[c: 'LoadTexture']
fn load_texture(filename &i8) Texture2D

@[c: 'LoadTextureFromImage']
fn load_texture_from_image(image Image) Texture2D

@[c: 'LoadTextureCubemap']
fn load_texture_cubemap(image Image, layout int) TextureCubemap

@[c: 'LoadRenderTexture']
fn load_render_texture(width int, height int) RenderTexture2D

@[c: 'UnloadTexture']
fn unload_texture(texture Texture2D)

@[c: 'UnloadRenderTexture']
fn unload_render_texture(target RenderTexture2D)

@[c: 'UpdateTexture']
fn update_texture(texture Texture2D, pixels voidptr)

@[c: 'UpdateTextureRec']
fn update_texture_rec(texture Texture2D, rec Rectangle, pixels voidptr)

@[c: 'GenTextureMipmaps']
fn gen_texture_mipmaps(texture &Texture2D)

@[c: 'SetTextureFilter']
fn set_texture_filter(texture Texture2D, filter int)

@[c: 'SetTextureWrap']
fn set_texture_wrap(texture Texture2D, wrap int)

@[c: 'DrawTexture']
fn draw_texture(texture Texture2D, posx int, posy int, tint Color)

@[c: 'DrawTextureV']
fn draw_texture_v(texture Texture2D, position Vector2, tint Color)

@[c: 'DrawTextureEx']
fn draw_texture_ex(texture Texture2D, position Vector2, rotation f32, scale f32, tint Color)

@[c: 'DrawTextureRec']
fn draw_texture_rec(texture Texture2D, source Rectangle, position Vector2, tint Color)

@[c: 'DrawTextureQuad']
fn draw_texture_quad(texture Texture2D, tiling Vector2, offset Vector2, quad Rectangle, tint Color)

@[c: 'DrawTextureTiled']
fn draw_texture_tiled(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, scale f32, tint Color)

@[c: 'DrawTexturePro']
fn draw_texture_pro(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, tint Color)

@[c: 'DrawTextureNPatch']
fn draw_texture_n_patch(texture Texture2D, npatchinfo NPatchInfo, dest Rectangle, origin Vector2, rotation f32, tint Color)

@[c: 'DrawTexturePoly']
fn draw_texture_poly(texture Texture2D, center Vector2, points &Vector2, texcoords &Vector2, pointcount int, tint Color)

@[c: 'Fade']
fn fade(color Color, alpha f32) Color

@[c: 'ColorToInt']
fn color_to_int(color Color) int

@[c: 'ColorNormalize']
fn color_normalize(color Color) Vector4

@[c: 'ColorFromNormalized']
fn color_from_normalized(normalized Vector4) Color

@[c: 'ColorToHSV']
fn color_to_hsv(color Color) Vector3

@[c: 'ColorFromHSV']
fn color_from_hsv(hue f32, saturation f32, value f32) Color

@[c: 'ColorAlpha']
fn color_alpha(color Color, alpha f32) Color

@[c: 'ColorAlphaBlend']
fn color_alpha_blend(dst Color, src Color, tint Color) Color

@[c: 'GetColor']
fn get_color(hexvalue u32) Color

@[c: 'GetPixelColor']
fn get_pixel_color(srcptr voidptr, format int) Color

@[c: 'SetPixelColor']
fn set_pixel_color(dstptr voidptr, color Color, format int)

@[c: 'GetPixelDataSize']
fn get_pixel_data_size(width int, height int, format int) int

@[c: 'GetFontDefault']
fn get_font_default() Font

@[c: 'LoadFont']
fn load_font(filename &i8) Font

@[c: 'LoadFontEx']
fn load_font_ex(filename &i8, fontsize int, fontchars &int, glyphcount int) Font

@[c: 'LoadFontFromImage']
fn load_font_from_image(image Image, key Color, firstchar int) Font

@[c: 'LoadFontFromMemory']
fn load_font_from_memory(filetype &i8, filedata &u8, datasize int, fontsize int, fontchars &int, glyphcount int) Font

@[c: 'LoadFontData']
fn load_font_data(filedata &u8, datasize int, fontsize int, fontchars &int, glyphcount int, type_ int) &GlyphInfo

@[c: 'GenImageFontAtlas']
fn gen_image_font_atlas(chars &GlyphInfo, recs &&Rectangle, glyphcount int, fontsize int, padding int, packmethod int) Image

@[c: 'UnloadFontData']
fn unload_font_data(chars &GlyphInfo, glyphcount int)

@[c: 'UnloadFont']
fn unload_font(font Font)

@[c: 'DrawFPS']
fn draw_fps(posx int, posy int)

@[c: 'DrawText']
fn draw_text(text &i8, posx int, posy int, fontsize int, color Color)

@[c: 'DrawTextEx']
fn draw_text_ex(font Font, text &i8, position Vector2, fontsize f32, spacing f32, tint Color)

@[c: 'DrawTextPro']
fn draw_text_pro(font Font, text &i8, position Vector2, origin Vector2, rotation f32, fontsize f32, spacing f32, tint Color)

@[c: 'DrawTextCodepoint']
fn draw_text_codepoint(font Font, codepoint int, position Vector2, fontsize f32, tint Color)

@[c: 'DrawTextCodepoints']
fn draw_text_codepoints(font Font, codepoints &int, count int, position Vector2, fontsize f32, spacing f32, tint Color)

@[c: 'MeasureText']
fn measure_text(text &i8, fontsize int) int

@[c: 'MeasureTextEx']
fn measure_text_ex(font Font, text &i8, fontsize f32, spacing f32) Vector2

@[c: 'GetGlyphIndex']
fn get_glyph_index(font Font, codepoint int) int

@[c: 'GetGlyphInfo']
fn get_glyph_info(font Font, codepoint int) GlyphInfo

@[c: 'GetGlyphAtlasRec']
fn get_glyph_atlas_rec(font Font, codepoint int) Rectangle

@[c: 'LoadCodepoints']
fn load_codepoints(text &i8, count &int) &int

@[c: 'UnloadCodepoints']
fn unload_codepoints(codepoints &int)

@[c: 'GetCodepointCount']
fn get_codepoint_count(text &i8) int

@[c: 'GetCodepoint']
fn get_codepoint(text &i8, bytesprocessed &int) int

@[c: 'CodepointToUTF8']
fn codepoint_to_utf8(codepoint int, bytesize &int) &i8

@[c: 'TextCodepointsToUTF8']
fn text_codepoints_to_utf8(codepoints &int, length int) &i8

@[c: 'TextCopy']
fn text_copy(dst &i8, src &i8) int

@[c: 'TextLength']
fn text_length(text &i8) u32

@[c: 'TextFormat']
@[ctextFormat]
fn textformat(text ...&i8) &i8

@[c: 'TextSubtext']
fn text_subtext(text &i8, position int, length int) &i8

@[c: 'TextReplace']
fn text_replace(text &i8, replace &i8, by &i8) &i8

@[c: 'TextInsert']
fn text_insert(text &i8, insert &i8, position int) &i8

@[c: 'TextJoin']
fn text_join(textlist &&u8, count int, delimiter &i8) &i8

@[c: 'TextSplit']
fn text_split(text &i8, delimiter i8, count &int) &&u8

@[c: 'TextAppend']
fn text_append(text &i8, append &i8, position &int)

@[c: 'TextFindIndex']
fn text_find_index(text &i8, find &i8) int

@[c: 'TextToUpper']
fn text_to_upper(text &i8) &i8

@[c: 'TextToLower']
fn text_to_lower(text &i8) &i8

@[c: 'TextToPascal']
fn text_to_pascal(text &i8) &i8

@[c: 'TextToInteger']
fn text_to_integer(text &i8) int

@[c: 'DrawLine3D']
fn draw_line3D(startpos Vector3, endpos Vector3, color Color)

@[c: 'DrawPoint3D']
fn draw_point3D(position Vector3, color Color)

@[c: 'DrawCircle3D']
fn draw_circle3D(center Vector3, radius f32, rotationaxis Vector3, rotationangle f32, color Color)

@[c: 'DrawTriangle3D']
fn draw_triangle3D(v1 Vector3, v2 Vector3, v3 Vector3, color Color)

@[c: 'DrawTriangleStrip3D']
fn draw_triangle_strip3D(points &Vector3, pointcount int, color Color)

@[c: 'DrawCube']
fn draw_cube(position Vector3, width f32, height f32, length f32, color Color)

@[c: 'DrawCubeV']
fn draw_cube_v(position Vector3, size Vector3, color Color)

@[c: 'DrawCubeWires']
fn draw_cube_wires(position Vector3, width f32, height f32, length f32, color Color)

@[c: 'DrawCubeWiresV']
fn draw_cube_wires_v(position Vector3, size Vector3, color Color)

@[c: 'DrawCubeTexture']
fn draw_cube_texture(texture Texture2D, position Vector3, width f32, height f32, length f32, color Color)

@[c: 'DrawCubeTextureRec']
fn draw_cube_texture_rec(texture Texture2D, source Rectangle, position Vector3, width f32, height f32, length f32, color Color)

@[c: 'DrawSphere']
fn draw_sphere(centerpos Vector3, radius f32, color Color)

@[c: 'DrawSphereEx']
fn draw_sphere_ex(centerpos Vector3, radius f32, rings int, slices int, color Color)

@[c: 'DrawSphereWires']
fn draw_sphere_wires(centerpos Vector3, radius f32, rings int, slices int, color Color)

@[c: 'DrawCylinder']
fn draw_cylinder(position Vector3, radiustop f32, radiusbottom f32, height f32, slices int, color Color)

@[c: 'DrawCylinderEx']
fn draw_cylinder_ex(startpos Vector3, endpos Vector3, startradius f32, endradius f32, sides int, color Color)

@[c: 'DrawCylinderWires']
fn draw_cylinder_wires(position Vector3, radiustop f32, radiusbottom f32, height f32, slices int, color Color)

@[c: 'DrawCylinderWiresEx']
fn draw_cylinder_wires_ex(startpos Vector3, endpos Vector3, startradius f32, endradius f32, sides int, color Color)

@[c: 'DrawPlane']
fn draw_plane(centerpos Vector3, size Vector2, color Color)

@[c: 'DrawRay']
fn draw_ray(ray Ray, color Color)

@[c: 'DrawGrid']
fn draw_grid(slices int, spacing f32)

@[c: 'LoadModel']
fn load_model(filename &i8) Model

@[c: 'LoadModelFromMesh']
fn load_model_from_mesh(mesh Mesh) Model

@[c: 'UnloadModel']
fn unload_model(model Model)

@[c: 'UnloadModelKeepMeshes']
fn unload_model_keep_meshes(model Model)

@[c: 'GetModelBoundingBox']
fn get_model_bounding_box(model Model) BoundingBox

@[c: 'DrawModel']
fn draw_model(model Model, position Vector3, scale f32, tint Color)

@[c: 'DrawModelEx']
fn draw_model_ex(model Model, position Vector3, rotationaxis Vector3, rotationangle f32, scale Vector3, tint Color)

@[c: 'DrawModelWires']
fn draw_model_wires(model Model, position Vector3, scale f32, tint Color)

@[c: 'DrawModelWiresEx']
fn draw_model_wires_ex(model Model, position Vector3, rotationaxis Vector3, rotationangle f32, scale Vector3, tint Color)

@[c: 'DrawBoundingBox']
fn draw_bounding_box(box BoundingBox, color Color)

@[c: 'DrawBillboard']
fn draw_billboard(camera Camera, texture Texture2D, position Vector3, size f32, tint Color)

@[c: 'DrawBillboardRec']
fn draw_billboard_rec(camera Camera, texture Texture2D, source Rectangle, position Vector3, size Vector2, tint Color)

@[c: 'DrawBillboardPro']
fn draw_billboard_pro(camera Camera, texture Texture2D, source Rectangle, position Vector3, up Vector3, size Vector2, origin Vector2, rotation f32, tint Color)

@[c: 'UploadMesh']
fn upload_mesh(mesh &Mesh, dynamic bool)

@[c: 'UpdateMeshBuffer']
fn update_mesh_buffer(mesh Mesh, index int, data voidptr, datasize int, offset int)

@[c: 'UnloadMesh']
fn unload_mesh(mesh Mesh)

@[c: 'DrawMesh']
fn draw_mesh(mesh Mesh, material Material, transform Matrix)

@[c: 'DrawMeshInstanced']
fn draw_mesh_instanced(mesh Mesh, material Material, transforms &Matrix, instances int)

@[c: 'GetMeshBoundingBox']
fn get_mesh_bounding_box(mesh Mesh) BoundingBox

@[c: 'GenMeshTangents']
fn gen_mesh_tangents(mesh &Mesh)

@[c: 'GenMeshPoly']
fn gen_mesh_poly(sides int, radius f32) Mesh

@[c: 'GenMeshPlane']
fn gen_mesh_plane(width f32, length f32, resx int, resz int) Mesh

@[c: 'GenMeshCube']
fn gen_mesh_cube(width f32, height f32, length f32) Mesh

@[c: 'GenMeshSphere']
fn gen_mesh_sphere(radius f32, rings int, slices int) Mesh

@[c: 'GenMeshHemiSphere']
fn gen_mesh_hemi_sphere(radius f32, rings int, slices int) Mesh

@[c: 'GenMeshCylinder']
fn gen_mesh_cylinder(radius f32, height f32, slices int) Mesh

@[c: 'GenMeshCone']
fn gen_mesh_cone(radius f32, height f32, slices int) Mesh

@[c: 'GenMeshTorus']
fn gen_mesh_torus(radius f32, size f32, radseg int, sides int) Mesh

@[c: 'GenMeshKnot']
fn gen_mesh_knot(radius f32, size f32, radseg int, sides int) Mesh

@[c: 'GenMeshHeightmap']
fn gen_mesh_heightmap(heightmap Image, size Vector3) Mesh

@[c: 'GenMeshCubicmap']
fn gen_mesh_cubicmap(cubicmap Image, cubesize Vector3) Mesh

@[c: 'LoadMaterials']
fn load_materials(filename &i8, materialcount &int) &Material

@[c: 'LoadMaterialDefault']
fn load_material_default() Material

@[c: 'UnloadMaterial']
fn unload_material(material Material)

@[c: 'SetMaterialTexture']
fn set_material_texture(material &Material, maptype int, texture Texture2D)

@[c: 'SetModelMeshMaterial']
fn set_model_mesh_material(model &Model, meshid int, materialid int)

@[c: 'LoadModelAnimations']
fn load_model_animations(filename &i8, animcount &u32) &ModelAnimation

@[c: 'UpdateModelAnimation']
fn update_model_animation(model Model, anim ModelAnimation, frame int)

@[c: 'UnloadModelAnimation']
fn unload_model_animation(anim ModelAnimation)

@[c: 'UnloadModelAnimations']
fn unload_model_animations(animations &ModelAnimation, count u32)

@[c: 'GetRayCollisionSphere']
fn get_ray_collision_sphere(ray Ray, center Vector3, radius f32) RayCollision

@[c: 'GetRayCollisionBox']
fn get_ray_collision_box(ray Ray, box BoundingBox) RayCollision

@[c: 'GetRayCollisionMesh']
fn get_ray_collision_mesh(ray Ray, mesh Mesh, transform Matrix) RayCollision

@[c: 'GetRayCollisionTriangle']
fn get_ray_collision_triangle(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3) RayCollision

@[c: 'GetRayCollisionQuad']
fn get_ray_collision_quad(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3, p4 Vector3) RayCollision

type AudioCallback = fn (voidptr, u32)

@[c: 'InitAudioDevice']
fn init_audio_device()

@[c: 'CloseAudioDevice']
fn close_audio_device()

@[c: 'SetMasterVolume']
fn set_master_volume(volume f32)

@[c: 'LoadWave']
fn load_wave(filename &i8) Wave

@[c: 'LoadWaveFromMemory']
fn load_wave_from_memory(filetype &i8, filedata &u8, datasize int) Wave

@[c: 'LoadSound']
fn load_sound(filename &i8) Sound

@[c: 'LoadSoundFromWave']
fn load_sound_from_wave(wave Wave) Sound

@[c: 'UpdateSound']
fn update_sound(sound Sound, data voidptr, samplecount int)

@[c: 'UnloadWave']
fn unload_wave(wave Wave)

@[c: 'UnloadSound']
fn unload_sound(sound Sound)

@[c: 'PlaySound']
fn play_sound(sound Sound)

@[c: 'StopSound']
fn stop_sound(sound Sound)

@[c: 'PauseSound']
fn pause_sound(sound Sound)

@[c: 'ResumeSound']
fn resume_sound(sound Sound)

@[c: 'PlaySoundMulti']
fn play_sound_multi(sound Sound)

@[c: 'StopSoundMulti']
fn stop_sound_multi()

@[c: 'GetSoundsPlaying']
fn get_sounds_playing() int

@[c: 'SetSoundVolume']
fn set_sound_volume(sound Sound, volume f32)

@[c: 'SetSoundPitch']
fn set_sound_pitch(sound Sound, pitch f32)

@[c: 'SetSoundPan']
fn set_sound_pan(sound Sound, pan f32)

@[c: 'WaveCopy']
fn wave_copy(wave Wave) Wave

@[c: 'WaveCrop']
fn wave_crop(wave &Wave, initsample int, finalsample int)

@[c: 'WaveFormat']
fn wave_format(wave &Wave, samplerate int, samplesize int, channels int)

@[c: 'LoadWaveSamples']
fn load_wave_samples(wave Wave) &f32

@[c: 'UnloadWaveSamples']
fn unload_wave_samples(samples &f32)

@[c: 'LoadMusicStream']
fn load_music_stream(filename &i8) Music

@[c: 'LoadMusicStreamFromMemory']
fn load_music_stream_from_memory(filetype &i8, data &u8, datasize int) Music

@[c: 'UnloadMusicStream']
fn unload_music_stream(music Music)

@[c: 'PlayMusicStream']
fn play_music_stream(music Music)

@[c: 'UpdateMusicStream']
fn update_music_stream(music Music)

@[c: 'StopMusicStream']
fn stop_music_stream(music Music)

@[c: 'PauseMusicStream']
fn pause_music_stream(music Music)

@[c: 'ResumeMusicStream']
fn resume_music_stream(music Music)

@[c: 'SeekMusicStream']
fn seek_music_stream(music Music, position f32)

@[c: 'SetMusicVolume']
fn set_music_volume(music Music, volume f32)

@[c: 'SetMusicPitch']
fn set_music_pitch(music Music, pitch f32)

@[c: 'SetMusicPan']
fn set_music_pan(music Music, pan f32)

@[c: 'GetMusicTimeLength']
fn get_music_time_length(music Music) f32

@[c: 'GetMusicTimePlayed']
fn get_music_time_played(music Music) f32

@[c: 'LoadAudioStream']
fn load_audio_stream(samplerate u32, samplesize u32, channels u32) AudioStream

@[c: 'UnloadAudioStream']
fn unload_audio_stream(stream AudioStream)

@[c: 'UpdateAudioStream']
fn update_audio_stream(stream AudioStream, data voidptr, framecount int)

@[c: 'PlayAudioStream']
fn play_audio_stream(stream AudioStream)

@[c: 'PauseAudioStream']
fn pause_audio_stream(stream AudioStream)

@[c: 'ResumeAudioStream']
fn resume_audio_stream(stream AudioStream)

@[c: 'StopAudioStream']
fn stop_audio_stream(stream AudioStream)

@[c: 'SetAudioStreamVolume']
fn set_audio_stream_volume(stream AudioStream, volume f32)

@[c: 'SetAudioStreamPitch']
fn set_audio_stream_pitch(stream AudioStream, pitch f32)

@[c: 'SetAudioStreamPan']
fn set_audio_stream_pan(stream AudioStream, pan f32)

@[c: 'SetAudioStreamBufferSizeDefault']
fn set_audio_stream_buffer_size_default(size int)

@[c: 'SetAudioStreamCallback']
fn set_audio_stream_callback(stream AudioStream, callback AudioCallback)

@[c: 'AttachAudioStreamProcessor']
fn attach_audio_stream_processor(stream AudioStream, processor AudioCallback)

@[c: 'DetachAudioStreamProcessor']
fn detach_audio_stream_processor(stream AudioStream, processor AudioCallback)
