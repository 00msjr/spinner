#!/bin/bash

DEFAULT_SPINNER="aesthetic"
DEFAULT_INTERVAL=1 # user-friendly default (mapped to 0.1s)
DEFAULT_COLOR="white"

# --- SPINNER DATA ---

declare -a SPINNER_aesthetic=('▰▱▱▱▱▱▱' '▰▰▱▱▱▱▱' '▰▰▰▱▱▱▱' '▰▰▰▰▱▱▱' '▰▰▰▰▰▱▱' '▰▰▰▰▰▰▱' '▰▰▰▰▰▰▰' '▰▱▱▱▱▱▱')
declare -a SPINNER_arc=('◜' '◠' '◝' '◞' '◡' '◟')
declare -a SPINNER_arrow=('←' '↖' '↑' '↗' '→' '↘' '↓' '↙')
declare -a SPINNER_arrow2=('⬆️ ' '↗️ ' '➡️ ' '↘️ ' '⬇️ ' '↙️ ' '⬅️ ' '↖️ ')
declare -a SPINNER_arrow3=('▹▹▹▹▹' '▸▹▹▹▹' '▹▸▹▹▹' '▹▹▸▹▹' '▹▹▹▸▹' '▹▹▹▹▸')
declare -a SPINNER_balloon=(' ' '.' 'o' 'O' '@' '*' ' ')
declare -a SPINNER_balloon2=('.' 'o' 'O' '°' 'O' 'o' '.')
declare -a SPINNER_betaWave=('ρββββββ' 'βρβββββ' 'ββρββββ' 'βββρβββ' 'ββββρββ' 'βββββρβ' 'ββββββρ')
declare -a SPINNER_binary=('010010' '001100' '100101' '111010' '111101' '010111' '101011' '111000' '110011' '110101')
declare -a SPINNER_bluePulse=('🔹 ' '🔷 ' '🔵 ' '🔵 ' '🔷 ')
declare -a SPINNER_bounce=('⠁' '⠂' '⠄' '⠂')
declare -a SPINNER_bouncingBall=('( ●    )' '(  ●   )' '(   ●  )' '(    ● )' '(     ●)' '(    ● )' '(   ●  )' '(  ●   )' '( ●    )' '(●     )')
declare -a SPINNER_bouncingBar=('[    ]' '[=   ]' '[==  ]' '[=== ]' '[====]' '[ ===]' '[  ==]' '[   =]' '[    ]' '[   =]' '[  ==]' '[ ===]' '[====]' '[=== ]' '[==  ]' '[=   ]')
declare -a SPINNER_boxBounce=('▖' '▘' '▝' '▗')
declare -a SPINNER_boxBounce2=('▌' '▀' '▐' '▄')
declare -a SPINNER_christmas=('🌲' '🎄')
declare -a SPINNER_circle=('◡' '⊙' '◠')
declare -a SPINNER_circleHalves=('◐' '◓' '◑' '◒')
declare -a SPINNER_circleQuarters=('◴' '◷' '◶' '◵')
declare -a SPINNER_clock=('🕛 ' '🕐 ' '🕑 ' '🕒 ' '🕓 ' '🕔 ' '🕕 ' '🕖 ' '🕗 ' '🕘 ' '🕙 ' '🕚 ')
declare -a SPINNER_dots=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
declare -a SPINNER_dots10=('⢄' '⢂' '⢁' '⡁' '⡈' '⡐' '⡠')
declare -a SPINNER_dots11=('⠁' '⠂' '⠄' '⡀' '⢀' '⠠' '⠐' '⠈')
declare -a SPINNER_dots12=('⢀⠀' '⡀⠀' '⠄⠀' '⢂⠀' '⡂⠀' '⠅⠀' '⢃⠀' '⡃⠀' '⠍⠀' '⢋⠀' '⡋⠀' '⠍⠁' '⢋⠁' '⡋⠁' '⠍⠉' '⠋⠉' '⠋⠉' '⠉⠙' '⠉⠙' '⠉⠩' '⠈⢙' '⠈⡙' '⢈⠩' '⡀⢙' '⠄⡙' '⢂⠩' '⡂⢘' '⠅⡘' '⢃⠨' '⡃⢐' '⠍⡐' '⢋⠠' '⡋⢀' '⠍⡁' '⢋⠁' '⡋⠁' '⠍⠉' '⠋⠉' '⠋⠉' '⠉⠙' '⠉⠙' '⠉⠩' '⠈⢙' '⠈⡙' '⠈⠩' '⠀⢙' '⠀⡙' '⠀⠩' '⠀⢘' '⠀⡘' '⠀⠨' '⠀⢐' '⠀⡐' '⠀⠠' '⠀⢀' '⠀⡀')
declare -a SPINNER_dots13=('⣼' '⣹' '⢻' '⠿' '⡟' '⣏' '⣧' '⣶')
declare -a SPINNER_dots14=('⠉⠉' '⠈⠙' '⠀⠹' '⠀⢸' '⠀⣰' '⢀⣠' '⣀⣀' '⣄⡀' '⣆⠀' '⡇⠀' '⠏⠀' '⠋⠁')
declare -a SPINNER_dots2=('⣾' '⣽' '⣻' '⢿' '⡿' '⣟' '⣯' '⣷')
declare -a SPINNER_dots3=('⠋' '⠙' '⠚' '⠞' '⠖' '⠦' '⠴' '⠲' '⠳' '⠓')
declare -a SPINNER_dots4=('⠄' '⠆' '⠇' '⠋' '⠙' '⠸' '⠰' '⠠' '⠰' '⠸' '⠙' '⠋' '⠇' '⠆')
declare -a SPINNER_dots5=('⠋' '⠙' '⠚' '⠒' '⠂' '⠂' '⠒' '⠲' '⠴' '⠦' '⠖' '⠒' '⠐' '⠐' '⠒' '⠓' '⠋')
declare -a SPINNER_dots6=('⠁' '⠉' '⠙' '⠚' '⠒' '⠂' '⠂' '⠒' '⠲' '⠴' '⠤' '⠄' '⠄' '⠤' '⠴' '⠲' '⠒' '⠂' '⠂' '⠒' '⠚' '⠙' '⠉' '⠁')
declare -a SPINNER_dots7=('⠈' '⠉' '⠋' '⠓' '⠒' '⠐' '⠐' '⠒' '⠖' '⠦' '⠤' '⠠' '⠠' '⠤' '⠦' '⠖' '⠒' '⠐' '⠐' '⠒' '⠓' '⠋' '⠉' '⠈')
declare -a SPINNER_dots8=('⠁' '⠁' '⠉' '⠙' '⠚' '⠒' '⠂' '⠂' '⠒' '⠲' '⠴' '⠤' '⠄' '⠄' '⠤' '⠠' '⠠' '⠤' '⠦' '⠖' '⠒' '⠐' '⠐' '⠒' '⠓' '⠋' '⠉' '⠈' '⠈')
declare -a SPINNER_dots8Bit=('⠀' '⠁' '⠂' '⠃' '⠄' '⠅' '⠆' '⠇' '⡀' '⡁' '⡂' '⡃' '⡄' '⡅' '⡆' '⡇' '⠈' '⠉' '⠊' '⠋' '⠌' '⠍' '⠎' '⠏' '⡈' '⡉' '⡊' '⡋' '⡌' '⡍' '⡎' '⡏' '⠐' '⠑' '⠒' '⠓' '⠔' '⠕' '⠖' '⠗' '⡐' '⡑' '⡒' '⡓' '⡔' '⡕' '⡖' '⡗' '⠘' '⠙' '⠚' '⠛' '⠜' '⠝' '⠞' '⠟' '⡘' '⡙' '⡚' '⡛' '⡜' '⡝' '⡞' '⡟' '⠠' '⠡' '⠢' '⠣' '⠤' '⠥' '⠦' '⠧' '⡠' '⡡' '⡢' '⡣' '⡤' '⡥' '⡦' '⡧' '⠨' '⠩' '⠪' '⠫' '⠬' '⠭' '⠮' '⠯' '⡨' '⡩' '⡪' '⡫' '⡬' '⡭' '⡮' '⡯' '⠰' '⠱' '⠲' '⠳' '⠴' '⠵' '⠶' '⠷' '⡰' '⡱' '⡲' '⡳' '⡴' '⡵' '⡶' '⡷' '⠸' '⠹' '⠺' '⠻' '⠼' '⠽' '⠾' '⠿' '⡸' '⡹' '⡺' '⡻' '⡼' '⡽' '⡾' '⡿' '⢀' '⢁' '⢂' '⢃' '⢄' '⢅' '⢆' '⢇' '⣀' '⣁' '⣂' '⣃' '⣄' '⣅' '⣆' '⣇' '⢈' '⢉' '⢊' '⢋' '⢌' '⢍' '⢎' '⢏' '⣈' '⣉' '⣊' '⣋' '⣌' '⣍' '⣎' '⣏' '⢐' '⢑' '⢒' '⢓' '⢔' '⢕' '⢖' '⢗' '⣐' '⣑' '⣒' '⣓' '⣔' '⣕' '⣖' '⣗' '⢘' '⢙' '⢚' '⢛' '⢜' '⢝' '⢞' '⢟' '⣘' '⣙' '⣚' '⣛' '⣜' '⣝' '⣞' '⣟' '⢠' '⢡' '⢢' '⢣' '⢤' '⢥' '⢦' '⢧' '⣠' '⣡' '⣢' '⣣' '⣤' '⣥' '⣦' '⣧' '⢨' '⢩' '⢪' '⢫' '⢬' '⢭' '⢮' '⢯' '⣨' '⣩' '⣪' '⣫' '⣬' '⣭' '⣮' '⣯' '⢰' '⢱' '⢲' '⢳' '⢴' '⢵' '⢶' '⢷' '⣰' '⣱' '⣲' '⣳' '⣴' '⣵' '⣶' '⣷' '⢸' '⢹' '⢺' '⢻' '⢼' '⢽' '⢾' '⢿' '⣸' '⣹' '⣺' '⣻' '⣼' '⣽' '⣾' '⣿')
declare -a SPINNER_dots9=('⢹' '⢺' '⢼' '⣸' '⣇' '⡧' '⡗' '⡏')
declare -a SPINNER_dotsCircle=('⢎ ' '⠎⠁' '⠊⠑' '⠈⠱' ' ⡱' '⢀⡰' '⢄⡠' '⢆⡀')
declare -a SPINNER_dqpb=('d' 'q' 'p' 'b')
declare -a SPINNER_dwarfFortress=(' ██████£££  ' '☺██████£££  ' '☺██████£££  ' '☺▓█████£££  ' '☺▓█████£££  ' '☺▒█████£££  ' '☺▒█████£££  ' '☺░█████£££  ' '☺░█████£££  ' '☺ █████£££  ' ' ☺█████£££  ' ' ☺█████£££  ' ' ☺▓████£££  ' ' ☺▓████£££  ' ' ☺▒████£££  ' ' ☺▒████£££  ' ' ☺░████£££  ' ' ☺░████£££  ' ' ☺ ████£££  ' '  ☺████£££  ' '  ☺████£££  ' '  ☺▓███£££  ' '  ☺▓███£££  ' '  ☺▒███£££  ' '  ☺▒███£££  ' '  ☺░███£££  ' '  ☺░███£££  ' '  ☺ ███£££  ' '   ☺███£££  ' '   ☺███£££  ' '   ☺▓██£££  ' '   ☺▓██£££  ' '   ☺▒██£££  ' '   ☺▒██£££  ' '   ☺░██£££  ' '   ☺░██£££  ' '   ☺ ██£££  ' '    ☺██£££  ' '    ☺██£££  ' '    ☺▓█£££  ' '    ☺▓█£££  ' '    ☺▒█£££  ' '    ☺▒█£££  ' '    ☺░█£££  ' '    ☺░█£££  ' '    ☺ █£££  ' '     ☺█£££  ' '     ☺█£££  ' '     ☺▓£££  ' '     ☺▓£££  ' '     ☺▒£££  ' '     ☺▒£££  ' '     ☺░£££  ' '     ☺░£££  ' '     ☺ £££  ' '      ☺£££  ' '      ☺£££  ' '      ☺▓££  ' '      ☺▓££  ' '      ☺▒££  ' '      ☺▒££  ' '      ☺░££  ' '      ☺░££  ' '      ☺ ££  ' '       ☺££  ' '       ☺££  ' '       ☺▓£  ' '       ☺▓£  ' '       ☺▒£  ' '       ☺▒£  ' '       ☺░£  ' '       ☺░£  ' '       ☺ £  ' '        ☺£  ' '        ☺£  ' '        ☺▓  ' '        ☺▓  ' '        ☺▒  ' '        ☺▒  ' '        ☺░  ' '        ☺░  ' '        ☺   ' '        ☺  &' '        ☺ ☼&' '       ☺ ☼ &' '       ☺☼  &' '      ☺☼  & ' '      ‼   & ' '     ☺   &  ' '    ‼    &  ' '   ☺    &   ' '  ‼     &   ' ' ☺     &    ' '‼      &    ' '      &     ' '      &     ' '     &   ░  ' '     &   ▒  ' '    &    ▓  ' '    &    £  ' '   &    ░£  ' '   &    ▒£  ' '  &     ▓£  ' '  &     ££  ' ' &     ░££  ' ' &     ▒££  ' '&      ▓££  ' '&      £££  ' '      ░£££  ' '      ▒£££  ' '      ▓£££  ' '      █£££  ' '     ░█£££  ' '     ▒█£££  ' '     ▓█£££  ' '     ██£££  ' '    ░██£££  ' '    ▒██£££  ' '    ▓██£££  ' '    ███£££  ' '   ░███£££  ' '   ▒███£££  ' '   ▓███£££  ' '   ████£££  ' '  ░████£££  ' '  ▒████£££  ' '  ▓████£££  ' '  █████£££  ' ' ░█████£££  ' ' ▒█████£££  ' ' ▓█████£££  ' ' ██████£££  ' ' ██████£££  ')
declare -a SPINNER_earth=('🌍 ' '🌎 ' '🌏 ')
declare -a SPINNER_fingerDance=('🤘 ' '🤟 ' '🖖 ' '✋ ' '🤚 ' '👆 ')
declare -a SPINNER_fistBump=('🤜　　　　🤛 ' '🤜　　　　🤛 ' '🤜　　　　🤛 ' '　🤜　　🤛　 ' '　　🤜🤛　　 ' '　🤜✨🤛　　 ' '🤜　✨　🤛　 ')
declare -a SPINNER_flip=('_' '_' '_' '-' '`' '`' ''\''' '´' '-' '_' '_' '_')
declare -a SPINNER_grenade=('،  ' '′  ' ' ´ ' ' ‾ ' '  ⸌' '  ⸊' '  |' '  ⁎' '  ⁕' ' ෴ ' '  ⁓' '   ' '   ' '   ')
declare -a SPINNER_growHorizontal=('▏' '▎' '▍' '▌' '▋' '▊' '▉' '▊' '▋' '▌' '▍' '▎')
declare -a SPINNER_growVertical=('▁' '▃' '▄' '▅' '▆' '▇' '▆' '▅' '▄' '▃')
declare -a SPINNER_hamburger=('☱' '☲' '☴')
declare -a SPINNER_hearts=('💛 ' '💙 ' '💜 ' '💚 ' '💗 ')
declare -a SPINNER_layer=('-' '=' '≡')
declare -a SPINNER_line=('-' '\' '|' '/')
declare -a SPINNER_line2=('⠂' '-' '–' '—' '–' '-')
declare -a SPINNER_material=('█▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '███▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '████▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '██████▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '██████▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '███████▁▁▁▁▁▁▁▁▁▁▁▁▁' '████████▁▁▁▁▁▁▁▁▁▁▁▁' '█████████▁▁▁▁▁▁▁▁▁▁▁' '█████████▁▁▁▁▁▁▁▁▁▁▁' '██████████▁▁▁▁▁▁▁▁▁▁' '███████████▁▁▁▁▁▁▁▁▁' '█████████████▁▁▁▁▁▁▁' '██████████████▁▁▁▁▁▁' '██████████████▁▁▁▁▁▁' '▁██████████████▁▁▁▁▁' '▁██████████████▁▁▁▁▁' '▁██████████████▁▁▁▁▁' '▁▁██████████████▁▁▁▁' '▁▁▁██████████████▁▁▁' '▁▁▁▁█████████████▁▁▁' '▁▁▁▁██████████████▁▁' '▁▁▁▁██████████████▁▁' '▁▁▁▁▁██████████████▁' '▁▁▁▁▁██████████████▁' '▁▁▁▁▁██████████████▁' '▁▁▁▁▁▁██████████████' '▁▁▁▁▁▁██████████████' '▁▁▁▁▁▁▁█████████████' '▁▁▁▁▁▁▁█████████████' '▁▁▁▁▁▁▁▁████████████' '▁▁▁▁▁▁▁▁████████████' '▁▁▁▁▁▁▁▁▁███████████' '▁▁▁▁▁▁▁▁▁███████████' '▁▁▁▁▁▁▁▁▁▁██████████' '▁▁▁▁▁▁▁▁▁▁██████████' '▁▁▁▁▁▁▁▁▁▁▁▁████████' '▁▁▁▁▁▁▁▁▁▁▁▁▁███████' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁██████' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████' '█▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████' '██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███' '██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███' '███▁▁▁▁▁▁▁▁▁▁▁▁▁▁███' '████▁▁▁▁▁▁▁▁▁▁▁▁▁▁██' '█████▁▁▁▁▁▁▁▁▁▁▁▁▁▁█' '█████▁▁▁▁▁▁▁▁▁▁▁▁▁▁█' '██████▁▁▁▁▁▁▁▁▁▁▁▁▁█' '████████▁▁▁▁▁▁▁▁▁▁▁▁' '█████████▁▁▁▁▁▁▁▁▁▁▁' '█████████▁▁▁▁▁▁▁▁▁▁▁' '█████████▁▁▁▁▁▁▁▁▁▁▁' '█████████▁▁▁▁▁▁▁▁▁▁▁' '███████████▁▁▁▁▁▁▁▁▁' '████████████▁▁▁▁▁▁▁▁' '████████████▁▁▁▁▁▁▁▁' '██████████████▁▁▁▁▁▁' '██████████████▁▁▁▁▁▁' '▁██████████████▁▁▁▁▁' '▁██████████████▁▁▁▁▁' '▁▁▁█████████████▁▁▁▁' '▁▁▁▁▁████████████▁▁▁' '▁▁▁▁▁████████████▁▁▁' '▁▁▁▁▁▁███████████▁▁▁' '▁▁▁▁▁▁▁▁█████████▁▁▁' '▁▁▁▁▁▁▁▁█████████▁▁▁' '▁▁▁▁▁▁▁▁▁█████████▁▁' '▁▁▁▁▁▁▁▁▁█████████▁▁' '▁▁▁▁▁▁▁▁▁▁█████████▁' '▁▁▁▁▁▁▁▁▁▁▁████████▁' '▁▁▁▁▁▁▁▁▁▁▁████████▁' '▁▁▁▁▁▁▁▁▁▁▁▁███████▁' '▁▁▁▁▁▁▁▁▁▁▁▁███████▁' '▁▁▁▁▁▁▁▁▁▁▁▁▁███████' '▁▁▁▁▁▁▁▁▁▁▁▁▁███████' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁' '▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁')
declare -a SPINNER_mindblown=('😐 ' '😐 ' '😮 ' '😮 ' '😦 ' '😦 ' '😧 ' '😧 ' '🤯 ' '💥 ' '✨ ' '　 ' '　 ' '　 ')
declare -a SPINNER_monkey=('🙈 ' '🙈 ' '🙉 ' '🙊 ')
declare -a SPINNER_moon=('🌑 ' '🌒 ' '🌓 ' '🌔 ' '🌕 ' '🌖 ' '🌗 ' '🌘 ')
declare -a SPINNER_noise=('▓' '▒' '░')
declare -a SPINNER_orangeBluePulse=('🔸 ' '🔶 ' '🟠 ' '🟠 ' '🔶 ' '🔹 ' '🔷 ' '🔵 ' '🔵 ' '🔷 ')
declare -a SPINNER_orangePulse=('🔸 ' '🔶 ' '🟠 ' '🟠 ' '🔶 ')
declare -a SPINNER_pipe=('┤' '┘' '┴' '└' '├' '┌' '┬' '┐')
declare -a SPINNER_point=('∙∙∙' '●∙∙' '∙●∙' '∙∙●' '∙∙∙')
declare -a SPINNER_pong=('▐⠂       ▌' '▐⠈       ▌' '▐ ⠂      ▌' '▐ ⠠      ▌' '▐  ⡀     ▌' '▐  ⠠     ▌' '▐   ⠂    ▌' '▐   ⠈    ▌' '▐    ⠂   ▌' '▐    ⠠   ▌' '▐     ⡀  ▌' '▐     ⠠  ▌' '▐      ⠂ ▌' '▐      ⠈ ▌' '▐       ⠂▌' '▐       ⠠▌' '▐       ⡀▌' '▐      ⠠ ▌' '▐      ⠂ ▌' '▐     ⠈  ▌' '▐     ⠂  ▌' '▐    ⠠   ▌' '▐    ⡀   ▌' '▐   ⠠    ▌' '▐   ⠂    ▌' '▐  ⠈     ▌' '▐  ⠂     ▌' '▐ ⠠      ▌' '▐ ⡀      ▌' '▐⠠       ▌')
declare -a SPINNER_rollingLine=('/  ' ' - ' ' \ ' '  |' '  |' ' \ ' ' - ' '/  ')
declare -a SPINNER_runner=('🚶 ' '🏃 ')
declare -a SPINNER_sand=('⠁' '⠂' '⠄' '⡀' '⡈' '⡐' '⡠' '⣀' '⣁' '⣂' '⣄' '⣌' '⣔' '⣤' '⣥' '⣦' '⣮' '⣶' '⣷' '⣿' '⡿' '⠿' '⢟' '⠟' '⡛' '⠛' '⠫' '⢋' '⠋' '⠍' '⡉' '⠉' '⠑' '⠡' '⢁')
declare -a SPINNER_shark=('▐|\____________▌' '▐_|\___________▌' '▐__|\__________▌' '▐___|\_________▌' '▐____|\________▌' '▐_____|\_______▌' '▐______|\______▌' '▐_______|\_____▌' '▐________|\____▌' '▐_________|\___▌' '▐__________|\__▌' '▐___________|\_▌' '▐____________|\▌' '▐____________/|▌' '▐___________/|_▌' '▐__________/|__▌' '▐_________/|___▌' '▐________/|____▌' '▐_______/|_____▌' '▐______/|______▌' '▐_____/|_______▌' '▐____/|________▌' '▐___/|_________▌' '▐__/|__________▌' '▐_/|___________▌' '▐/|____________▌')
declare -a SPINNER_simpleDots=('.  ' '.. ' '...' '   ')
declare -a SPINNER_simpleDotsScrolling=('.  ' '.. ' '...' ' ..' '  .' '   ')
declare -a SPINNER_smiley=('😄 ' '😝 ')
declare -a SPINNER_soccerHeader=(' 🧑⚽️       🧑 ' '🧑  ⚽️      🧑 ' '🧑   ⚽️     🧑 ' '🧑    ⚽️    🧑 ' '🧑     ⚽️   🧑 ' '🧑      ⚽️  🧑 ' '🧑       ⚽️🧑  ' '🧑      ⚽️  🧑 ' '🧑     ⚽️   🧑 ' '🧑    ⚽️    🧑 ' '🧑   ⚽️     🧑 ' '🧑  ⚽️      🧑 ')
declare -a SPINNER_speaker=('🔈 ' '🔉 ' '🔊 ' '🔉 ')
declare -a SPINNER_squareCorners=('◰' '◳' '◲' '◱')
declare -a SPINNER_squish=('╫' '╪')
declare -a SPINNER_star=('✶' '✸' '✹' '✺' '✹' '✷')
declare -a SPINNER_star2=('+' 'x' '*')
declare -a SPINNER_timeTravel=('🕛 ' '🕚 ' '🕙 ' '🕘 ' '🕗 ' '🕖 ' '🕕 ' '🕔 ' '🕓 ' '🕒 ' '🕑 ' '🕐 ')
declare -a SPINNER_toggle=('⊶' '⊷')
declare -a SPINNER_toggle10=('㊂' '㊀' '㊁')
declare -a SPINNER_toggle11=('⧇' '⧆')
declare -a SPINNER_toggle12=('☗' '☖')
declare -a SPINNER_toggle13=('=' '*' '-')
declare -a SPINNER_toggle2=('▫' '▪')
declare -a SPINNER_toggle3=('□' '■')
declare -a SPINNER_toggle4=('■' '□' '▪' '▫')
declare -a SPINNER_toggle5=('▮' '▯')
declare -a SPINNER_toggle6=('ဝ' '၀')
declare -a SPINNER_toggle7=('⦾' '⦿')
declare -a SPINNER_toggle8=('◍' '◌')
declare -a SPINNER_toggle9=('◉' '◎')
declare -a SPINNER_triangle=('◢' '◣' '◤' '◥')
declare -a SPINNER_weather=('☀️ ' '☀️ ' '☀️ ' '🌤 ' '⛅️ ' '🌥 ' '☁️ ' '🌧 ' '🌨 ' '🌧 ' '🌨 ' '🌧 ' '🌨 ' '⛈ ' '🌨 ' '🌧 ' '🌨 ' '☁️ ' '🌥 ' '⛅️ ' '🌤 ' '☀️ ' '☀️ ')

# --- HELPER FUNCTIONS ---

# Function to get spinner frames
# Not directly used in run_spinner but required by list_spinners and spinner_exists
get_spinner() {
  local name="$1"
  local var_name="SPINNER_${name}[@]"
  if [[ -n "${!var_name}" ]]; then
    echo "${!var_name}"
    return 0
  else
    return 1
  fi
}

# Function to list all available spinners
list_all_spinners() {
  compgen -A variable | grep "^SPINNER_" | sed 's/SPINNER_//' | sort
}

# Function to check if a spinner exists
spinner_exists() {
  local name="$1"
  local var_name="SPINNER_${name}"
  [[ -n "${!var_name}" ]]
}

# --- MAIN SCRIPT LOGIC (From spinner.sh) ---

# Colors
declare -A COLORS=(
  [black]="\033[30m"
  [red]="\033[31m"
  [green]="\033[32m"
  [yellow]="\033[33m"
  [blue]="\033[34m"
  [magenta]="\033[35m"
  [cyan]="\033[36m"
  [white]="\033[37m"
)
BOLD="\033[1m"
RESET="\033[0m"

usage() {
  echo -e "${BOLD}Usage:${RESET} $0 [options]"
  echo
  echo -e "${BOLD}Example usage:${RESET} $0 -s dots5 -c green -m 'Loading files...'"
  echo
  echo -e "${BOLD}Options:${RESET}"
  echo -e "  ${COLORS[cyan]}-s, --spinner NAME${RESET}      Use spinner (default: ${COLORS[green]}$DEFAULT_SPINNER${RESET}${COLORS[cyan]})"
  echo -e "  ${COLORS[cyan]}-i, --interval N${RESET}        Set speed 0=slow, 1=default, 2=fast (default: 1)"
  echo -e "  ${COLORS[cyan]}-l, --list${RESET}              List available spinners"
  echo -e "  ${COLORS[cyan]}-c, --color COLOR${RESET}       Spinner & message color (red, green, yellow, blue, magenta, cyan, white)"
  echo -e "  ${COLORS[cyan]}-d, --duration SECONDS${RESET}  Run spinner for fixed seconds and stop"
  echo -e "  ${COLORS[cyan]}-m, --message TEXT${RESET}      Show a message next to spinner"
  echo -e "  ${COLORS[cyan]}-h, --help${RESET}              Show this help message"
  echo
  echo -e "${BOLD}Usage with pipe:${RESET} ./myscript.py | $0 --spinner dots5 -m 'Processing...'"
  exit 0
}

list_spinners() {
  echo -e "${BOLD}Available spinners:${RESET}"
  for name in $(list_all_spinners); do
    local var_name="SPINNER_${name}[@]"
    local first_frames=(${!var_name})
    local preview="${first_frames[0]}"
    [ ${#first_frames[@]} -gt 1 ] && preview="$preview ${first_frames[1]}"
    [ ${#first_frames[@]} -gt 2 ] && preview="$preview ${first_frames[2]}"
    echo -e "  ${COLORS[green]}$name${RESET}  $preview..."
  done
  exit 0
}

convert_interval() {
  local user_input="$1"
  # Default if empty or invalid
  if ! [[ $user_input =~ ^[0-9]*\.?[0-9]*$ ]]; then user_input=1; fi
  (($(awk "BEGIN{print($user_input<0)}"))) && user_input=0
  (($(awk "BEGIN{print($user_input>2)}"))) && user_input=2
  awk -v val="$user_input" 'BEGIN { printf "%.3f", 0.15 - (val/2*0.1) }'
}

run_spinner() {
  local spinner="$1"
  local interval="$2"
  local color="$3"
  local message="$4"

  # Get frames for the spinner
  local var_name="SPINNER_${spinner}[@]"
  frames=(${!var_name})

  if [ ${#frames[@]} -eq 0 ]; then
    echo -e "${COLORS[red]}Spinner '$spinner' not found${RESET}"
    exit 1
  fi

  # Trap SIGINT (Ctrl+C) to restore cursor, print newline, and exit
  trap "tput cnorm; echo; exit" SIGINT
  # Hide cursor
  tput civis

  local i=0
  while true; do
    if [[ -n "$message" ]]; then
      # message before spinner
      printf "\r${color}${message} ${frames[i]}${RESET}"
    else
      printf "\r${color}${frames[i]}${RESET}"
    fi
    sleep "$interval"
    # Cycle the index
    ((i = (i + 1) % ${#frames[@]}))
  done
}

# --- defaults ---
spinner="$DEFAULT_SPINNER"
interval="$DEFAULT_INTERVAL"
color="${COLORS[$DEFAULT_COLOR]}"
duration=""
message=""

# --- parse args ---
# Check for no arguments to run the default spinner indefinitely
if [[ $# -eq 0 ]]; then
  run_spinner "$spinner" "$(convert_interval "$interval")" "$color" "$message"
  exit 0
fi

while [[ $# -gt 0 ]]; do
  case "$1" in
  -h | --help) usage ;;
  -l | --list) list_spinners ;;
  -s | --spinner)
    # Check if the spinner exists before setting it
    if spinner_exists "$2"; then
      spinner="$2"
    else
      echo -e "${COLORS[red]}Error: Spinner '$2' not found.${RESET}"
      exit 1
    fi
    shift 2
    ;;
  -i | --interval)
    interval="$2"
    shift 2
    ;;
  -c | --color)
    if [[ -n "${COLORS[$2]}" ]]; then color="${COLORS[$2]}"; else color="${COLORS[$DEFAULT_COLOR]}"; fi
    shift 2
    ;;
  -d | --duration)
    duration="$2"
    shift 2
    ;;
  -m | --message)
    message="$2"
    shift 2
    ;;
  *)
    echo -e "${COLORS[red]}Unknown option: $1${RESET}"
    usage
    ;;
  esac
done

interval=$(convert_interval "$interval")

# --- run spinner in background ---
run_spinner "$spinner" "$interval" "$color" "$message" &
spinner_pid=$!

# --- handle duration or pipe ---
if [ -n "$duration" ]; then
  # Run for a fixed duration
  sleep "$duration"
  kill $spinner_pid 2>/dev/null
elif [ ! -t 0 ]; then
  # Input is coming from a pipe (stdin is not a terminal)
  # Read/discard all piped input, then kill the spinner
  cat >/dev/null
  kill $spinner_pid 2>/dev/null
else
  # No duration, no pipe → wait indefinitely until killed (e.g., by Ctrl+C/SIGINT)
  wait $spinner_pid
fi

# Restore cursor and finish line
tput cnorm
echo
