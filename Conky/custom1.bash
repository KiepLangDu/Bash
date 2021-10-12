conky.config = {
    alignment = 'top_left',
    background = false,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = 'green',
    color1='blue',
    default_outline_color = 'white',
    default_shade_color = 'white',
    	double_buffer = true,
	draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    use_xft = true,
    font = 'DejaVu Sans Mono:size=9',
    gap_x = 5,
    gap_y = 60,
    minimum_height = 5,
	minimum_width = 5,
    net_avg_samples = 2,
    no_buffers = true,
    out_to_console = false,
    out_to_stderr = false,
    extra_newline = false,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'desktop',
    own_window_transparent = false,
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    show_graph_scale = false,
    show_graph_range = false
}
conky.text = [[
${color1}ARP TABLE
${color}${execp arp -a |sed -e "s/_gateway (//" -e "s/)//" -e "s/\[ether\] on wlan0//"}
${color1}GPU TEMPERATURE
${color}${exec sensors |tail -n 2|sed -e 's/temp1://; s/^ *//'}
]]
