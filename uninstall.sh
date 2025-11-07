#!/usr/bin/env bash
# Claude Project Starter - Uninstaller
# Removes the project initialization system

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Installation paths
CONFIG_DIR="${HOME}/.config/claude-code"
BIN_DIR="${HOME}/.local/bin"

echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}       Claude Project Starter - Uninstaller              ${BLUE}║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo

# Confirm uninstallation
echo -e "${YELLOW}This will remove:${NC}"
echo "  - $BIN_DIR/claude-project-init"
echo "  - $CONFIG_DIR/ (config directory)"
echo
read -p "Continue with uninstallation? (yes/no): " -r
echo

if [[ ! $REPLY =~ ^[Yy]es$ ]]; then
    echo "Uninstallation cancelled."
    exit 0
fi

# Remove claude-project-init script
if [ -f "$BIN_DIR/claude-project-init" ]; then
    rm "$BIN_DIR/claude-project-init"
    echo -e "${GREEN}✓${NC} Removed $BIN_DIR/claude-project-init"
else
    echo -e "${BLUE}ℹ${NC} claude-project-init not found (already removed?)"
fi

# Remove config directory
if [ -d "$CONFIG_DIR" ]; then
    rm -rf "$CONFIG_DIR"
    echo -e "${GREEN}✓${NC} Removed $CONFIG_DIR"
else
    echo -e "${BLUE}ℹ${NC} Config directory not found (already removed?)"
fi

# Note about PATH
echo
echo -e "${YELLOW}Note:${NC} You may want to remove the PATH entry from your shell config:"
echo
echo "  # Detect shell"
if [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
else
    SHELL_RC="$HOME/.bashrc"
fi

echo "  nano $SHELL_RC"
echo "  # Remove these lines:"
echo "  # Claude Project Starter"
echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
echo

echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}            Uninstallation Complete!                     ${BLUE}║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo
echo "Claude Project Starter has been removed."
echo
