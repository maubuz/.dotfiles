# Design principles:
# 1. Must be re-runnable without side-effects
# 2. Must work for dnf (Fedora) and apt (Ubuntu, Debian and Raspberry Pi OS).

function get-script-path()
{
  # Var BASH_SOURCE[0] holds the filename of the executing script
  local SCRIPT_PATH=$(realpath "${BASH_SOURCE[0]}")

  # Assure path is not zero length and is a file
  if [[ -z "$SCRIPT_PATH" || ! -f "$SCRIPT_PATH" ]]; then
    echo "Error: Cannot resolve the path of the script" >&2
    exit 1
  fi
  
  # Get only directory path to file
  local DIR_PATH=$(dirname "${SCRIPT_PATH}")

  # Assure dir path is not zero length is a directory
  if [[ -z "$DIR_PATH" || ! -d "$DIR_PATH" ]]; then
    echo "Error: Cannot resolve the directory of the script" >&2
    exit 1
  fi

  echo "$DIR_PATH"
}

# `get-package-manager` must be in the same dir as this script
PACKAGE_MANAGER_SCRIPT="$(get-script-path)/get-package-manager.sh"

# Assure file exists and is readable before sourcing
if [[ -r $PACKAGE_MANAGER_SCRIPT ]]; then
  source "$PACKAGE_MANAGER_SCRIPT"
else
  echo "Error: Cannot read $PACKAGE_MANAGER_SCRIPT" >&2
  exit 1
fi

PACKAGE_MANAGER=$(get-package-manager)
echo "Using package manager $PACKAGE_MANAGER"

# Assure package manager successfully set from `get-package-manager.sh`
if [ -n "$PACKAGE_MANAGER" ]; then
  
    sudo $PACKAGE_MANAGER update -y

    # fd: simple, fast and user-friendly alternative to 'find', writen in rust
    # https://github.com/sharkdp/fd
    sudo $PACKAGE_MANAGER install fd-find -y
fi
