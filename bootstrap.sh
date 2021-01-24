#!/usr/bin/zsh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

cd "$(dirname "${BASH_SOURCE}")";

declare -a FILES_TO_SYMLINK=(

    "zshrc"
    "zsh_profile"
    "zsh_aliases"
    "zsh_options"
    "zsh_prompt"
    "zsh_function"
    "zsh_exports"
    "zsh_path"
    "zsh_windowtitle"
    "inputrc"
    "curlrc"
    "gitattributes"
    "gitconfig"
    "gitignore"
    "editorconfig"
)

i=""
sourceFile=""
targetFile=""

for i in "${FILES_TO_SYMLINK[@]}"; do
	sourceFile="$(pwd)/$i"
	targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

	if [ ! -e "$targetFile" ]; then

	    execute \
	        "ln -fs $sourceFile $targetFile" \
	        "$targetFile → $sourceFile"

	elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
	    print_success "$targetFile → $sourceFile \n"
	else
		ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
		if answer_is_yes; then

		    rm -rf "$targetFile"

		    execute \
		        "ln -fs $sourceFile $targetFile" \
		        "$targetFile → $sourceFile"
		else
		    print_error "$targetFile → $sourceFile \n"
		fi
	fi
done