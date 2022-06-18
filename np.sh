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
	echo "  edit, e    :  opens today's notepad";
	echo "  publish, p :  publishes entire series as pdf";
	echo "  list, ls   : lists all notepads;"
}

main() {
	case $1 in
		'edit' | 'e')
			edit
			;;
		'publish' | 'p')
			publish
			;;
		'list' | 'ls' )
			list
			;;
		*)
			usage
			;;
	esac
}

edit() {
	if [ ! -d ~/.notepad ]; then
		mkdir -p ~/.notepad;
	fi;

	if [ ! -f ~/.notepad/$(date -I).md ]; then
		cat << EOF > ~/.notepad/$(date -I).md
# $(date +"%A %d %B, %Y")

---
EOF
	fi;

	$EDITOR ~/.notepad/$(date -I).md;
}

publish() {
	mkdir -p ~/.notepad/generated;

	cat << EOF > ~/.notepad/generated/front.md
---
title:
- "Notepad"
author:
- $(whoami)
fontsize:
- 12pt
papersize:
- a5
geometry:
- margin=1in
---

\maketitle
\thispagestyle{empty}
\clearpage
\tableofcontents
\pagenumbering{roman}
\clearpage
\pagenumbering{arabic}
\setcounter{page}{1}

# About

This is a notepad built by [np](https://github.com/joefg/np), generated on $(date +"%A %d %B, %Y").

It is comprised of entries found inside the author's \`~/.notepad\` directory.

---

\clearpage


EOF

	if ! command -v pandoc &> /dev/null
	then
		echo "Pandoc is not installed on this system.";
	else
		pandoc ~/.notepad/generated/front.md \
			$(find ~/.notepad -name "*.md" -not -path "*/generated/*") \
			-o ~/.notepad/generated/notepad.pdf;

		echo "PDF generated at ~/.notepad/generated/notepad.pdf";
	fi
}

list() {
	find ~/.notepad -name "*.md" -not -path "*/generated/*";
}

main "$@"
