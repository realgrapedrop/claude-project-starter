# Claude Project Starter

**Intelligent project initialization for Claude Code**

Stop manually setting up projects. Let Claude do it for you with smart, interactive project initialization.

## ✨ Features

- 🤖 **Smart Detection** - Knows if you're starting fresh, analyzing existing code, or continuing work
- 📋 **Interactive Setup** - Claude asks the right questions and creates everything
- 🎯 **Context-Aware** - Uses `.project/PROJECT.md` to maintain project understanding
- 🚫 **Clean Git History** - No AI attribution in commits (for your security)
- ⚡ **Fast** - From empty folder to working project in 3 minutes

## 🚀 Quick Start

### Prerequisites

- [Claude Code](https://claude.com/claude-code) installed
- Git installed
- Bash shell (Linux, macOS, or WSL on Windows)

### Installation

```bash
# Clone this repository
git clone https://github.com/realgrapedrop/claude-project-starter.git
cd claude-project-starter

# Run installer
./install.sh

# Reload your shell
source ~/.bashrc  # or ~/.zshrc
```

### Usage

```bash
# Create a new project
mkdir my-awesome-app
cd my-awesome-app
project-init
```

That's it! Claude will guide you through the rest.

## 📖 How It Works

### Three Scenarios

**1. Empty Directory (New Project)**
```bash
mkdir new-project
cd new-project
project-init
```
→ Claude asks questions and creates full project structure

**2. Existing Code (No Setup)**
```bash
cd existing-project  # has code but no .project/
project-init
```
→ Claude analyzes your code and creates PROJECT.md with context

**3. Initialized Project**
```bash
cd my-project  # has .project/PROJECT.md
project-init
```
→ Claude loads context and asks what you want to work on

### What Gets Created

When starting a new project, Claude creates:

```
your-project/
├── .project/
│   └── PROJECT.md          # Claude's project context
├── .gitignore              # Appropriate for your stack
├── README.md               # Project documentation
├── src/ or app/            # Based on project type
├── tests/                  # Test structure
└── [stack-specific files]  # requirements.txt, package.json, etc.
```

## 🎯 Example Workflow

### Starting a Python CLI Tool

```bash
$ mkdir weather-cli
$ cd weather-cli
$ project-init

╔══════════════════════════════════════════════════════════╗
║          Claude Project Starter                          ║
╚══════════════════════════════════════════════════════════╝

📁 Empty Directory Detected

This looks like a new project!

Start a new project here? (yes/no): yes

Launching Claude Code to set up your project...
```

Claude then asks:
- Project name: "Weather CLI"
- Description: "A command-line tool to fetch weather forecasts"
- Type: Python CLI
- Technologies: Python 3.11, click, requests
- GitHub: Yes - yourusername
- Features: Testing setup

Claude creates everything and you're ready to code!

## 🛠️ Configuration

### Master Template

The master template guides Claude on project setup:

**Location:** `~/.config/claude-code/claude-code-project-setup-master.md`

**Customize it:**
```bash
nano ~/.config/claude-code/claude-code-project-setup-master.md
```

Add your preferences:
- Default tech stack
- Coding style preferences
- Company standards
- Custom project types

### Project Context

Each project gets a `.project/PROJECT.md` file:

```markdown
# Your Project Name

## Project Overview
[Auto-generated description]

## Technology Stack
- Language: Python 3.11
- Framework: Click
- Database: None

## Architecture
[Key decisions and structure]

## Git Commit Guidelines
- No AI attribution in commits
- Follow conventional commits
```

Claude reads this file to understand your project!

## 📚 Documentation

See [docs/USAGE.md](docs/USAGE.md) for detailed usage guide.

## 🗑️ Uninstall

```bash
cd claude-project-starter
./uninstall.sh
```

Then manually remove PATH entry from `~/.bashrc` or `~/.zshrc`

## 🤝 Contributing

Contributions welcome! This project was built to make Claude Code project setup effortless.

### Development

```bash
git clone https://github.com/realgrapedrop/claude-project-starter.git
cd claude-project-starter

# Make your changes

# Test locally
./install.sh
project-init
```

## 💡 Tips & Tricks

### Tip 1: Update PROJECT.md as You Go

When you make architecture decisions:
```bash
nano .project/PROJECT.md
# Add your decisions to "Key Architecture Decisions"
```

Then tell Claude:
```
"I updated PROJECT.md with our new caching strategy. Please review it."
```

### Tip 2: Use for Existing Projects

Already have a project? Add PROJECT.md:
```bash
cd existing-project
project-init
# Choose option 1: Analyze existing code
```

### Tip 3: Multiple Project Types

Customize the master template for different project types:
```bash
cp ~/.config/claude-code/claude-code-project-setup-master.md \
   ~/.config/claude-code/web-app-template.md

# Edit web-app-template.md with web-specific defaults
```

## 🔒 Security & Privacy

### No AI Attribution in Git

This tool ensures Claude's contributions aren't attributed in your git history. All commits show only you as the author.

**Why?**
- Professional git history
- Clear project ownership
- Prevents GitHub contributor pollution
- Your code, your credit

### What's Safe

- ✅ Using Claude Code (it's a tool, like an IDE)
- ✅ Getting AI help with coding
- ✅ This `.project/PROJECT.md` context system

### What's Automatic

- ✅ Git commits only show your name
- ✅ No "Co-Authored-By: Claude" lines
- ✅ Clean commit history

## 📝 License

MIT License - feel free to use and modify!

## 🙏 Acknowledgments

Built with Claude Code. Inspired by the need for consistent, fast project setup that maintains clean git history.

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/realgrapedrop/claude-project-starter/issues)
- **Discussions:** [GitHub Discussions](https://github.com/realgrapedrop/claude-project-starter/discussions)

---

**Start your next project in 3 minutes instead of 30. Try it now!** 🚀
