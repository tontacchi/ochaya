print_fetch() {
	local lilac="\e[38;2;199;146;234m"
	local purple="\e[38;2;142;124;195m"
	local reset="\e[0m"

	printf '%b' "\
                                              ${lilac}$USER${reset}@${lilac}$(hostname)${reset}
${purple}                       ..+++:.              ${reset}  ${lilac}OS ${reset} Linux Mint 22 x86_64
${purple}                          ..++++.           ${reset}  ${lilac}├ ${reset} 6.8.0-79-generic
${purple}                            ..+++++.        ${reset}  ${lilac}├ 󰏖${reset} 3108 (dpkg), 26 (flatpak)
${purple}       +.                     .++++++.      ${reset}  ${lilac}└ ${reset} bash 5.2.21
${purple}     .+.   .++++++++.          .+++++++     ${reset}  
${purple}    .+.  ++++++++++++..         ++++++++.   ${reset}  ${lilac}WM ${reset} i3 (X11)
${purple}   .++.++++++++++++.            +++++..++.  ${reset}  ${lilac}├ 󱗼${reset} Material-Black-Plum [GTK3] 
${purple}  .++++++++++++++++            .+++++.  .*  ${reset}  ${lilac}├ ${reset} Material-Black-Plum-Numix [GTK3] 
${purple}  ++++++-.      ..+.          .++++++.   .  ${reset}  ${lilac}├ ${reset} gnome-terminal
${purple}  ++++-.           .+.      .++++++++.      ${reset}  ${lilac}└ ${reset} Hack Nerd Font Mono (13pt)
${purple}  +++:.             .++++++++++++++++       ${reset}   
${purple}  +++.              .+..     ..+++++.       ${reset}  ${lilac}PC ${reset} XPS 13 9360
${purple}  ++.               +.        .+++.         ${reset}  ${lilac}├ ${reset} Intel i7-8550U (8) @ 4.000GHz
${purple}  :+.        .     -=         .+.           ${reset}  ${lilac}├ ${reset} Intel UHD Graphics 620
${purple}  .+.       .+++++++-                       ${reset}  ${lilac}└ 󰍹${reset} 1920x1080 @ 59.93 Hz
${purple}   ..       .++++++++                       ${reset}  
${purple}              ++++++++.               ..    ${reset}  
${purple}              .++++++++..          .++.     ${reset}  
${purple}                .+++++++++++:.-+++++.       ${reset}  
${purple}                   .++++++++++++++.         ${reset}  
${purple}                    ..+++++++++.            ${reset}  
${purple}                 ...++++:..                 ${reset}  

"
}

print_fetch

