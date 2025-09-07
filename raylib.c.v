@[translated]
module vraylib

pub struct Vector2 {
pub mut:
	x f32
	y f32
}

pub struct Vector3 {
pub mut:
	x f32
	y f32
	z f32
}

pub struct Vector4 {
pub mut:
	x f32
	y f32
	z f32
	w f32
}

type Quaternion = Vector4

pub struct Matrix {
pub mut:
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

pub struct Color {
pub mut:
	r u8
	g u8
	b u8
	a u8
}

pub struct Rectangle {
pub mut:
	x      f32
	y      f32
	width  f32
	height f32
}

pub struct Image {
pub mut:
	data    voidptr
	width   int
	height  int
	mipmaps int
	format  int
}

pub struct Texture {
pub mut:
	id      u32
	width   int
	height  int
	mipmaps int
	format  int
}

type Texture2D = Texture
type TextureCubemap = Texture

pub struct RenderTexture {
pub mut:
	id      u32
	texture Texture
	depth   Texture
}

type RenderTexture2D = RenderTexture

pub struct NPatchInfo {
pub mut:
	source Rectangle
	left   int
	top    int
	right  int
	bottom int
	layout int
}

pub struct GlyphInfo {
pub mut:
	value    int
	offsetX  int
	offsetY  int
	advanceX int
	image    Image
}

pub struct Font {
pub mut:
	baseSize     int
	glyphCount   int
	glyphPadding int
	texture      Texture2D
	recs         &Rectangle
	glyphs       &GlyphInfo
}

pub struct Camera3D {
pub mut:
	position   Vector3
	target     Vector3
	up         Vector3
	fovy       f32
	projection int
}

pub struct Camera2D {
pub mut:
	offset   Vector2
	target   Vector2
	rotation f32
	zoom     f32
}

pub struct Mesh {
pub mut:
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

pub struct Shader {
pub mut:
	id   u32
	locs &int
}

pub struct MaterialMap {
pub mut:
	texture Texture2D
	color   Color
	value   f32
}

pub struct Material {
pub mut:
	shader Shader
	maps   &MaterialMap
	params [4]f32
}

pub struct Transform {
pub mut:
	translation Vector3
	rotation    Quaternion
	scale       Vector3
}

pub struct BoneInfo {
pub mut:
	name   [32]i8
	parent int
}

pub struct Model {
pub mut:
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

pub struct ModelAnimation {
pub mut:
	boneCount  int
	frameCount int
	bones      &BoneInfo
	framePoses &&Transform
}

pub struct Ray {
pub mut:
	position  Vector3
	direction Vector3
}

pub struct RayCollision {
pub mut:
	hit      bool
	distance f32
	point    Vector3
	normal   Vector3
}

pub struct BoundingBox {
pub mut:
	min Vector3
	max Vector3
}

pub struct Wave {
pub mut:
	frameCount u32
	sampleRate u32
	sampleSize u32
	channels   u32
	data       voidptr
}

pub struct AudioStream {
pub mut:
	buffer     &RAudioBuffer
	processor  &RAudioProcessor
	sampleRate u32
	sampleSize u32
	channels   u32
}

pub struct Sound {
pub mut:
	stream     AudioStream
	frameCount u32
}

pub struct Music {
pub mut:
	stream     AudioStream
	frameCount u32
	looping    bool
	ctxType    int
	ctxData    voidptr
}

pub struct VrDeviceInfo {
pub mut:
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

pub struct VrStereoConfig {
pub mut:
	projection        [2]Matrix
	viewOffset        [2]Matrix
	leftLensCenter    [2]f32
	rightLensCenter   [2]f32
	leftScreenCenter  [2]f32
	rightScreenCenter [2]f32
	scale             [2]f32
	scaleIn           [2]f32
}

pub struct FilePathList {
pub mut:
	capacity u32
	count    u32
	paths    &&u8
}

// Opaque structs declaration
// NOTE: Actual structs are defined internally in raudio module
pub struct RAudioBuffer {}

pub struct RAudioProcessor {}

pub enum ConfigFlags {
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

pub enum TraceLogLevel {
	log_all = 0
	log_trace
	log_debug
	log_info
	log_warning
	log_error
	log_fatal
	log_none
}

pub enum KeyboardKey {
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

pub enum MouseButton {
	mouse_button_left    = 0
	mouse_button_right   = 1
	mouse_button_middle  = 2
	mouse_button_side    = 3
	mouse_button_extra   = 4
	mouse_button_forward = 5
	mouse_button_back    = 6
}

pub enum MouseCursor {
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

pub enum GamepadButton {
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

pub enum GamepadAxis {
	gamepad_axis_left_x        = 0
	gamepad_axis_left_y        = 1
	gamepad_axis_right_x       = 2
	gamepad_axis_right_y       = 3
	gamepad_axis_left_trigger  = 4
	gamepad_axis_right_trigger = 5
}

pub enum MaterialMapIndex {
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

pub enum ShaderLocationIndex {
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

pub enum ShaderUniformDataType {
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

pub enum ShaderAttributeDataType {
	shader_attrib_float = 0
	shader_attrib_vec2
	shader_attrib_vec3
	shader_attrib_vec4
}

pub enum PixelFormat {
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

pub enum TextureFilter {
	texture_filter_point = 0
	texture_filter_bilinear
	texture_filter_trilinear
	texture_filter_anisotropic_4x
	texture_filter_anisotropic_8x
	texture_filter_anisotropic_16x
}

pub enum TextureWrap {
	texture_wrap_repeat = 0
	texture_wrap_clamp
	texture_wrap_mirror_repeat
	texture_wrap_mirror_clamp
}

pub enum CubemapLayout {
	cubemap_layout_auto_detect = 0
	cubemap_layout_line_vertical
	cubemap_layout_line_horizontal
	cubemap_layout_cross_three_by_four
	cubemap_layout_cross_four_by_three
	cubemap_layout_panorama
}

pub enum FontType {
	font_default = 0
	font_bitmap
	font_sdf
}

pub enum BlendMode {
	blend_alpha = 0
	blend_additive
	blend_multiplied
	blend_add_colors
	blend_subtract_colors
	blend_alpha_premultiply
	blend_custom
}

pub enum Gesture {
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

pub enum CameraMode {
	camera_custom = 0
	camera_free
	camera_orbital
	camera_first_person
	camera_third_person
}

pub enum CameraProjection {
	camera_perspective = 0
	camera_orthographic
}

pub enum NPatchLayout {
	npatch_nine_patch = 0
	npatch_three_patch_vertical
	npatch_three_patch_horizontal
}

pub type Camera = Camera3D

// Camera type fallback, defaults to Camera3D

pub type TraceLogCallback = fn (log_level int, text &char, args voidptr)

pub type LoadFileDataCallback = fn (&char, &u32) &u8

pub type SaveFileDataCallback = fn (&char, voidptr, u32) bool

pub type LoadFileTextCallback = fn (&char) &char

pub type SaveFileTextCallback = fn (&char, &char) bool

@[c: 'InitWindow']
pub fn init_window(width int, height int, title &char)

@[c: 'CloseWindow']
pub fn close_window()

@[c: 'SetWindowState']
pub fn set_window_state(flags u32)

@[c: 'ClearWindowState']
pub fn clear_window_state(flags u32)

@[c: 'ToggleFullscreen']
pub fn toggle_fullscreen()

@[c: 'MaximizeWindow']
pub fn maximize_window()

@[c: 'MinimizeWindow']
pub fn minimize_window()

@[c: 'RestoreWindow']
pub fn restore_window()

@[c: 'SetWindowIcon']
pub fn set_window_icon(image Image)

@[c: 'SetWindowTitle']
pub fn set_window_title(title &char)

@[c: 'SetWindowPosition']
pub fn set_window_position(x int, y int)

@[c: 'SetWindowMonitor']
pub fn set_window_monitor(monitor int)

@[c: 'SetWindowMinSize']
pub fn set_window_min_size(width int, height int)

@[c: 'SetWindowSize']
pub fn set_window_size(width int, height int)

@[c: 'SetWindowOpacity']
pub fn set_window_opacity(opacity f32)

@[c: 'GetWindowHandle']
pub fn get_window_handle() voidptr

@[c: 'GetScreenWidth']
pub fn get_screen_width() int

@[c: 'GetScreenHeight']
pub fn get_screen_height() int

@[c: 'GetRenderWidth']
pub fn get_render_width() int

@[c: 'GetRenderHeight']
pub fn get_render_height() int

@[c: 'GetMonitorCount']
pub fn get_monitor_count() int

@[c: 'GetCurrentMonitor']
pub fn get_current_monitor() int

@[c: 'GetMonitorPosition']
pub fn get_monitor_position(monitor int) Vector2

@[c: 'GetMonitorWidth']
pub fn get_monitor_width(monitor int) int

@[c: 'GetMonitorHeight']
pub fn get_monitor_height(monitor int) int

@[c: 'GetMonitorPhysicalWidth']
pub fn get_monitor_physical_width(monitor int) int

@[c: 'GetMonitorPhysicalHeight']
pub fn get_monitor_physical_height(monitor int) int

@[c: 'GetMonitorRefreshRate']
pub fn get_monitor_refresh_rate(monitor int) int

@[c: 'GetWindowPosition']
pub fn get_window_position() Vector2

@[c: 'GetWindowScaleDPI']
pub fn get_window_scale_dpi() Vector2

@[c: 'GetMonitorName']
pub fn get_monitor_name(monitor int) &char

@[c: 'SetClipboardText']
pub fn set_clipboard_text(text &char)

@[c: 'GetClipboardText']
pub fn get_clipboard_text() &char

@[c: 'EnableEventWaiting']
pub fn enable_event_waiting()

@[c: 'DisableEventWaiting']
pub fn disable_event_waiting()

@[c: 'SwapScreenBuffer']
pub fn swap_screen_buffer()

@[c: 'PollInputEvents']
pub fn poll_input_events()

@[c: 'WaitTime']
pub fn wait_time(seconds f64)

@[c: 'ShowCursor']
pub fn show_cursor()

@[c: 'HideCursor']
pub fn hide_cursor()

@[c: 'EnableCursor']
pub fn enable_cursor()

@[c: 'DisableCursor']
pub fn disable_cursor()

@[c: 'ClearBackground']
pub fn clear_background(color Color)

@[c: 'BeginDrawing']
pub fn begin_drawing()

@[c: 'EndDrawing']
pub fn end_drawing()

@[c: 'BeginMode2D']
pub fn begin_mode2D(camera Camera2D)

@[c: 'EndMode2D']
pub fn end_mode2D()

@[c: 'BeginMode3D']
pub fn begin_mode3D(camera Camera3D)

@[c: 'EndMode3D']
pub fn end_mode3D()

@[c: 'BeginTextureMode']
pub fn begin_texture_mode(target RenderTexture2D)

@[c: 'EndTextureMode']
pub fn end_texture_mode()

@[c: 'BeginShaderMode']
pub fn begin_shader_mode(shader Shader)

@[c: 'EndShaderMode']
pub fn end_shader_mode()

@[c: 'BeginBlendMode']
pub fn begin_blend_mode(mode int)

@[c: 'EndBlendMode']
pub fn end_blend_mode()

@[c: 'BeginScissorMode']
pub fn begin_scissor_mode(x int, y int, width int, height int)

@[c: 'EndScissorMode']
pub fn end_scissor_mode()

@[c: 'BeginVrStereoMode']
pub fn begin_vr_stereo_mode(config VrStereoConfig)

@[c: 'EndVrStereoMode']
pub fn end_vr_stereo_mode()

@[c: 'LoadVrStereoConfig']
pub fn load_vr_stereo_config(device VrDeviceInfo) VrStereoConfig

@[c: 'UnloadVrStereoConfig']
pub fn unload_vr_stereo_config(config VrStereoConfig)

@[c: 'LoadShader']
pub fn load_shader(vsfilename &char, fsfilename &char) Shader

@[c: 'LoadShaderFromMemory']
pub fn load_shader_from_memory(vscode &char, fscode &char) Shader

@[c: 'GetShaderLocation']
pub fn get_shader_location(shader Shader, uniformname &char) int

@[c: 'GetShaderLocationAttrib']
pub fn get_shader_location_attrib(shader Shader, attribname &char) int

@[c: 'SetShaderValue']
pub fn set_shader_value(shader Shader, locindex int, value voidptr, uniformtype int)

@[c: 'SetShaderValueV']
pub fn set_shader_value_v(shader Shader, locindex int, value voidptr, uniformtype int, count int)

@[c: 'SetShaderValueMatrix']
pub fn set_shader_value_matrix(shader Shader, locindex int, mat Matrix)

@[c: 'SetShaderValueTexture']
pub fn set_shader_value_texture(shader Shader, locindex int, texture Texture2D)

@[c: 'UnloadShader']
pub fn unload_shader(shader Shader)

@[c: 'GetMouseRay']
pub fn get_mouse_ray(mouseposition Vector2, camera Camera) Ray

@[c: 'GetCameraMatrix']
pub fn get_camera_matrix(camera Camera) Matrix

@[c: 'GetCameraMatrix2D']
pub fn get_camera_matrix2D(camera Camera2D) Matrix

@[c: 'GetWorldToScreen']
pub fn get_world_to_screen(position Vector3, camera Camera) Vector2

@[c: 'GetScreenToWorld2D']
pub fn get_screen_to_world2D(position Vector2, camera Camera2D) Vector2

@[c: 'GetWorldToScreenEx']
pub fn get_world_to_screen_ex(position Vector3, camera Camera, width int, height int) Vector2

@[c: 'GetWorldToScreen2D']
pub fn get_world_to_screen2D(position Vector2, camera Camera2D) Vector2

@[c: 'SetTargetFPS']
pub fn set_target_fps(fps int)

@[c: 'GetFPS']
pub fn get_fps() int

@[c: 'GetFrameTime']
pub fn get_frame_time() f32

@[c: 'GetTime']
pub fn get_time() f64

@[c: 'GetRandomValue']
pub fn get_random_value(min int, max int) int

@[c: 'SetRandomSeed']
pub fn set_random_seed(seed u32)

@[c: 'TakeScreenshot']
pub fn take_screenshot(filename &char)

@[c: 'SetConfigFlags']
pub fn set_config_flags(flags u32)

@[c: 'TraceLog']
@[ctraceLog]
pub fn tracelog(loglevel int, text ...&char)

@[c: 'SetTraceLogLevel']
pub fn set_trace_log_level(loglevel int)

@[c: 'MemAlloc']
pub fn mem_alloc(size int) voidptr

@[c: 'MemRealloc']
pub fn mem_realloc(ptr voidptr, size int) voidptr

@[c: 'MemFree']
pub fn mem_free(ptr voidptr)

@[c: 'OpenURL']
pub fn open_url(url &char)

@[c: 'SetTraceLogCallback']
pub fn set_trace_log_callback(callback TraceLogCallback)

@[c: 'SetLoadFileDataCallback']
pub fn set_load_file_data_callback(callback LoadFileDataCallback)

@[c: 'SetSaveFileDataCallback']
pub fn set_save_file_data_callback(callback SaveFileDataCallback)

@[c: 'SetLoadFileTextCallback']
pub fn set_load_file_text_callback(callback LoadFileTextCallback)

@[c: 'SetSaveFileTextCallback']
pub fn set_save_file_text_callback(callback SaveFileTextCallback)

@[c: 'LoadFileData']
pub fn load_file_data(filename &char, bytesread &u32) &u8

@[c: 'UnloadFileData']
pub fn unload_file_data(data &u8)

@[c: 'LoadFileText']
pub fn load_file_text(filename &char) &char

@[c: 'UnloadFileText']
pub fn unload_file_text(text &char)

@[c: 'GetFileLength']
pub fn get_file_length(filename &char) int

@[c: 'GetFileExtension']
pub fn get_file_extension(filename &char) &char

@[c: 'GetFileName']
pub fn get_file_name(filepath &char) &char

@[c: 'GetFileNameWithoutExt']
pub fn get_file_name_without_ext(filepath &char) &char

@[c: 'GetDirectoryPath']
pub fn get_directory_path(filepath &char) &char

@[c: 'GetPrevDirectoryPath']
pub fn get_prev_directory_path(dirpath &char) &char

@[c: 'GetWorkingDirectory']
pub fn get_working_directory() &char

@[c: 'GetApplicationDirectory']
pub fn get_application_directory() &char

@[c: 'LoadDirectoryFiles']
pub fn load_directory_files(dirpath &char) FilePathList

@[c: 'LoadDirectoryFilesEx']
pub fn load_directory_files_ex(basepath &char, filter &char, scansubdirs bool) FilePathList

@[c: 'UnloadDirectoryFiles']
pub fn unload_directory_files(files FilePathList)

@[c: 'LoadDroppedFiles']
pub fn load_dropped_files() FilePathList

@[c: 'UnloadDroppedFiles']
pub fn unload_dropped_files(files FilePathList)

@[c: 'GetFileModTime']
pub fn get_file_mod_time(filename &char) int

@[c: 'CompressData']
pub fn compress_data(data &u8, datasize int, compdatasize &int) &u8

@[c: 'DecompressData']
pub fn decompress_data(compdata &u8, compdatasize int, datasize &int) &u8

@[c: 'EncodeDataBase64']
pub fn encode_data_base64(data &u8, datasize int, outputsize &int) &char

@[c: 'DecodeDataBase64']
pub fn decode_data_base64(data &char, outputsize &int) &u8

@[c: 'SetExitKey']
pub fn set_exit_key(key int)

@[c: 'GetKeyPressed']
pub fn get_key_pressed() int

@[c: 'GetCharPressed']
pub fn get_char_pressed() int

@[c: 'GetGamepadName']
pub fn get_gamepad_name(gamepad int) &char

@[c: 'GetGamepadButtonPressed']
pub fn get_gamepad_button_pressed() int

@[c: 'GetGamepadAxisCount']
pub fn get_gamepad_axis_count(gamepad int) int

@[c: 'GetGamepadAxisMovement']
pub fn get_gamepad_axis_movement(gamepad int, axis int) f32

@[c: 'SetGamepadMappings']
pub fn set_gamepad_mappings(mappings &i8) int

@[c: 'GetMouseX']
pub fn get_mouse_x() int

@[c: 'GetMouseY']
pub fn get_mouse_y() int

@[c: 'GetMousePosition']
pub fn get_mouse_position() Vector2

@[c: 'GetMouseDelta']
pub fn get_mouse_delta() Vector2

@[c: 'SetMousePosition']
pub fn set_mouse_position(x int, y int)

@[c: 'SetMouseOffset']
pub fn set_mouse_offset(offsetx int, offsety int)

@[c: 'SetMouseScale']
pub fn set_mouse_scale(scalex f32, scaley f32)

@[c: 'GetMouseWheelMove']
pub fn get_mouse_wheel_move() f32

@[c: 'GetMouseWheelMoveV']
pub fn get_mouse_wheel_move_v() Vector2

@[c: 'SetMouseCursor']
pub fn set_mouse_cursor(cursor int)

@[c: 'GetTouchX']
pub fn get_touch_x() int

@[c: 'GetTouchY']
pub fn get_touch_y() int

@[c: 'GetTouchPosition']
pub fn get_touch_position(index int) Vector2

@[c: 'GetTouchPointId']
pub fn get_touch_point_id(index int) int

@[c: 'GetTouchPointCount']
pub fn get_touch_point_count() int

@[c: 'SetGesturesEnabled']
pub fn set_gestures_enabled(flags u32)

@[c: 'GetGestureDetected']
pub fn get_gesture_detected() int

@[c: 'GetGestureHoldDuration']
pub fn get_gesture_hold_duration() f32

@[c: 'GetGestureDragVector']
pub fn get_gesture_drag_vector() Vector2

@[c: 'GetGestureDragAngle']
pub fn get_gesture_drag_angle() f32

@[c: 'GetGesturePinchVector']
pub fn get_gesture_pinch_vector() Vector2

@[c: 'GetGesturePinchAngle']
pub fn get_gesture_pinch_angle() f32

@[c: 'SetCameraMode']
pub fn set_camera_mode(camera Camera, mode int)

@[c: 'UpdateCamera']
pub fn update_camera(camera &Camera)

@[c: 'SetCameraPanControl']
pub fn set_camera_pan_control(keypan int)

@[c: 'SetCameraAltControl']
pub fn set_camera_alt_control(keyalt int)

@[c: 'SetCameraSmoothZoomControl']
pub fn set_camera_smooth_zoom_control(keysmoothzoom int)

@[c: 'SetCameraMoveControls']
pub fn set_camera_move_controls(keyfront int, keyback int, keyright int, keyleft int, keyup int, keydown int)

@[c: 'SetShapesTexture']
pub fn set_shapes_texture(texture Texture2D, source Rectangle)

@[c: 'DrawPixel']
pub fn draw_pixel(posx int, posy int, color Color)

@[c: 'DrawPixelV']
pub fn draw_pixel_v(position Vector2, color Color)

@[c: 'DrawLine']
pub fn draw_line(startposx int, startposy int, endposx int, endposy int, color Color)

@[c: 'DrawLineV']
pub fn draw_line_v(startpos Vector2, endpos Vector2, color Color)

@[c: 'DrawLineEx']
pub fn draw_line_ex(startpos Vector2, endpos Vector2, thick f32, color Color)

@[c: 'DrawLineBezier']
pub fn draw_line_bezier(startpos Vector2, endpos Vector2, thick f32, color Color)

@[c: 'DrawLineBezierQuad']
pub fn draw_line_bezier_quad(startpos Vector2, endpos Vector2, controlpos Vector2, thick f32, color Color)

@[c: 'DrawLineBezierCubic']
pub fn draw_line_bezier_cubic(startpos Vector2, endpos Vector2, startcontrolpos Vector2, endcontrolpos Vector2, thick f32, color Color)

@[c: 'DrawLineStrip']
pub fn draw_line_strip(points &Vector2, pointcount int, color Color)

@[c: 'DrawCircle']
pub fn draw_circle(centerx int, centery int, radius f32, color Color)

@[c: 'DrawCircleSector']
pub fn draw_circle_sector(center Vector2, radius f32, startangle f32, endangle f32, segments int, color Color)

@[c: 'DrawCircleSectorLines']
pub fn draw_circle_sector_lines(center Vector2, radius f32, startangle f32, endangle f32, segments int, color Color)

@[c: 'DrawCircleGradient']
pub fn draw_circle_gradient(centerx int, centery int, radius f32, color1 Color, color2 Color)

@[c: 'DrawCircleV']
pub fn draw_circle_v(center Vector2, radius f32, color Color)

@[c: 'DrawCircleLines']
pub fn draw_circle_lines(centerx int, centery int, radius f32, color Color)

@[c: 'DrawEllipse']
pub fn draw_ellipse(centerx int, centery int, radiush f32, radiusv f32, color Color)

@[c: 'DrawEllipseLines']
pub fn draw_ellipse_lines(centerx int, centery int, radiush f32, radiusv f32, color Color)

@[c: 'DrawRing']
pub fn draw_ring(center Vector2, innerradius f32, outerradius f32, startangle f32, endangle f32, segments int, color Color)

@[c: 'DrawRingLines']
pub fn draw_ring_lines(center Vector2, innerradius f32, outerradius f32, startangle f32, endangle f32, segments int, color Color)

@[c: 'DrawRectangle']
pub fn draw_rectangle(posx int, posy int, width int, height int, color Color)

@[c: 'DrawRectangleV']
pub fn draw_rectangle_v(position Vector2, size Vector2, color Color)

@[c: 'DrawRectangleRec']
pub fn draw_rectangle_rec(rec Rectangle, color Color)

@[c: 'DrawRectanglePro']
pub fn draw_rectangle_pro(rec Rectangle, origin Vector2, rotation f32, color Color)

@[c: 'DrawRectangleGradientV']
pub fn draw_rectangle_gradient_v(posx int, posy int, width int, height int, color1 Color, color2 Color)

@[c: 'DrawRectangleGradientH']
pub fn draw_rectangle_gradient_h(posx int, posy int, width int, height int, color1 Color, color2 Color)

@[c: 'DrawRectangleGradientEx']
pub fn draw_rectangle_gradient_ex(rec Rectangle, col1 Color, col2 Color, col3 Color, col4 Color)

@[c: 'DrawRectangleLines']
pub fn draw_rectangle_lines(posx int, posy int, width int, height int, color Color)

@[c: 'DrawRectangleLinesEx']
pub fn draw_rectangle_lines_ex(rec Rectangle, linethick f32, color Color)

@[c: 'DrawRectangleRounded']
pub fn draw_rectangle_rounded(rec Rectangle, roundness f32, segments int, color Color)

@[c: 'DrawRectangleRoundedLines']
pub fn draw_rectangle_rounded_lines(rec Rectangle, roundness f32, segments int, linethick f32, color Color)

@[c: 'DrawTriangle']
pub fn draw_triangle(v1 Vector2, v2 Vector2, v3 Vector2, color Color)

@[c: 'DrawTriangleLines']
pub fn draw_triangle_lines(v1 Vector2, v2 Vector2, v3 Vector2, color Color)

@[c: 'DrawTriangleFan']
pub fn draw_triangle_fan(points &Vector2, pointcount int, color Color)

@[c: 'DrawTriangleStrip']
pub fn draw_triangle_strip(points &Vector2, pointcount int, color Color)

@[c: 'DrawPoly']
pub fn draw_poly(center Vector2, sides int, radius f32, rotation f32, color Color)

@[c: 'DrawPolyLines']
pub fn draw_poly_lines(center Vector2, sides int, radius f32, rotation f32, color Color)

@[c: 'DrawPolyLinesEx']
pub fn draw_poly_lines_ex(center Vector2, sides int, radius f32, rotation f32, linethick f32, color Color)

@[c: 'GetCollisionRec']
pub fn get_collision_rec(rec1 Rectangle, rec2 Rectangle) Rectangle

@[c: 'LoadImage']
pub fn load_image(filename &char) Image

@[c: 'LoadImageRaw']
pub fn load_image_raw(filename &char, width int, height int, format int, headersize int) Image

@[c: 'LoadImageAnim']
pub fn load_image_anim(filename &char, frames &int) Image

@[c: 'LoadImageFromMemory']
pub fn load_image_from_memory(filetype &char, filedata &u8, datasize int) Image

@[c: 'LoadImageFromTexture']
pub fn load_image_from_texture(texture Texture2D) Image

@[c: 'LoadImageFromScreen']
pub fn load_image_from_screen() Image

@[c: 'UnloadImage']
pub fn unload_image(image Image)

@[c: 'GenImageColor']
pub fn gen_image_color(width int, height int, color Color) Image

@[c: 'GenImageGradientV']
pub fn gen_image_gradient_v(width int, height int, top Color, bottom Color) Image

@[c: 'GenImageGradientH']
pub fn gen_image_gradient_h(width int, height int, left Color, right Color) Image

@[c: 'GenImageGradientRadial']
pub fn gen_image_gradient_radial(width int, height int, density f32, inner Color, outer Color) Image

@[c: 'GenImageChecked']
pub fn gen_image_checked(width int, height int, checksx int, checksy int, col1 Color, col2 Color) Image

@[c: 'GenImageWhiteNoise']
pub fn gen_image_white_noise(width int, height int, factor f32) Image

@[c: 'GenImageCellular']
pub fn gen_image_cellular(width int, height int, tilesize int) Image

@[c: 'ImageCopy']
pub fn image_copy(image Image) Image

@[c: 'ImageFromImage']
pub fn image_from_image(image Image, rec Rectangle) Image

@[c: 'ImageText']
pub fn image_text(text &char, fontsize int, color Color) Image

@[c: 'ImageTextEx']
pub fn image_text_ex(font Font, text &char, fontsize f32, spacing f32, tint Color) Image

@[c: 'ImageFormat']
pub fn image_format(image &Image, newformat int)

@[c: 'ImageToPOT']
pub fn image_to_pot(image &Image, fill Color)

@[c: 'ImageCrop']
pub fn image_crop(image &Image, crop Rectangle)

@[c: 'ImageAlphaCrop']
pub fn image_alpha_crop(image &Image, threshold f32)

@[c: 'ImageAlphaClear']
pub fn image_alpha_clear(image &Image, color Color, threshold f32)

@[c: 'ImageAlphaMask']
pub fn image_alpha_mask(image &Image, alphamask Image)

@[c: 'ImageAlphaPremultiply']
pub fn image_alpha_premultiply(image &Image)

@[c: 'ImageResize']
pub fn image_resize(image &Image, newwidth int, newheight int)

@[c: 'ImageResizeNN']
pub fn image_resize_nn(image &Image, newwidth int, newheight int)

@[c: 'ImageResizeCanvas']
pub fn image_resize_canvas(image &Image, newwidth int, newheight int, offsetx int, offsety int, fill Color)

@[c: 'ImageMipmaps']
pub fn image_mipmaps(image &Image)

@[c: 'ImageDither']
pub fn image_dither(image &Image, rbpp int, gbpp int, bbpp int, abpp int)

@[c: 'ImageFlipVertical']
pub fn image_flip_vertical(image &Image)

@[c: 'ImageFlipHorizontal']
pub fn image_flip_horizontal(image &Image)

@[c: 'ImageRotateCW']
pub fn image_rotate_cw(image &Image)

@[c: 'ImageRotateCCW']
pub fn image_rotate_ccw(image &Image)

@[c: 'ImageColorTint']
pub fn image_color_tint(image &Image, color Color)

@[c: 'ImageColorInvert']
pub fn image_color_invert(image &Image)

@[c: 'ImageColorGrayscale']
pub fn image_color_grayscale(image &Image)

@[c: 'ImageColorContrast']
pub fn image_color_contrast(image &Image, contrast f32)

@[c: 'ImageColorBrightness']
pub fn image_color_brightness(image &Image, brightness int)

@[c: 'ImageColorReplace']
pub fn image_color_replace(image &Image, color Color, replace Color)

@[c: 'LoadImageColors']
pub fn load_image_colors(image Image) &Color

@[c: 'LoadImagePalette']
pub fn load_image_palette(image Image, maxpalettesize int, colorcount &int) &Color

@[c: 'UnloadImageColors']
pub fn unload_image_colors(colors &Color)

@[c: 'UnloadImagePalette']
pub fn unload_image_palette(colors &Color)

@[c: 'GetImageAlphaBorder']
pub fn get_image_alpha_border(image Image, threshold f32) Rectangle

@[c: 'GetImageColor']
pub fn get_image_color(image Image, x int, y int) Color

@[c: 'ImageClearBackground']
pub fn image_clear_background(dst &Image, color Color)

@[c: 'ImageDrawPixel']
pub fn image_draw_pixel(dst &Image, posx int, posy int, color Color)

@[c: 'ImageDrawPixelV']
pub fn image_draw_pixel_v(dst &Image, position Vector2, color Color)

@[c: 'ImageDrawLine']
pub fn image_draw_line(dst &Image, startposx int, startposy int, endposx int, endposy int, color Color)

@[c: 'ImageDrawLineV']
pub fn image_draw_line_v(dst &Image, start Vector2, end Vector2, color Color)

@[c: 'ImageDrawCircle']
pub fn image_draw_circle(dst &Image, centerx int, centery int, radius int, color Color)

@[c: 'ImageDrawCircleV']
pub fn image_draw_circle_v(dst &Image, center Vector2, radius int, color Color)

@[c: 'ImageDrawRectangle']
pub fn image_draw_rectangle(dst &Image, posx int, posy int, width int, height int, color Color)

@[c: 'ImageDrawRectangleV']
pub fn image_draw_rectangle_v(dst &Image, position Vector2, size Vector2, color Color)

@[c: 'ImageDrawRectangleRec']
pub fn image_draw_rectangle_rec(dst &Image, rec Rectangle, color Color)

@[c: 'ImageDrawRectangleLines']
pub fn image_draw_rectangle_lines(dst &Image, rec Rectangle, thick int, color Color)

@[c: 'ImageDraw']
pub fn image_draw(dst &Image, src Image, srcrec Rectangle, dstrec Rectangle, tint Color)

@[c: 'ImageDrawText']
pub fn image_draw_text(dst &Image, text &char, posx int, posy int, fontsize int, color Color)

@[c: 'ImageDrawTextEx']
pub fn image_draw_text_ex(dst &Image, font Font, text &char, position Vector2, fontsize f32, spacing f32, tint Color)

@[c: 'LoadTexture']
pub fn load_texture(filename &char) Texture2D

@[c: 'LoadTextureFromImage']
pub fn load_texture_from_image(image Image) Texture2D

@[c: 'LoadTextureCubemap']
pub fn load_texture_cubemap(image Image, layout int) TextureCubemap

@[c: 'LoadRenderTexture']
pub fn load_render_texture(width int, height int) RenderTexture2D

@[c: 'UnloadTexture']
pub fn unload_texture(texture Texture2D)

@[c: 'UnloadRenderTexture']
pub fn unload_render_texture(target RenderTexture2D)

@[c: 'UpdateTexture']
pub fn update_texture(texture Texture2D, pixels voidptr)

@[c: 'UpdateTextureRec']
pub fn update_texture_rec(texture Texture2D, rec Rectangle, pixels voidptr)

@[c: 'GenTextureMipmaps']
pub fn gen_texture_mipmaps(texture &Texture2D)

@[c: 'SetTextureFilter']
pub fn set_texture_filter(texture Texture2D, filter int)

@[c: 'SetTextureWrap']
pub fn set_texture_wrap(texture Texture2D, wrap int)

@[c: 'DrawTexture']
pub fn draw_texture(texture Texture2D, posx int, posy int, tint Color)

@[c: 'DrawTextureV']
pub fn draw_texture_v(texture Texture2D, position Vector2, tint Color)

@[c: 'DrawTextureEx']
pub fn draw_texture_ex(texture Texture2D, position Vector2, rotation f32, scale f32, tint Color)

@[c: 'DrawTextureRec']
pub fn draw_texture_rec(texture Texture2D, source Rectangle, position Vector2, tint Color)

@[c: 'DrawTextureQuad']
pub fn draw_texture_quad(texture Texture2D, tiling Vector2, offset Vector2, quad Rectangle, tint Color)

@[c: 'DrawTextureTiled']
pub fn draw_texture_tiled(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, scale f32, tint Color)

@[c: 'DrawTexturePro']
pub fn draw_texture_pro(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, tint Color)

@[c: 'DrawTextureNPatch']
pub fn draw_texture_n_patch(texture Texture2D, npatchinfo NPatchInfo, dest Rectangle, origin Vector2, rotation f32, tint Color)

@[c: 'DrawTexturePoly']
pub fn draw_texture_poly(texture Texture2D, center Vector2, points &Vector2, texcoords &Vector2, pointcount int, tint Color)

@[c: 'Fade']
pub fn fade(color Color, alpha f32) Color

@[c: 'ColorToInt']
pub fn color_to_int(color Color) int

@[c: 'ColorNormalize']
pub fn color_normalize(color Color) Vector4

@[c: 'ColorFromNormalized']
pub fn color_from_normalized(normalized Vector4) Color

@[c: 'ColorToHSV']
pub fn color_to_hsv(color Color) Vector3

@[c: 'ColorFromHSV']
pub fn color_from_hsv(hue f32, saturation f32, value f32) Color

@[c: 'ColorAlpha']
pub fn color_alpha(color Color, alpha f32) Color

@[c: 'ColorAlphaBlend']
pub fn color_alpha_blend(dst Color, src Color, tint Color) Color

@[c: 'GetColor']
pub fn get_color(hexvalue u32) Color

@[c: 'GetPixelColor']
pub fn get_pixel_color(srcptr voidptr, format int) Color

@[c: 'SetPixelColor']
pub fn set_pixel_color(dstptr voidptr, color Color, format int)

@[c: 'GetPixelDataSize']
pub fn get_pixel_data_size(width int, height int, format int) int

@[c: 'GetFontDefault']
pub fn get_font_default() Font

@[c: 'LoadFont']
pub fn load_font(filename &char) Font

@[c: 'LoadFontEx']
pub fn load_font_ex(filename &char, fontsize int, fontchars &int, glyphcount int) Font

@[c: 'LoadFontFromImage']
pub fn load_font_from_image(image Image, key Color, firstchar int) Font

@[c: 'LoadFontFromMemory']
pub fn load_font_from_memory(filetype &char, filedata &u8, datasize int, fontsize int, fontchars &int, glyphcount int) Font

@[c: 'LoadFontData']
pub fn load_font_data(filedata &u8, datasize int, fontsize int, fontchars &int, glyphcount int, type_ int) &GlyphInfo

@[c: 'GenImageFontAtlas']
pub fn gen_image_font_atlas(chars &GlyphInfo, recs &&Rectangle, glyphcount int, fontsize int, padding int, packmethod int) Image

@[c: 'UnloadFontData']
pub fn unload_font_data(chars &GlyphInfo, glyphcount int)

@[c: 'UnloadFont']
pub fn unload_font(font Font)

@[c: 'DrawFPS']
pub fn draw_fps(posx int, posy int)

@[c: 'DrawText']
pub fn draw_text(text &char, posx int, posy int, fontsize int, color Color)

@[c: 'DrawTextEx']
pub fn draw_text_ex(font Font, text &char, position Vector2, fontsize f32, spacing f32, tint Color)

@[c: 'DrawTextPro']
pub fn draw_text_pro(font Font, text &char, position Vector2, origin Vector2, rotation f32, fontsize f32, spacing f32, tint Color)

@[c: 'DrawTextCodepoint']
pub fn draw_text_codepoint(font Font, codepoint int, position Vector2, fontsize f32, tint Color)

@[c: 'DrawTextCodepoints']
pub fn draw_text_codepoints(font Font, codepoints &int, count int, position Vector2, fontsize f32, spacing f32, tint Color)

@[c: 'MeasureText']
pub fn measure_text(text &char, fontsize int) int

@[c: 'MeasureTextEx']
pub fn measure_text_ex(font Font, text &char, fontsize f32, spacing f32) Vector2

@[c: 'GetGlyphIndex']
pub fn get_glyph_index(font Font, codepoint int) int

@[c: 'GetGlyphInfo']
pub fn get_glyph_info(font Font, codepoint int) GlyphInfo

@[c: 'GetGlyphAtlasRec']
pub fn get_glyph_atlas_rec(font Font, codepoint int) Rectangle

@[c: 'LoadCodepoints']
pub fn load_codepoints(text &char, count &int) &int

@[c: 'UnloadCodepoints']
pub fn unload_codepoints(codepoints &int)

@[c: 'GetCodepointCount']
pub fn get_codepoint_count(text &char) int

@[c: 'GetCodepoint']
pub fn get_codepoint(text &char, bytesprocessed &int) int

@[c: 'CodepointToUTF8']
pub fn codepoint_to_utf8(codepoint int, bytesize &int) &char

@[c: 'TextCodepointsToUTF8']
pub fn text_codepoints_to_utf8(codepoints &int, length int) &char

@[c: 'TextCopy']
pub fn text_copy(dst &char, src &char) int

@[c: 'TextLength']
pub fn text_length(text &char) u32

@[c: 'TextFormat']
@[ctextFormat]
pub fn textformat(text ...&char) &char

@[c: 'TextSubtext']
pub fn text_subtext(text &char, position int, length int) &char

@[c: 'TextReplace']
pub fn text_replace(text &char, replace &char, by &char) &char

@[c: 'TextInsert']
pub fn text_insert(text &char, insert &char, position int) &char

@[c: 'TextJoin']
pub fn text_join(textlist &&char, count int, delimiter &char) &char

@[c: 'TextSplit']
pub fn text_split(text &char, delimiter char, count &int) &&char

@[c: 'TextAppend']
pub fn text_append(text &char, append &char, position &int)

@[c: 'TextFindIndex']
pub fn text_find_index(text &char, find &char) int

@[c: 'TextToUpper']
pub fn text_to_upper(text &char) &char

@[c: 'TextToLower']
pub fn text_to_lower(text &char) &char

@[c: 'TextToPascal']
pub fn text_to_pascal(text &char) &char

@[c: 'TextToInteger']
pub fn text_to_integer(text &char) int

@[c: 'DrawLine3D']
pub fn draw_line3D(startpos Vector3, endpos Vector3, color Color)

@[c: 'DrawPoint3D']
pub fn draw_point3D(position Vector3, color Color)

@[c: 'DrawCircle3D']
pub fn draw_circle3D(center Vector3, radius f32, rotationaxis Vector3, rotationangle f32, color Color)

@[c: 'DrawTriangle3D']
pub fn draw_triangle3D(v1 Vector3, v2 Vector3, v3 Vector3, color Color)

@[c: 'DrawTriangleStrip3D']
pub fn draw_triangle_strip3D(points &Vector3, pointcount int, color Color)

@[c: 'DrawCube']
pub fn draw_cube(position Vector3, width f32, height f32, length f32, color Color)

@[c: 'DrawCubeV']
pub fn draw_cube_v(position Vector3, size Vector3, color Color)

@[c: 'DrawCubeWires']
pub fn draw_cube_wires(position Vector3, width f32, height f32, length f32, color Color)

@[c: 'DrawCubeWiresV']
pub fn draw_cube_wires_v(position Vector3, size Vector3, color Color)

@[c: 'DrawCubeTexture']
pub fn draw_cube_texture(texture Texture2D, position Vector3, width f32, height f32, length f32, color Color)

@[c: 'DrawCubeTextureRec']
pub fn draw_cube_texture_rec(texture Texture2D, source Rectangle, position Vector3, width f32, height f32, length f32, color Color)

@[c: 'DrawSphere']
pub fn draw_sphere(centerpos Vector3, radius f32, color Color)

@[c: 'DrawSphereEx']
pub fn draw_sphere_ex(centerpos Vector3, radius f32, rings int, slices int, color Color)

@[c: 'DrawSphereWires']
pub fn draw_sphere_wires(centerpos Vector3, radius f32, rings int, slices int, color Color)

@[c: 'DrawCylinder']
pub fn draw_cylinder(position Vector3, radiustop f32, radiusbottom f32, height f32, slices int, color Color)

@[c: 'DrawCylinderEx']
pub fn draw_cylinder_ex(startpos Vector3, endpos Vector3, startradius f32, endradius f32, sides int, color Color)

@[c: 'DrawCylinderWires']
pub fn draw_cylinder_wires(position Vector3, radiustop f32, radiusbottom f32, height f32, slices int, color Color)

@[c: 'DrawCylinderWiresEx']
pub fn draw_cylinder_wires_ex(startpos Vector3, endpos Vector3, startradius f32, endradius f32, sides int, color Color)

@[c: 'DrawPlane']
pub fn draw_plane(centerpos Vector3, size Vector2, color Color)

@[c: 'DrawRay']
pub fn draw_ray(ray Ray, color Color)

@[c: 'DrawGrid']
pub fn draw_grid(slices int, spacing f32)

@[c: 'LoadModel']
pub fn load_model(filename &char) Model

@[c: 'LoadModelFromMesh']
pub fn load_model_from_mesh(mesh Mesh) Model

@[c: 'UnloadModel']
pub fn unload_model(model Model)

@[c: 'UnloadModelKeepMeshes']
pub fn unload_model_keep_meshes(model Model)

@[c: 'GetModelBoundingBox']
pub fn get_model_bounding_box(model Model) BoundingBox

@[c: 'DrawModel']
pub fn draw_model(model Model, position Vector3, scale f32, tint Color)

@[c: 'DrawModelEx']
pub fn draw_model_ex(model Model, position Vector3, rotationaxis Vector3, rotationangle f32, scale Vector3, tint Color)

@[c: 'DrawModelWires']
pub fn draw_model_wires(model Model, position Vector3, scale f32, tint Color)

@[c: 'DrawModelWiresEx']
pub fn draw_model_wires_ex(model Model, position Vector3, rotationaxis Vector3, rotationangle f32, scale Vector3, tint Color)

@[c: 'DrawBoundingBox']
pub fn draw_bounding_box(box BoundingBox, color Color)

@[c: 'DrawBillboard']
pub fn draw_billboard(camera Camera, texture Texture2D, position Vector3, size f32, tint Color)

@[c: 'DrawBillboardRec']
pub fn draw_billboard_rec(camera Camera, texture Texture2D, source Rectangle, position Vector3, size Vector2, tint Color)

@[c: 'DrawBillboardPro']
pub fn draw_billboard_pro(camera Camera, texture Texture2D, source Rectangle, position Vector3, up Vector3, size Vector2, origin Vector2, rotation f32, tint Color)

@[c: 'UploadMesh']
pub fn upload_mesh(mesh &Mesh, dynamic bool)

@[c: 'UpdateMeshBuffer']
pub fn update_mesh_buffer(mesh Mesh, index int, data voidptr, datasize int, offset int)

@[c: 'UnloadMesh']
pub fn unload_mesh(mesh Mesh)

@[c: 'DrawMesh']
pub fn draw_mesh(mesh Mesh, material Material, transform Matrix)

@[c: 'DrawMeshInstanced']
pub fn draw_mesh_instanced(mesh Mesh, material Material, transforms &Matrix, instances int)

@[c: 'GetMeshBoundingBox']
pub fn get_mesh_bounding_box(mesh Mesh) BoundingBox

@[c: 'GenMeshTangents']
pub fn gen_mesh_tangents(mesh &Mesh)

@[c: 'GenMeshPoly']
pub fn gen_mesh_poly(sides int, radius f32) Mesh

@[c: 'GenMeshPlane']
pub fn gen_mesh_plane(width f32, length f32, resx int, resz int) Mesh

@[c: 'GenMeshCube']
pub fn gen_mesh_cube(width f32, height f32, length f32) Mesh

@[c: 'GenMeshSphere']
pub fn gen_mesh_sphere(radius f32, rings int, slices int) Mesh

@[c: 'GenMeshHemiSphere']
pub fn gen_mesh_hemi_sphere(radius f32, rings int, slices int) Mesh

@[c: 'GenMeshCylinder']
pub fn gen_mesh_cylinder(radius f32, height f32, slices int) Mesh

@[c: 'GenMeshCone']
pub fn gen_mesh_cone(radius f32, height f32, slices int) Mesh

@[c: 'GenMeshTorus']
pub fn gen_mesh_torus(radius f32, size f32, radseg int, sides int) Mesh

@[c: 'GenMeshKnot']
pub fn gen_mesh_knot(radius f32, size f32, radseg int, sides int) Mesh

@[c: 'GenMeshHeightmap']
pub fn gen_mesh_heightmap(heightmap Image, size Vector3) Mesh

@[c: 'GenMeshCubicmap']
pub fn gen_mesh_cubicmap(cubicmap Image, cubesize Vector3) Mesh

@[c: 'LoadMaterials']
pub fn load_materials(filename &char, materialcount &int) &Material

@[c: 'LoadMaterialDefault']
pub fn load_material_default() Material

@[c: 'UnloadMaterial']
pub fn unload_material(material Material)

@[c: 'SetMaterialTexture']
pub fn set_material_texture(material &Material, maptype int, texture Texture2D)

@[c: 'SetModelMeshMaterial']
pub fn set_model_mesh_material(model &Model, meshid int, materialid int)

@[c: 'LoadModelAnimations']
pub fn load_model_animations(filename &char, animcount &u32) &ModelAnimation

@[c: 'UpdateModelAnimation']
pub fn update_model_animation(model Model, anim ModelAnimation, frame int)

@[c: 'UnloadModelAnimation']
pub fn unload_model_animation(anim ModelAnimation)

@[c: 'UnloadModelAnimations']
pub fn unload_model_animations(animations &ModelAnimation, count u32)

@[c: 'GetRayCollisionSphere']
pub fn get_ray_collision_sphere(ray Ray, center Vector3, radius f32) RayCollision

@[c: 'GetRayCollisionBox']
pub fn get_ray_collision_box(ray Ray, box BoundingBox) RayCollision

@[c: 'GetRayCollisionMesh']
pub fn get_ray_collision_mesh(ray Ray, mesh Mesh, transform Matrix) RayCollision

@[c: 'GetRayCollisionTriangle']
pub fn get_ray_collision_triangle(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3) RayCollision

@[c: 'GetRayCollisionQuad']
pub fn get_ray_collision_quad(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3, p4 Vector3) RayCollision

type AudioCallback = fn (voidptr, u32)

@[c: 'InitAudioDevice']
pub fn init_audio_device()

@[c: 'CloseAudioDevice']
pub fn close_audio_device()

@[c: 'SetMasterVolume']
pub fn set_master_volume(volume f32)

@[c: 'LoadWave']
pub fn load_wave(filename &char) Wave

@[c: 'LoadWaveFromMemory']
pub fn load_wave_from_memory(filetype &char, filedata &u8, datasize int) Wave

@[c: 'LoadSound']
pub fn load_sound(filename &char) Sound

@[c: 'LoadSoundFromWave']
pub fn load_sound_from_wave(wave Wave) Sound

@[c: 'UpdateSound']
pub fn update_sound(sound Sound, data voidptr, samplecount int)

@[c: 'UnloadWave']
pub fn unload_wave(wave Wave)

@[c: 'UnloadSound']
pub fn unload_sound(sound Sound)

@[c: 'PlaySound']
pub fn play_sound(sound Sound)

@[c: 'StopSound']
pub fn stop_sound(sound Sound)

@[c: 'PauseSound']
pub fn pause_sound(sound Sound)

@[c: 'ResumeSound']
pub fn resume_sound(sound Sound)

@[c: 'PlaySoundMulti']
pub fn play_sound_multi(sound Sound)

@[c: 'StopSoundMulti']
pub fn stop_sound_multi()

@[c: 'GetSoundsPlaying']
pub fn get_sounds_playing() int

@[c: 'SetSoundVolume']
pub fn set_sound_volume(sound Sound, volume f32)

@[c: 'SetSoundPitch']
pub fn set_sound_pitch(sound Sound, pitch f32)

@[c: 'SetSoundPan']
pub fn set_sound_pan(sound Sound, pan f32)

@[c: 'WaveCopy']
pub fn wave_copy(wave Wave) Wave

@[c: 'WaveCrop']
pub fn wave_crop(wave &Wave, initsample int, finalsample int)

@[c: 'WaveFormat']
pub fn wave_format(wave &Wave, samplerate int, samplesize int, channels int)

@[c: 'LoadWaveSamples']
pub fn load_wave_samples(wave Wave) &f32

@[c: 'UnloadWaveSamples']
pub fn unload_wave_samples(samples &f32)

@[c: 'LoadMusicStream']
pub fn load_music_stream(filename &char) Music

@[c: 'LoadMusicStreamFromMemory']
pub fn load_music_stream_from_memory(filetype &char, data &u8, datasize int) Music

@[c: 'UnloadMusicStream']
pub fn unload_music_stream(music Music)

@[c: 'PlayMusicStream']
pub fn play_music_stream(music Music)

@[c: 'UpdateMusicStream']
pub fn update_music_stream(music Music)

@[c: 'StopMusicStream']
pub fn stop_music_stream(music Music)

@[c: 'PauseMusicStream']
pub fn pause_music_stream(music Music)

@[c: 'ResumeMusicStream']
pub fn resume_music_stream(music Music)

@[c: 'SeekMusicStream']
pub fn seek_music_stream(music Music, position f32)

@[c: 'SetMusicVolume']
pub fn set_music_volume(music Music, volume f32)

@[c: 'SetMusicPitch']
pub fn set_music_pitch(music Music, pitch f32)

@[c: 'SetMusicPan']
pub fn set_music_pan(music Music, pan f32)

@[c: 'GetMusicTimeLength']
pub fn get_music_time_length(music Music) f32

@[c: 'GetMusicTimePlayed']
pub fn get_music_time_played(music Music) f32

@[c: 'LoadAudioStream']
pub fn load_audio_stream(samplerate u32, samplesize u32, channels u32) AudioStream

@[c: 'UnloadAudioStream']
pub fn unload_audio_stream(stream AudioStream)

@[c: 'UpdateAudioStream']
pub fn update_audio_stream(stream AudioStream, data voidptr, framecount int)

@[c: 'PlayAudioStream']
pub fn play_audio_stream(stream AudioStream)

@[c: 'PauseAudioStream']
pub fn pause_audio_stream(stream AudioStream)

@[c: 'ResumeAudioStream']
pub fn resume_audio_stream(stream AudioStream)

@[c: 'StopAudioStream']
pub fn stop_audio_stream(stream AudioStream)

@[c: 'SetAudioStreamVolume']
pub fn set_audio_stream_volume(stream AudioStream, volume f32)

@[c: 'SetAudioStreamPitch']
pub fn set_audio_stream_pitch(stream AudioStream, pitch f32)

@[c: 'SetAudioStreamPan']
pub fn set_audio_stream_pan(stream AudioStream, pan f32)

@[c: 'SetAudioStreamBufferSizeDefault']
pub fn set_audio_stream_buffer_size_default(size int)

@[c: 'SetAudioStreamCallback']
pub fn set_audio_stream_callback(stream AudioStream, callback AudioCallback)

@[c: 'AttachAudioStreamProcessor']
pub fn attach_audio_stream_processor(stream AudioStream, processor AudioCallback)

@[c: 'DetachAudioStreamProcessor']
pub fn detach_audio_stream_processor(stream AudioStream, processor AudioCallback)

// extra missing bool functions

@[c: 'WindowShouldClose']
pub fn window_should_close() bool

@[c: 'IsWindowReady']
pub fn is_window_ready() bool

@[c: 'IsWindowFullscreen']
pub fn is_window_fullscreen() bool

@[c: 'IsWindowHidden']
pub fn is_window_hidden() bool

@[c: 'IsWindowMinimized']
pub fn is_window_minimized() bool

@[c: 'IsWindowMaximized']
pub fn is_window_maximized() bool

@[c: 'IsWindowFocused']
pub fn is_window_focused() bool

@[c: 'IsWindowResized']
pub fn is_window_resized() bool

@[c: 'IsWindowState']
pub fn is_window_state(flag u32) bool

@[c: 'IsCursorHidden']
pub fn is_cursor_hidden() bool

@[c: 'IsCursorOnScreen']
pub fn is_cursor_on_screen() bool

@[c: 'SaveFileData']
pub fn save_file_data(filename &char, data voidptr, bytestowrite u32) bool

@[c: 'ExportDataAsCode']
pub fn export_data_as_code(data &char, size u32, filename &char) bool

@[c: 'SaveFileText']
pub fn save_file_text(filename &char, text &char) bool

@[c: 'FileExists']
pub fn file_exists(filename &char) bool

@[c: 'DirectoryExists']
pub fn directory_exists(dirpath &char) bool

@[c: 'IsFileExtension']
pub fn is_file_extension(filename &char, ext &char) bool

@[c: 'ChangeDirectory']
pub fn change_directory(dir &char) bool

@[c: 'IsPathFile']
pub fn is_path_file(path &char) bool

@[c: 'IsFileDropped']
pub fn is_file_dropped() bool

@[c: 'IsKeyPressed']
pub fn is_key_pressed(key int) bool

@[c: 'IsKeyDown']
pub fn is_key_down(key int) bool

@[c: 'IsKeyReleased']
pub fn is_key_released(key int) bool

@[c: 'IsKeyUp']
pub fn is_key_up(key int) bool

@[c: 'IsGamepadAvailable']
pub fn is_gamepad_available(gamepad int) bool

@[c: 'IsGamepadButtonPressed']
pub fn is_gamepad_button_pressed(gamepad int, button int) bool

@[c: 'IsGamepadButtonDown']
pub fn is_gamepad_button_down(gamepad int, button int) bool

@[c: 'IsGamepadButtonReleased']
pub fn is_gamepad_button_released(gamepad int, button int) bool

@[c: 'IsGamepadButtonUp']
pub fn is_gamepad_button_up(gamepad int, button int) bool

@[c: 'IsMouseButtonPressed']
pub fn is_mouse_button_pressed(button int) bool

@[c: 'IsMouseButtonDown']
pub fn is_mouse_button_down(button int) bool

@[c: 'IsMouseButtonReleased']
pub fn is_mouse_button_released(button int) bool

@[c: 'IsMouseButtonUp']
pub fn is_mouse_button_up(button int) bool

@[c: 'IsGestureDetected']
pub fn is_gesture_detected(gesture int) bool

@[c: 'CheckCollisionRecs']
pub fn check_collision_recs(rec1 Rectangle, rec2 Rectangle) bool

@[c: 'CheckCollisionCircles']
pub fn check_collision_circles(center1 Vector2, radius1 f32, center2 Vector2, radius2 f32) bool

@[c: 'CheckCollisionCircleRec']
pub fn check_collision_circle_rec(center Vector2, radius f32, rec Rectangle) bool

@[c: 'CheckCollisionPointRec']
pub fn check_collision_point_rec(point Vector2, rec Rectangle) bool

@[c: 'CheckCollisionPointCircle']
pub fn check_collision_point_circle(point Vector2, center Vector2, radius f32) bool

@[c: 'CheckCollisionPointTriangle']
pub fn check_collision_point_triangle(point Vector2, p1 Vector2, p2 Vector2, p3 Vector2) bool

@[c: 'CheckCollisionLines']
pub fn check_collision_lines(startpos1 Vector2, endpos1 Vector2, startpos2 Vector2, endpos2 Vector2, collisionpoint &Vector2) bool

@[c: 'CheckCollisionPointLine']
pub fn check_collision_point_line(point Vector2, p1 Vector2, p2 Vector2, threshold int) bool

@[c: 'ExportImage']
pub fn export_image(image Image, filename &char) bool

@[c: 'ExportImageAsCode']
pub fn export_image_as_code(image Image, filename &char) bool

@[c: 'ExportFontAsCode']
pub fn export_font_as_code(font Font, filename &char) bool

@[c: 'TextIsEqual']
pub fn text_is_equal(text1 &char, text2 &char) bool

@[c: 'ExportMesh']
pub fn export_mesh(mesh Mesh, filename &char) bool

@[c: 'IsModelAnimationValid']
pub fn is_model_animation_valid(model Model, anim ModelAnimation) bool

@[c: 'CheckCollisionSpheres']
pub fn check_collision_spheres(center1 Vector3, radius1 f32, center2 Vector3, radius2 f32) bool

@[c: 'CheckCollisionBoxes']
pub fn check_collision_boxes(box1 BoundingBox, box2 BoundingBox) bool

@[c: 'CheckCollisionBoxSphere']
pub fn check_collision_box_sphere(box BoundingBox, center Vector3, radius f32) bool

@[c: 'IsAudioDeviceReady']
pub fn is_audio_device_ready() bool

@[c: 'ExportWave']
pub fn export_wave(wave Wave, filename &char) bool

@[c: 'ExportWaveAsCode']
pub fn export_wave_as_code(wave Wave, filename &char) bool

@[c: 'IsSoundPlaying']
pub fn is_sound_playing(sound Sound) bool

@[c: 'IsMusicStreamPlaying']
pub fn is_music_stream_playing(music Music) bool

@[c: 'IsAudioStreamProcessed']
pub fn is_audio_stream_processed(stream AudioStream) bool

@[c: 'IsAudioStreamPlaying']
pub fn is_audio_stream_playing(stream AudioStream) bool
