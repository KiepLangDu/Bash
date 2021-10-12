conky.config = {
    alignment = 'top_right',
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
    font = 'DejaVu Sans Mono:size=10',
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
              ${scroll 20 $nodename - Kiep Lang Du }

-_-_-_-_-_-_-_-_${color red}SYSTEM${color}_-_-_-_-_-_-_-_-
${color1}Uptime:$color $uptime
${color1}Frequency: $color $freq_g GHz
${color1}RAM Usage:$color $mem/$memmax - $memperc% ${membar 10}
${color1}Swap Usage:$color $swap/$swapmax - $swapperc% ${swapbar 10}
${color1}CPU Usage:$color $cpu% ${cpubar 10}
${color1}Processes:$color $processes
${color1}File systems:/ $color${fs_used /}/${fs_size /} ${fs_bar 10 /}
$hr
${color1}Name              PID   CPU%   MEM
${color} ${top name 1} ${top pid 1} ${top cpu 1} ${top mem 1}
${color} ${top name 2} ${top pid 2} ${top cpu 2} ${top mem 2}
${color} ${top name 3} ${top pid 3} ${top cpu 3} ${top mem 3}
${color} ${top name 4} ${top pid 4} ${top cpu 4} ${top mem 4}
${color} ${top name 5} ${top pid 5} ${top cpu 5} ${top mem 5}
${color} ${top name 6} ${top pid 6} ${top cpu 6} ${top mem 6}
${color} ${top name 7} ${top pid 7} ${top cpu 7} ${top mem 7}
${color} ${top name 8} ${top pid 8} ${top cpu 8} ${top mem 8}
${color} ${top name 9} ${top pid 9} ${top cpu 9} ${top mem 9}
${color} ${top name 10} ${top pid 10} ${top cpu 10} ${top mem 10}

${alignc}${color yellow}${time}
-_-_-_-_-_-_-_-_${color red}WIRELESS${color}_-_-_-_-_-_-_-_-
${color red} ${alignc}wlan0
${color1}ESSID:${alignr}${color}${wireless_essid wlan0}
${color1}Default getway IP:${alignr}${color}${gw_ip}
${color1}IP address:${alignr}${color}${addr wlan0}
${color1}Wireless quality:${alignr}${color}${wireless_link_qual_perc wlan0}%
${color1}Wireless mode:${alignr}${color}${wireless_mode wlan0}
${color1}Wireless bitrate:${alignr}${color}${wireless_bitrate wlan0}
${color1}Up:${color}${upspeed wlan0} ${alignr}${color1}Total up:${color} ${totalup wlan0}
${color}${upspeedgraph wlan0}
${color1}Down:${color}${downspeed wlan0}${alignr}${color1} Total down:${color}${totaldown wlan0}
${color}${downspeedgraph wlan0}
${color red} ${alignc}wlan0mon
${color1}Up:${color}${upspeed wlan0mon} ${alignr}${color1}Total up:${color} ${totalup wlan0mon}
${color}${upspeedgraph wlan0mon}
${color1}Down:${color}${downspeed wlan0mon}${alignr}${color1} Total down:${color}${totaldown wlan0mon}
${color}${downspeedgraph wlan0mon}
]]
