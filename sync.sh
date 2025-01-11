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
TMUX_CONFIG="$HOME/.tmux.conf"

VSCODE_USER_CONFIG_DIR="$HOME/.config/Code/User"
VSCODE_USER_CONFIG_KEYBINDINGS="$VSCODE_USER_CONFIG_DIR/keybindings.json"
VSCODE_USER_CONFIG_SETTINGS="$VSCODE_USER_CONFIG_DIR/settings.json"

ZED_CONFIG_DIR="$HOME/.config/zed"
ZED_KEYMAP="$ZED_CONFIG_DIR/keymap.json"
ZED_SETTINGS="$ZED_CONFIG_DIR/settings.json"

# Repository paths
REPO_TMUX_DIR="./tmux"
REPO_VSCODE_DIR="./vscode"
REPO_ZED_DIR="./zed"

# Ensure directory paths
mkdir -p tmux
mkdir -p vscode
mkdir -p zed

# Copy
cp $TMUX_CONFIG "$REPO_TMUX_DIR/.tmux.conf"

cp $VSCODE_USER_CONFIG_KEYBINDINGS "$REPO_VSCODE_DIR/keybindings.json"
cp $VSCODE_USER_CONFIG_SETTINGS "$REPO_VSCODE_DIR/settings.json"

cp $ZED_KEYMAP "$REPO_ZED_DIR/keymap.json"
cp $ZED_SETTINGS "$REPO_ZED_DIR/settings.json"
