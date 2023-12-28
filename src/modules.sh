#!/usr/bin/env bash

declare -A MODULES
MODULES=(
    ["session_icon"]="$(get_opt "@theme_mod_session_icon" "")"
    ["session_color"]="$(get_opt "@theme_mod_session_color" "01")"
    ["session_text"]="$(get_opt "@theme_mod_session_text" "#S")"

    ["user_icon"]="$(get_opt "@theme_mod_user_icon" "")"
    ["user_color"]="$(get_opt "@theme_mod_user_color" "02")"
    ["user_text"]="$(get_opt "@theme_mod_user_text" "$(whoami)")"

    ["host_icon"]="$(get_opt "@theme_mod_host_icon" "")"
    ["host_color"]="$(get_opt "@theme_mod_host_color" "03")"
    ["host_text"]="$(get_opt "@theme_mod_host_text" "#H")"

    ["date_icon"]="$(get_opt "@theme_mod_date_icon" "")"
    ["date_color"]="$(get_opt "@theme_mod_date_icon" "04")"
    ["date_text"]="$(get_opt "@theme_mod_date_text" "%Y-%m-%d")"

    ["time_icon"]="$(get_opt "@theme_mod_time_icon" "")"
    ["time_color"]="$(get_opt "@theme_mod_time_icon" "05")"
    ["time_text"]="$(get_opt "@theme_mod_time_text" "%H:%M")"
)

build_module(){
    local mod_name=$1
    local style=$2
    local status=$3

    local mod_icon mod_color mod_text show_icon show_text show_sep_left show_sep_right show_sep_middle

    mod_icon=${MODULES[${mod_name}_icon]}
    mod_color=${MODULES[${mod_name}_color]}
    mod_text=${MODULES[${mod_name}_text]}

    show_sep_left=""
    show_sep_right=""
    show_sep_middle="$(separator_middle "$mod_color" "$style" "$status")"

    show_icon="#[fg=${COLORS[black1]},bg=${COLORS[$mod_color]}] $mod_icon "
    show_text="#[fg=${COLORS[$mod_color]},bg=${COLORS[black1]}] $mod_text "

    echo "$show_sep_left$show_icon$show_sep_middle$show_text$show_sep_right"
}
