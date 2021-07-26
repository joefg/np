#!/usr/bin/env sh

#                                    /$$
#                                   | $$
#  /$$$$$$$   /$$$$$$       /$$$$$$$| $$$$$$$ 
# | $$__  $$ /$$__  $$     /$$_____/| $$__  $$
# | $$  \ $$| $$  \ $$    |  $$$$$$ | $$  \ $$
# | $$  | $$| $$  | $$     \____  $$| $$  | $$
# | $$  | $$| $$$$$$$/ /$$ /$$$$$$$/| $$  | $$
# |__/  |__/| $$____/ |__/|_______/ |__/  |__/
#           | $$
#           | $$
#           |__/ 
#
# np.sh - a very simple notepad for unix users

usage(){
	echo "np.sh - a very simple notepad for unix users";
	echo "Usage:";
	echo "  edit, e    :  opens notepad";
	echo "  publish, p :  publishes entire document as pdf";
}

main() {
	case $1 in
		'edit' | 'e')
				edit
				;;
		'publish' | 'p')
				publish
				;;
			*)
				usage
				;;
	esac
}

edit() {
	$EDITOR ~/.notepad.md
}

publish() {
	pandoc ~/.notepad.md -o notepad.pdf
}

main "$@"
