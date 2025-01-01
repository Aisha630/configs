# Copies the contents of a given file to the system or X Windows clipboard
#
# copyfile <file>
function copyfile {
  # Default to current directory if no argument
  local file="${1}"

  if [[ -z "$file" ]]; then
    echo "Error: No file specified."
    return 1
  fi

  # Resolve to absolute path
  [[ $file = /* ]] || file="$PWD/$file"

  if [[ ! -f "$file" ]]; then
    echo "Error: File not found: $file"
    return 1
  fi

  if cat "$file" | pbcopy; then
    echo ${(%):-"Contents of %B${file:a}%b copied to clipboard."}
  else
    echo "Error: Failed to copy file contents to clipboard."
    return 1
  fi
}
