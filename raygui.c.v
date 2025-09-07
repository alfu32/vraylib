@[translated]
module vraylib

struct C.GuiStyleProp {
pub mut:
	control_id     u16 @[c: 'controlId']
	property_id    u16 @[c: 'propertyId']
	property_value int @[c: 'propertyValue']
}

pub type GuiStyleProp = C.GuiStyleProp

pub enum GuiState {
	state_normal = 0
	state_focused
	state_pressed
	state_disabled
}

pub enum GuiTextAlignment {
	text_align_left = 0
	text_align_center
	text_align_right
}

pub enum GuiTextAlignmentVertical {
	text_align_top = 0
	text_align_middle
	text_align_bottom
}

pub enum GuiTextWrapMode {
	text_wrap_none = 0
	text_wrap_char
	text_wrap_word
}

pub enum GuiControl {
	default = 0
	label
	button
	toggle
	slider
	progressbar
	checkbox
	combobox
	dropdownbox
	textbox
	valuebox
	control11
	listview
	colorpicker
	scrollbar
	statusbar
}

pub enum GuiControlProperty {
	border_color_normal = 0
	base_color_normal
	text_color_normal
	border_color_focused
	base_color_focused
	text_color_focused
	border_color_pressed
	base_color_pressed
	text_color_pressed
	border_color_disabled
	base_color_disabled
	text_color_disabled
	border_width        = 12
	text_padding        = 13
	text_alignment      = 14
}

pub enum GuiDefaultProperty {
	text_size = 16
	text_spacing
	line_color
	background_color
	text_line_spacing
	text_alignment_vertical
	text_wrap_mode
}

pub enum GuiToggleProperty {
	group_padding = 16
}

pub enum GuiSliderProperty {
	slider_width = 16
	slider_padding
}

pub enum GuiProgressBarProperty {
	progress_padding = 16
}

pub enum GuiScrollBarProperty {
	arrows_size = 16
	arrows_visible
	scroll_slider_padding
	scroll_slider_size
	scroll_padding
	scroll_speed
}

pub enum GuiCheckBoxProperty {
	check_padding = 16
}

pub enum GuiComboBoxProperty {
	combo_button_width = 16
	combo_button_spacing
}

pub enum GuiDropdownBoxProperty {
	arrow_padding = 16
	dropdown_items_spacing
	dropdown_arrow_hidden
	dropdown_roll_up
}

pub enum GuiTextBoxProperty {
	text_readonly = 16
}

pub enum GuiValueBoxProperty {
	spinner_button_width = 16
	spinner_button_spacing
}

pub enum GuiListViewProperty {
	list_items_height = 16
	list_items_spacing
	scrollbar_width
	scrollbar_side
	list_items_border_normal
	list_items_border_width
}

pub enum GuiColorPickerProperty {
	color_selector_size = 16
	huebar_width
	huebar_padding
	huebar_selector_height
	huebar_selector_overflow
}

@[c: 'GuiEnable']
pub fn gui_enable()

@[c: 'GuiDisable']
pub fn gui_disable()

@[c: 'GuiLock']
pub fn gui_lock()

@[c: 'GuiUnlock']
pub fn gui_unlock()

@[c: 'GuiSetAlpha']
pub fn gui_set_alpha(alpha f32)

@[c: 'GuiSetState']
pub fn gui_set_state(state int)

@[c: 'GuiGetState']
pub fn gui_get_state() int

@[c: 'GuiSetFont']
pub fn gui_set_font(font Font)

@[c: 'GuiGetFont']
pub fn gui_get_font() Font

@[c: 'GuiSetStyle']
pub fn gui_set_style(control int, property int, value int)

@[c: 'GuiGetStyle']
pub fn gui_get_style(control int, property int) int

@[c: 'GuiLoadStyle']
pub fn gui_load_style(filename &char)

@[c: 'GuiLoadStyleDefault']
pub fn gui_load_style_default()

@[c: 'GuiEnableTooltip']
pub fn gui_enable_tooltip()

@[c: 'GuiDisableTooltip']
pub fn gui_disable_tooltip()

@[c: 'GuiSetTooltip']
pub fn gui_set_tooltip(tooltip &char)

@[c: 'GuiIconText']
pub fn gui_iconText(iconid int, text &char) &u8

@[c: 'GuiSetIconScale']
pub fn gui_set_icon_scale(scale int)

@[c: 'GuiGetIcons']
pub fn gui_get_icons() &u32

@[c: 'GuiLoadIcons']
pub fn gui_load_icons(filename &char, loadiconsname bool) &&u8

@[c: 'GuiDrawIcon']
pub fn gui_draw_icon(iconid int, posx int, posy int, pixelsize int, color Color)

@[c: 'GuiGetTextWidth']
pub fn gui_get_text_width(text &char) int

@[c: 'GuiWindowBox']
pub fn gui_window_box(bounds Rectangle, title &char) int

@[c: 'GuiGroupBox']
pub fn gui_group_box(bounds Rectangle, text &char) int

@[c: 'GuiLine']
pub fn gui_line(bounds Rectangle, text &char) int

@[c: 'GuiPanel']
pub fn gui_panel(bounds Rectangle, text &char) int

@[c: 'GuiTabBar']
pub fn gui_tab_bar(bounds Rectangle, text &&char, count int, active &int) int

@[c: 'GuiScrollPanel']
pub fn gui_scroll_panel(bounds Rectangle, text &char, content Rectangle, scroll &Vector2, view &Rectangle) int

@[c: 'GuiLabel']
pub fn gui_label(bounds Rectangle, text &char) int

@[c: 'GuiButton']
pub fn gui_button(bounds Rectangle, text &char) int

@[c: 'GuiLabelButton']
pub fn gui_label_button(bounds Rectangle, text &char) int

@[c: 'GuiToggle']
pub fn gui_toggle(bounds Rectangle, text &char, active &bool) int

@[c: 'GuiToggleGroup']
pub fn gui_toggle_group(bounds Rectangle, text &char, active &int) int

@[c: 'GuiToggleSlider']
pub fn gui_toggle_slider(bounds Rectangle, text &char, active &int) int

@[c: 'GuiCheckBox']
pub fn gui_check_box(bounds Rectangle, text &char, checked &bool) int

@[c: 'GuiComboBox']
pub fn gui_combo_box(bounds Rectangle, text &char, active &int) int

@[c: 'GuiDropdownBox']
pub fn gui_dropdown_box(bounds Rectangle, text &char, active &int, editmode bool) int

@[c: 'GuiSpinner']
pub fn gui_spinner(bounds Rectangle, text &char, value &int, minvalue int, maxvalue int, editmode bool) int

@[c: 'GuiValueBox']
pub fn gui_value_box(bounds Rectangle, text &char, value &int, minvalue int, maxvalue int, editmode bool) int

@[c: 'GuiValueBoxFloat']
pub fn gui_value_box_float(bounds Rectangle, text &char, textvalue &char, value &f32, editmode bool) int

@[c: 'GuiTextBox']
pub fn gui_text_box(bounds Rectangle, text &char, textsize int, editmode bool) int

@[c: 'GuiSlider']
pub fn gui_slider(bounds Rectangle, textleft &char, textright &char, value &f32, minvalue f32, maxvalue f32) int

@[c: 'GuiSliderBar']
pub fn gui_slider_bar(bounds Rectangle, textleft &char, textright &char, value &f32, minvalue f32, maxvalue f32) int

@[c: 'GuiProgressBar']
pub fn gui_progress_bar(bounds Rectangle, textleft &char, textright &char, value &f32, minvalue f32, maxvalue f32) int

@[c: 'GuiStatusBar']
pub fn gui_status_bar(bounds Rectangle, text &char) int

@[c: 'GuiDummyRec']
pub fn gui_dummy_rec(bounds Rectangle, text &char) int

@[c: 'GuiGrid']
pub fn gui_grid(bounds Rectangle, text &char, spacing f32, subdivs int, mousecell &Vector2) int

@[c: 'GuiListView']
pub fn gui_list_view(bounds Rectangle, text &char, scrollindex &int, active &int) int

@[c: 'GuiListViewEx']
pub fn gui_list_view_ex(bounds Rectangle, text &&char, count int, scrollindex &int, active &int, focus &int) int

@[c: 'GuiMessageBox']
pub fn gui_message_box(bounds Rectangle, title &char, message &char, buttons &u8) int

@[c: 'GuiTextInputBox']
pub fn gui_text_input_box(bounds Rectangle, title &char, message &char, buttons &u8, text &char, textmaxsize int, secretviewactive &bool) int

@[c: 'GuiColorPicker']
pub fn gui_color_picker(bounds Rectangle, text &char, color &Color) int

@[c: 'GuiColorPanel']
pub fn gui_color_panel(bounds Rectangle, text &char, color &Color) int

@[c: 'GuiColorBarAlpha']
pub fn gui_color_bar_alpha(bounds Rectangle, text &char, alpha &f32) int

@[c: 'GuiColorBarHue']
pub fn gui_color_bar_hue(bounds Rectangle, text &char, value &f32) int

@[c: 'GuiColorPickerHSV']
pub fn gui_color_picker_hsv(bounds Rectangle, text &char, colorhsv &Vector3) int

@[c: 'GuiColorPanelHSV']
pub fn gui_color_panel_hsv(bounds Rectangle, text &char, colorhsv &Vector3) int

enum GuiIconName {
	icon_none                    = 0
	icon_folder_file_open        = 1
	icon_file_save_classic       = 2
	icon_folder_open             = 3
	icon_folder_save             = 4
	icon_file_open               = 5
	icon_file_save               = 6
	icon_file_export             = 7
	icon_file_add                = 8
	icon_file_delete             = 9
	icon_filetype_text           = 10
	icon_filetype_audio          = 11
	icon_filetype_image          = 12
	icon_filetype_play           = 13
	icon_filetype_video          = 14
	icon_filetype_info           = 15
	icon_file_copy               = 16
	icon_file_cut                = 17
	icon_file_paste              = 18
	icon_cursor_hand             = 19
	icon_cursor_pointer          = 20
	icon_cursor_classic          = 21
	icon_pencil                  = 22
	icon_pencil_big              = 23
	icon_brush_classic           = 24
	icon_brush_painter           = 25
	icon_water_drop              = 26
	icon_color_picker            = 27
	icon_rubber                  = 28
	icon_color_bucket            = 29
	icon_text_t                  = 30
	icon_text_a                  = 31
	icon_scale                   = 32
	icon_resize                  = 33
	icon_filter_point            = 34
	icon_filter_bilinear         = 35
	icon_crop                    = 36
	icon_crop_alpha              = 37
	icon_square_toggle           = 38
	icon_symmetry                = 39
	icon_symmetry_horizontal     = 40
	icon_symmetry_vertical       = 41
	icon_lens                    = 42
	icon_lens_big                = 43
	icon_eye_on                  = 44
	icon_eye_off                 = 45
	icon_filter_top              = 46
	icon_filter                  = 47
	icon_target_point            = 48
	icon_target_small            = 49
	icon_target_big              = 50
	icon_target_move             = 51
	icon_cursor_move             = 52
	icon_cursor_scale            = 53
	icon_cursor_scale_right      = 54
	icon_cursor_scale_left       = 55
	icon_undo                    = 56
	icon_redo                    = 57
	icon_reredo                  = 58
	icon_mutate                  = 59
	icon_rotate                  = 60
	icon_repeat                  = 61
	icon_shuffle                 = 62
	icon_emptybox                = 63
	icon_target                  = 64
	icon_target_small_fill       = 65
	icon_target_big_fill         = 66
	icon_target_move_fill        = 67
	icon_cursor_move_fill        = 68
	icon_cursor_scale_fill       = 69
	icon_cursor_scale_right_fill = 70
	icon_cursor_scale_left_fill  = 71
	icon_undo_fill               = 72
	icon_redo_fill               = 73
	icon_reredo_fill             = 74
	icon_mutate_fill             = 75
	icon_rotate_fill             = 76
	icon_repeat_fill             = 77
	icon_shuffle_fill            = 78
	icon_emptybox_small          = 79
	icon_box                     = 80
	icon_box_top                 = 81
	icon_box_top_right           = 82
	icon_box_right               = 83
	icon_box_bottom_right        = 84
	icon_box_bottom              = 85
	icon_box_bottom_left         = 86
	icon_box_left                = 87
	icon_box_top_left            = 88
	icon_box_center              = 89
	icon_box_circle_mask         = 90
	icon_pot                     = 91
	icon_alpha_multiply          = 92
	icon_alpha_clear             = 93
	icon_dithering               = 94
	icon_mipmaps                 = 95
	icon_box_grid                = 96
	icon_grid                    = 97
	icon_box_corners_small       = 98
	icon_box_corners_big         = 99
	icon_four_boxes              = 100
	icon_grid_fill               = 101
	icon_box_multisize           = 102
	icon_zoom_small              = 103
	icon_zoom_medium             = 104
	icon_zoom_big                = 105
	icon_zoom_all                = 106
	icon_zoom_center             = 107
	icon_box_dots_small          = 108
	icon_box_dots_big            = 109
	icon_box_concentric          = 110
	icon_box_grid_big            = 111
	icon_ok_tick                 = 112
	icon_cross                   = 113
	icon_arrow_left              = 114
	icon_arrow_right             = 115
	icon_arrow_down              = 116
	icon_arrow_up                = 117
	icon_arrow_left_fill         = 118
	icon_arrow_right_fill        = 119
	icon_arrow_down_fill         = 120
	icon_arrow_up_fill           = 121
	icon_audio                   = 122
	icon_fx                      = 123
	icon_wave                    = 124
	icon_wave_sinus              = 125
	icon_wave_square             = 126
	icon_wave_triangular         = 127
	icon_cross_small             = 128
	icon_player_previous         = 129
	icon_player_play_back        = 130
	icon_player_play             = 131
	icon_player_pause            = 132
	icon_player_stop             = 133
	icon_player_next             = 134
	icon_player_record           = 135
	icon_magnet                  = 136
	icon_lock_close              = 137
	icon_lock_open               = 138
	icon_clock                   = 139
	icon_tools                   = 140
	icon_gear                    = 141
	icon_gear_big                = 142
	icon_bin                     = 143
	icon_hand_pointer            = 144
	icon_laser                   = 145
	icon_coin                    = 146
	icon_explosion               = 147
	icon_1up                     = 148
	icon_player                  = 149
	icon_player_jump             = 150
	icon_key                     = 151
	icon_demon                   = 152
	icon_text_popup              = 153
	icon_gear_ex                 = 154
	icon_crack                   = 155
	icon_crack_points            = 156
	icon_star                    = 157
	icon_door                    = 158
	icon_exit                    = 159
	icon_mode_2d                 = 160
	icon_mode_3d                 = 161
	icon_cube                    = 162
	icon_cube_face_top           = 163
	icon_cube_face_left          = 164
	icon_cube_face_front         = 165
	icon_cube_face_bottom        = 166
	icon_cube_face_right         = 167
	icon_cube_face_back          = 168
	icon_camera                  = 169
	icon_special                 = 170
	icon_link_net                = 171
	icon_link_boxes              = 172
	icon_link_multi              = 173
	icon_link                    = 174
	icon_link_broke              = 175
	icon_text_notes              = 176
	icon_notebook                = 177
	icon_suitcase                = 178
	icon_suitcase_zip            = 179
	icon_mailbox                 = 180
	icon_monitor                 = 181
	icon_printer                 = 182
	icon_photo_camera            = 183
	icon_photo_camera_flash      = 184
	icon_house                   = 185
	icon_heart                   = 186
	icon_corner                  = 187
	icon_vertical_bars           = 188
	icon_vertical_bars_fill      = 189
	icon_life_bars               = 190
	icon_info                    = 191
	icon_crossline               = 192
	icon_help                    = 193
	icon_filetype_alpha          = 194
	icon_filetype_home           = 195
	icon_layers_visible          = 196
	icon_layers                  = 197
	icon_window                  = 198
	icon_hidpi                   = 199
	icon_filetype_binary         = 200
	icon_hex                     = 201
	icon_shield                  = 202
	icon_file_new                = 203
	icon_folder_add              = 204
	icon_alarm                   = 205
	icon_cpu                     = 206
	icon_rom                     = 207
	icon_step_over               = 208
	icon_step_into               = 209
	icon_step_out                = 210
	icon_restart                 = 211
	icon_breakpoint_on           = 212
	icon_breakpoint_off          = 213
	icon_burger_menu             = 214
	icon_case_sensitive          = 215
	icon_reg_exp                 = 216
	icon_folder                  = 217
	icon_file                    = 218
	icon_sand_timer              = 219
	icon_warning                 = 220
	icon_help_box                = 221
	icon_info_box                = 222
	icon_priority                = 223
	icon_layers_iso              = 224
	icon_layers2                 = 225
	icon_mlayers                 = 226
	icon_maps                    = 227
	icon_hot                     = 228
	icon_label                   = 229
	icon_name_id                 = 230
	icon_slicing                 = 231
	icon_manual_control          = 232
	icon_collision               = 233
	icon_234                     = 234
	icon_235                     = 235
	icon_236                     = 236
	icon_237                     = 237
	icon_238                     = 238
	icon_239                     = 239
	icon_240                     = 240
	icon_241                     = 241
	icon_242                     = 242
	icon_243                     = 243
	icon_244                     = 244
	icon_245                     = 245
	icon_246                     = 246
	icon_247                     = 247
	icon_248                     = 248
	icon_249                     = 249
	icon_250                     = 250
	icon_251                     = 251
	icon_252                     = 252
	icon_253                     = 253
	icon_254                     = 254
	icon_255                     = 255
}
