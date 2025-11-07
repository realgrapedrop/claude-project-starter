# Claude Project Starter

## Project Overview

An intelligent project initialization system for Claude Code that provides smart, context-aware project setup without manual configuration.

## Purpose

Stop manually setting up projects and creating context files. This tool automatically:
- Detects project state (empty, existing code, or initialized)
- Guides Claude through interactive project setup
- Maintains project context in `.project/PROJECT.md` files
- Ensures clean git history (no AI attribution)

## Technology Stack

- **Language**: Bash
- **Installation**: PATH-based (no sudo required)
- **Config Location**: `~/.config/claude-code/` (XDG Base Directory standard)
- **Install Location**: `~/.local/bin/`

## Architecture

### Installation Flow

1. User runs `./install.sh`
2. Script checks for Claude Code installation
3. Creates `~/.config/claude-code/` directory
4. Copies master template to config directory
5. Installs `project-init` to `~/.local/bin/`
6. Adds `~/.local/bin` to PATH in shell config

### Project Detection Logic

The `claude-project-init` script uses three-way detection:

**Scenario 1: Empty Directory**
- No files or directories detected
- Prompts: "Start a new project here?"
- Action: Launches Claude with master template to create full project structure

**Scenario 2: Existing Code (No Setup)**
- Has files but no `.project/PROJECT.md`
- Offers 3 options:
  1. Analyze existing code and create PROJECT.md
  2. Start fresh (incorporate existing files)
  3. Just chat with Claude (no setup)

**Scenario 3: Initialized Project**
- Has `.project/PROJECT.md` file
- Prompts: "What would you like to work on?"
- Action: Launches Claude with project context loaded

### Master Template System

**Location**: `~/.config/claude-code/claude-code-project-setup-master.md`

**Purpose**: Guides Claude on how to set up new projects interactively

**Content**:
- Project setup workflow
- Questions to ask (name, description, type, technologies)
- Git commit guidelines (no AI attribution)
- Structure templates for different project types

## Key Components

### `/bin/claude-project-init`
- Main executable script
- Detects directory state
- Launches Claude Code with appropriate prompts
- Handles interactive user input

### `/install.sh`
- Installation script
- Creates directories
- Copies files to `~/.local/bin/claude-project-init`
- Manages PATH configuration
- Interactive with colored output

### `/uninstall.sh`
- Clean removal script
- Removes installed files
- Provides instructions for manual PATH cleanup

### `/templates/claude-code-project-setup-master.md`
- Master template file (copied to `~/.config/claude-code/` during install)
- Contains project setup instructions for Claude
- Includes git commit guidelines

### `/.project/PROJECT.md`
- This file!
- Contains project context for Claude to understand the project

## File Structure

```
claude-project-starter/
├── .project/
│   └── PROJECT.md              # Project context (this file)
├── bin/
│   └── claude-project-init     # Main initialization script
├── templates/
│   └── claude-code-project-setup-master.md  # Master template
├── docs/                       # Future documentation
├── .gitignore                  # Git ignore rules
├── install.sh                  # Installer
├── uninstall.sh                # Uninstaller
└── README.md                   # GitHub documentation
```

## Usage

### For End Users

```bash
# Install
cd ~/projects/claude-project-starter
./install.sh
source ~/.bashrc

# Use
mkdir my-project
cd my-project
claude-project-init
```

### For Development

```bash
# Work on this project
cd ~/projects/claude-project-starter

# Make changes to scripts

# Test locally
./install.sh
cd /tmp/test-project
claude-project-init
```

## Git Commit Guidelines

### Attribution Policy
- **DO NOT** include AI assistant attribution in commit messages
- **DO NOT** add `Co-Authored-By: Claude` or similar AI attribution
- **DO NOT** reference AI tools in commit message bodies
- All commits should be attributed solely to the project owner (realgrapedrop)

### Commit Message Format
```
Brief description of changes

- Bullet point details of what changed
- Technical implementation notes
- Bug fixes or feature additions
```

**Good Example:**
```
Add smart project detection to initialization script

- Detect empty directories for new projects
- Detect existing code without PROJECT.md
- Detect initialized projects with PROJECT.md
- Launch Claude with appropriate context for each scenario
```

**Bad Example (DO NOT DO THIS):**
```
Add smart project detection

🤖 Generated with Claude Code

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Why No AI Attribution?
- Keeps git history clean and professional
- Maintains clear project ownership
- Prevents contributor graph pollution
- GitHub caches contributor data aggressively (can take days/weeks to clear)

### Working with AI Assistants
- AI tools (like Claude Code) are helpful development aids
- Use them freely for coding, debugging, and problem-solving
- This `.project/PROJECT.md` file helps AI understand project context
- Just don't add AI attribution to commits pushed to GitHub

## Key Design Decisions

### Why `~/.config/claude-code/`?
- Follows XDG Base Directory specification
- Standard location for user configuration
- Keeps home directory clean
- Easy to back up

### Why `~/.local/bin/`?
- Standard location for user binaries
- No sudo required
- Easy to add to PATH
- Follows Linux conventions

### Why PATH-based Installation?
- No elevated privileges needed
- User maintains full control
- Easier to uninstall
- Safer for security

### Why Three Detection Scenarios?
- Empty directory: Full setup needed
- Existing code: Context extraction needed
- Initialized project: Just need task direction
- Covers all common use cases

## Current Status

- ✅ Directory structure created
- ✅ install.sh script complete
- ✅ uninstall.sh script complete
- ✅ bin/claude-project-init script complete
- ✅ Master template copied
- ✅ README.md documentation complete
- ✅ .gitignore created
- ✅ Git repository initialized (master branch)
- ✅ Initial commit created
- ⏳ GitHub repository creation pending
- ⏳ Testing pending

## Next Steps

1. Create initial git commit
2. Test installation locally
3. Create GitHub repository: `realgrapedrop/claude-project-starter`
4. Push to GitHub
5. Test end-to-end workflow

## Dependencies

- Claude Code (required - checked during install)
- Git (for version control)
- Bash (shell interpreter)

## Future Enhancements (Potential)

- Multiple template support (web-app, CLI, data science, etc.)
- Template customization wizard
- Project type detection from existing code
- Integration with popular frameworks
- Auto-detect and suggest .gitignore patterns
- GitHub repo creation integration
