
exit(){
    . "$RCFILES/.bash_logout"
    command exit
}

confbsh(){
    files=($(ls -A $RCFILES))
    index=0

    printf "%s\n\n" ' --- Bash configurations --- '

    for file in "${files[@]}"; do
      modified_file=$(echo "$file" | sed 's/^\.\(bash\|git\|less\)[_]\?\(.*\)$/\U\2/')
      printf "%d: %s\n" "$((++index))" "$modified_file"
    done

    printf "\n"
    read -p "Enter an available bash configuration number: " selection

    if [[ $selection -ge 1 && $selection -le ${#files[@]} ]]; then
      selected_file="${files[$((selection-1))]}"
      vim "$RCFILES/$selected_file"
    else
      printf "\n%s" "Invalid selection. Please enter a valid number."
    fi
}
