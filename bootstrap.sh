#!/usr/bin/zsh

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

cd "$(dirname "${BASH_SOURCE}")";

declare -a FILES_TO_SYMLINK1=(

    "zshrc"
    "inputrc"
    "curlrc"
    "gitattributes"
    "gitconfig"
    "gitignore"
    "editorconfig"
)

declare -a FILES_TO_SYMLINK2=(

    "zsh_aliases"
    "zsh_path"
)

i=""
sourceFile=""
targetFile=""

for i in "${FILES_TO_SYMLINK1[@]}"; do
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

for i in "${FILES_TO_SYMLINK2[@]}"; do
	sourceFile="$(pwd)/$i"
	targetFile="$HOME/.oh-my-zsh/custom/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g").zsh"

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