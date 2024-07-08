#!/bin/bash
# ---
# Gathers config files from around the filesystem.
# - tmux
#   - .tmux.conf
# - vscode
#   - keybindings.json
#   - settings.json
# ---

# Confirmation
read -p "This script will overwrite all configuration files with the current version in your filesystem. Are you sure you want to continue? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Config sync cancelled."
    exit 1
fi

# Filesystem paths
TMUX_CONFIG="/home/tyler/.tmux.conf"
VSCODE_USER_CONFIG_DIR="/home/tyler/.config/Code/User"
VSCODE_USER_CONFIG_KEYBINDINGS="$VSCODE_USER_CONFIG_DIR/keybindings.json"
VSCODE_USER_CONFIG_SETTINGS="$VSCODE_USER_CONFIG_DIR/settings.json"

# Repository paths
REPO_TMUX="./tmux"
REPO_VSCODE="./vscode"

# Ensure directory paths
mkdir -p tmux
mkdir -p vscode

# Document sources
echo $TMUX_CONFIG > "$REPO_TMUX/SOURCE"
echo $VSCODE_USER_CONFIG_DIR > "$REPO_VSCODE/SOURCE"

# Copy
cp $TMUX_CONFIG "$REPO_TMUX/.tmux.conf"

cp $VSCODE_USER_CONFIG_KEYBINDINGS "$REPO_VSCODE/keybindings.json"
cp $VSCODE_USER_CONFIG_SETTINGS "$REPO_VSCODE/settings.json"
