
exit(){
    . "$RCFILES/.bash_logout"
    command exit
}

confbsh(){
    local files=($(ls -A $RCFILES))
    local index=0

    printf "%s\n\n" ' --- Personal configurations --- '

    for file in "${files[@]}"; do
      local bash_file=$(echo "$file" | sed 's/^.*bash[_]\?\(.*\)$/\U\1/' )
      local dot_file=$(echo "$bash_file" | sed 's/^\.\(.*\)/\U\1/' )
      local ext_file=$(echo "$dot_file" | sed 's/^\([a-z]*\)\..*/\U\1/' )
      printf "%d: %s\n" "$((++index))" "$ext_file"
    done

    printf "\n"
    read -p "Enter an available bash configuration number: " selection

    if [[ $selection -ge 1 && $selection -le ${#files[@]} ]]; then
      local selected_file="${files[$((selection-1))]}"
      vim "$RCFILES/$selected_file"
    else
      printf "\n%s" "Invalid selection. Please enter a valid number."
    fi
}

cbs(){
    local files=($(ls -A $RCFILES))
    local index=0
    local RED="\e[0;31m"
    local GREEN="\e[0;32m"
    local YELLOW="\e[1;33m"
    local NC="\e[0m"

    printf "%s\n\n" ' --- Personal configurations --- '

    for file in "${files[@]}"; do
        if [[ "$file" =~ ^".bash"* ]]; then
	    printf "%d: ${GREEN}%s${NC}\n" $((++index)) "$( echo "$file" | sed 's/^.*bash[_]\?\(.*\)$/\U\1/' )"
    	elif [[ "$file" =~ ^\. ]]; then
	    printf "%d: ${RED}%s${NC}\n" $((++index)) "$(echo "$file" | sed 's/^\.\(.*\)/\U\1/' )"
    	else
	    printf "%d: ${YELLOW}%s${NC}\n" $((++index)) "$(echo "$file" | sed 's/^\([a-z]*\)\..*/\U\1/' )"
	fi
    done

    printf "\n"
    read -p "Enter an available bash configuration number: " selection

    if [[ $selection -ge 1 && $selection -le ${#files[@]} ]]; then
      local selected_file="${files[$((selection-1))]}"
      vim "$RCFILES/$selected_file"
    else
      printf "\n%s" "Invalid selection. Please enter a valid number."
    fi
}
