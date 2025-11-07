#!/usr/bin/env bash
# Claude Project Starter - Installer
# Installs the project initialization system

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
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}     Claude Project Starter - Installer              ${BLUE}║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo

# Check if claude-code is installed
if ! command -v claude-code >/dev/null 2>&1; then
    echo -e "${RED}✗ Claude Code is not installed${NC}"
    echo
    echo "Please install Claude Code first:"
    echo "  Visit: https://claude.com/claude-code"
    echo
    exit 1
fi

echo -e "${GREEN}✓${NC} Claude Code is installed"

# Create config directory
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
    echo -e "${GREEN}✓${NC} Created config directory: $CONFIG_DIR"
else
    echo -e "${BLUE}ℹ${NC} Config directory already exists: $CONFIG_DIR"
fi

# Create bin directory
if [ ! -d "$BIN_DIR" ]; then
    mkdir -p "$BIN_DIR"
    echo -e "${GREEN}✓${NC} Created bin directory: $BIN_DIR"
else
    echo -e "${BLUE}ℹ${NC} Bin directory already exists: $BIN_DIR"
fi

# Copy master template
if [ -f "$SCRIPT_DIR/templates/claude-code-project-setup-master.md" ]; then
    cp "$SCRIPT_DIR/templates/claude-code-project-setup-master.md" "$CONFIG_DIR/"
    echo -e "${GREEN}✓${NC} Copied master template to $CONFIG_DIR"
else
    echo -e "${YELLOW}⚠${NC} Master template not found, will be created on first use"
fi

# Copy claude-project-init script
if [ -f "$SCRIPT_DIR/bin/claude-project-init" ]; then
    cp "$SCRIPT_DIR/bin/claude-project-init" "$BIN_DIR/"
    chmod +x "$BIN_DIR/claude-project-init"
    echo -e "${GREEN}✓${NC} Installed claude-project-init to $BIN_DIR"
else
    echo -e "${RED}✗ claude-project-init script not found${NC}"
    exit 1
fi

# Add to PATH if not already there
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo
    echo -e "${YELLOW}Adding $BIN_DIR to PATH...${NC}"

    # Detect shell
    if [ -n "$BASH_VERSION" ]; then
        SHELL_RC="$HOME/.bashrc"
    elif [ -n "$ZSH_VERSION" ]; then
        SHELL_RC="$HOME/.zshrc"
    else
        SHELL_RC="$HOME/.bashrc"
    fi

    # Add to shell config
    if ! grep -q "\.local/bin" "$SHELL_RC" 2>/dev/null; then
        echo '' >> "$SHELL_RC"
        echo '# Claude Project Starter' >> "$SHELL_RC"
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
        echo -e "${GREEN}✓${NC} Added to $SHELL_RC"
    else
        echo -e "${BLUE}ℹ${NC} PATH already configured in $SHELL_RC"
    fi

    echo
    echo -e "${YELLOW}⚠${NC} Run this to use claude-project-init in current shell:"
    echo -e "   ${BLUE}source $SHELL_RC${NC}"
else
    echo -e "${GREEN}✓${NC} $BIN_DIR is already in PATH"
fi

echo
echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}     Installation Complete!                          ${BLUE}║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${NC}"
echo
echo "Usage:"
echo "  1. Create a project directory:   mkdir my-project"
echo "  2. Enter the directory:          cd my-project"
echo "  3. Initialize the project:       claude-project-init"
echo
echo "Or run 'claude-project-init' in any directory to:"
echo "  - Start a new project (if empty)"
echo "  - Analyze existing project (if has files)"
echo "  - Continue working (if has .project/PROJECT.md)"
echo
echo "To uninstall: ./uninstall.sh"
echo
