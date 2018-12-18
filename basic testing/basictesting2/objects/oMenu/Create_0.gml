/// @description Insert description here
// You can write your code in this editor
//global pause var?
global.menuOn = false

//setting up gui vars for placement
gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
gui_width_margin = gui_width / 5
gui_height_margin = gui_height / 5
menu_x1 = gui_width_margin
menu_x2 = gui_width - gui_width_margin
menu_y1 = gui_height_margin
menu_y2 = gui_height - gui_height_margin


//font and stuf
menu_font = fMenu
menu_itemheight = font_get_size(fMenu)


listMenu = ds_list_create()
//menu array
//pauseMenu[2] = "Quit Game"
//pauseMenu[1] = "Back to Hub"
//pauseMenu[0] = "Resume"


//menu_items = array_length_1d(pauseMenu)
cursor_item = 0