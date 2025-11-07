# 🚀 Claude Code Interactive Project Setup

**Version:** 2.0 - Interactive Edition
**Last Updated:** November 2025

---

## ✨ How to Use This Guide

This is your **interactive project setup assistant**. Just follow these 3 simple steps:

### 📋 Three Simple Steps

```bash
# 1. Create your project folder
mkdir my-awesome-app

# 2. Enter the folder
cd my-awesome-app

# 3. Tell Claude to start
```

Then say to Claude:
```
Start a new project.
```

That's it! Claude will ask you questions and create everything for you! 🎉

---

## 🤖 What Claude Should Do

**When user says "Start a new project" in an empty folder:**

### Phase 1: Welcome & Validation ✅

1. **Welcome the user:**
   ```
   🎉 Welcome! Let's set up your new project!

   I'll ask you some questions and create all the necessary files.
   This will take about 2-3 minutes.

   Current directory: /path/to/project
   ```

2. **Validate environment:**
   - Check if git is installed
   - Check if folder is empty (or has only basic files)
   - Confirm folder name is what user wants

3. **Ask if they want to continue:**
   ```
   Ready to begin? (yes/no)
   ```

---

### Phase 2: Gather Project Information 📝

**Ask these questions one at a time:**

#### Question 1: Basic Info
```
What is your project name?
Example: "XRP Watchdog" or "My Awesome API"
```

#### Question 2: Description
```
Describe your project in one sentence:
Example: "A REST API for managing user authentication"
```

#### Question 3: Project Type
```
What type of project is this?

1. 🐍 Python CLI Tool
2. 🌐 Web Application (Backend + Frontend)
3. 📊 Data Pipeline / Data Science
4. 📦 Python Package / Library
5. 🔧 DevOps / Infrastructure
6. 🤖 Other (I'll ask more questions)

Choose a number:
```

#### Question 4: Technology Stack
```
What technologies will you use?

For Python projects:
- Framework? (Django/Flask/FastAPI/None)
- Database? (PostgreSQL/MySQL/SQLite/MongoDB/None)

For Web projects:
- Backend? (Node.js/Python/Go/Rust)
- Frontend? (React/Vue/Svelte/Vanilla JS)
- Database? (Same as above)

For Data projects:
- Tools? (Jupyter/Pandas/Airflow/Spark)
- Database? (PostgreSQL/ClickHouse/Redshift)

Tell me your stack:
```

#### Question 5: GitHub Details
```
Will this be on GitHub?

1. Yes - I have a repository
2. Yes - I want to create one
3. No - Local only for now

Choose a number:
```

*If yes:*
```
What's your GitHub username?
Example: "realgrapedrop"
```

#### Question 6: Maintainer Info
```
Who is maintaining this project?

Your name/handle:
Example: "Tim Melander" or "@timmelander"
```

#### Question 7: Additional Features
```
Do you need any of these? (select all that apply, comma-separated)

1. Docker configuration
2. CI/CD (GitHub Actions)
3. Pre-commit hooks
4. Testing setup (pytest/jest)
5. Documentation site (MkDocs/Sphinx)
6. None of these

Example: "1,3,4" or "6"
```

---

### Phase 3: Create Project Structure 🏗️

**After gathering all info, Claude should:**

1. **Show a summary:**
   ```
   📋 Project Summary:

   Name: [Project Name]
   Type: [Project Type]
   Stack: [Technologies]
   GitHub: [Yes/No - username]
   Maintainer: [Name]
   Extra Features: [List]
   Security: Claude attribution will be removed (for your security)

   Ready to create? (yes/no)
   ```

2. **If user confirms, create everything:**

   ```bash
   # Initialize git
   git init

   # Create folder structure
   mkdir -p .project docs scripts tests

   # Create .project/PROJECT.md
   # (filled with user's answers)

   # Create .gitignore
   # (customized for their stack)

   # Create README.md
   # (filled with their info)

   # Create requirements.txt or package.json
   # (based on stack)

   # Create additional files based on selections
   # (Docker, GitHub Actions, etc.)
   ```

3. **Show progress:**
   ```
   ✅ Created .project/PROJECT.md
   ✅ Created .gitignore
   ✅ Created README.md
   ✅ Created requirements.txt
   ✅ Initialized git repository
   📦 Created folder structure
   ```

4. **Commit initial setup:**
   ```bash
   git add .
   git commit -m "chore: Initial project setup"
   ```

5. **Remove Claude attribution (for security):**
   ```bash
   # Create backup tag first
   git tag backup-before-cleanup

   # Remove Claude attribution from git history
   FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch --msg-filter '
     sed "/🤖 Generated with \\[Claude Code\\]/d; /Co-Authored-By: Claude/d"
   ' --tag-name-filter cat -- --all

   # Verify removal
   if git log --all --format='%B' | grep -i "claude\|anthropic"; then
     echo "⚠️  Warning: Some Claude references remain"
   else
     echo "✅ Claude attribution removed successfully"
   fi

   # Cleanup
   git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
   git reflog expire --expire=now --all
   git gc --prune=now --aggressive
   ```

6. **Final message:**
   ```
   🎉 All done! Your project is ready!

   📁 Project structure created
   📝 All documentation in place
   🔧 Git initialized and first commit made
   🔒 Claude attribution removed (for your security)

   Next steps:
   1. Review .project/PROJECT.md
   2. Start coding!
   3. When ready: git remote add origin [your-repo-url]

   Need help with anything else?
   ```

---

## 📁 File Templates

### .project/PROJECT.md Template

```markdown
# {PROJECT_NAME}

## Project Overview

{PROJECT_DESCRIPTION}

**Status:** Development
**Maintainer:** {MAINTAINER_NAME}
**Repository:** {GITHUB_URL}

---

## Project Goals

- [To be defined as project develops]

---

## Technology Stack

- **Language:** {PRIMARY_LANGUAGE}
- **Framework:** {FRAMEWORK}
- **Database:** {DATABASE}
- **Infrastructure:** {INFRASTRUCTURE}

---

## Project Structure

```
{PROJECT_FOLDER_NAME}/
├── .project/              # Claude Code context
│   └── PROJECT.md         # This file
├── {CUSTOM_FOLDERS}       # Based on project type
├── .gitignore
├── README.md
└── {DEPENDENCY_FILE}      # requirements.txt or package.json
```

---

## Key Architecture Decisions

### To Be Documented

As architectural decisions are made, document them here with:
- **Decision:** What was decided
- **Why:** Reasoning behind it
- **Trade-offs:** What we're giving up

---

## Development Workflow

```bash
# Setup
{SETUP_COMMANDS}

# Run locally
{RUN_COMMANDS}

# Test
{TEST_COMMANDS}
```

---

## Environment Variables

Required environment variables (if any):

```bash
# Add as needed
# EXAMPLE_VAR=value
```

---

## Claude Code Guidelines

### Commit Messages
Use conventional commits:
- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation
- `refactor:` Code refactoring
- `test:` Tests
- `chore:` Maintenance

### Code Style
- Follow {LANGUAGE} best practices
- Write clear, self-documenting code
- Add comments for complex logic

### Testing
- Write tests for new features
- Run tests before committing
- Aim for good coverage

---

**Created:** {DATE}
**Version:** 1.0
```

---

### .gitignore Template

**Base template (all projects):**

```gitignore
# Environment files - NEVER COMMIT SECRETS
.env
*.env
.env.local
.env.*.local
secrets/
credentials.json
*.key
*.pem

# OS files
.DS_Store
Thumbs.db
*.swp
*.swo
*~

# IDEs
.vscode/
.idea/
*.swp

# Temporary files
tmp/
temp/
*.tmp
*.temp

# Logs
logs/
*.log

# Data & Backups
data/
backups/
*.db
*.sqlite

# Build artifacts
dist/
build/
```

**Python-specific additions:**

```gitignore
# Python
venv/
env/
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
*.egg-info/
*.egg
```

**Node.js-specific additions:**

```gitignore
# Node.js
node_modules/
npm-debug.log
yarn-error.log
package-lock.json
.npm/
```

**Docker additions (if selected):**

```gitignore
# Docker
docker-compose.override.yml
.docker/
```

---

### README.md Template

```markdown
# {PROJECT_NAME}

{PROJECT_DESCRIPTION}

## ✨ Features

- Feature 1 (to be implemented)
- Feature 2 (to be implemented)
- Feature 3 (to be implemented)

## 🚀 Quick Start

### Prerequisites

- {LANGUAGE} {VERSION}
- {DATABASE} (if applicable)
- {OTHER_REQUIREMENTS}

### Installation

```bash
# Clone repository (if using GitHub)
git clone https://github.com/{GITHUB_USERNAME}/{REPO_NAME}.git
cd {REPO_NAME}

{SETUP_COMMANDS}
```

### Usage

```bash
{RUN_COMMANDS}
```

## 📖 Documentation

See [docs/](./docs/) for detailed documentation.

## 🧪 Testing

```bash
{TEST_COMMANDS}
```

## 🤝 Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📝 License

{LICENSE_TYPE}

## 👤 Author

**{MAINTAINER_NAME}**
- GitHub: [@{GITHUB_USERNAME}]

## 🙏 Acknowledgments

Built with the help of Claude Code.
```

---

## 🎯 Advanced: Project Type Configurations

### Python CLI Tool 🐍

**Folder structure:**
```
project/
├── .project/PROJECT.md
├── src/
│   ├── __init__.py
│   ├── cli.py
│   └── core.py
├── tests/
│   └── test_core.py
├── setup.py
├── requirements.txt
├── .gitignore
└── README.md
```

**requirements.txt:**
```
click>=8.0.0
```

**setup.py:**
```python
from setuptools import setup, find_packages

setup(
    name="{PROJECT_NAME}",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        'click>=8.0.0',
    ],
    entry_points={
        'console_scripts': [
            '{CLI_NAME}={PACKAGE_NAME}.cli:main',
        ],
    },
)
```

---

### Web Application 🌐

**Folder structure:**
```
project/
├── .project/PROJECT.md
├── backend/
│   ├── app.py
│   ├── models/
│   ├── routes/
│   └── tests/
├── frontend/
│   ├── src/
│   ├── public/
│   └── package.json
├── docker-compose.yml
├── .gitignore
└── README.md
```

**docker-compose.yml:**
```yaml
version: '3.8'

services:
  backend:
    build: ./backend
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/dbname
    depends_on:
      - db

  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
    depends_on:
      - backend

  db:
    image: postgres:15
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=pass
      - POSTGRES_DB=dbname
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

---

### Data Pipeline 📊

**Folder structure:**
```
project/
├── .project/PROJECT.md
├── pipelines/
│   ├── extract.py
│   ├── transform.py
│   └── load.py
├── notebooks/
│   └── exploration.ipynb
├── sql/
│   └── schema.sql
├── config/
│   └── pipeline_config.yaml
├── tests/
├── requirements.txt
├── .gitignore
└── README.md
```

**requirements.txt:**
```
pandas>=2.0.0
numpy>=1.24.0
sqlalchemy>=2.0.0
jupyter>=1.0.0
```

---

## 🛡️ Security: Claude Attribution Removal (Automatic)

**This happens automatically during setup for your security.**

Claude automatically removes its attribution from git commit history after the initial commit. This ensures:
- Only the repository owner appears as the contributor
- No reference to AI assistance in public repositories
- Clean commit history with proper attribution
- Enhanced privacy and security for your project

The process is fully automated and creates a backup tag before making changes.

```bash
# Create backup tag first
git tag backup-before-cleanup

# Remove Claude attribution
FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch --msg-filter '
  sed "/🤖 Generated with \[Claude Code\]/d; /Co-Authored-By: Claude/d"
' --tag-name-filter cat -- --all

# Verify
git log --all --format='%B' | grep -i "claude\|anthropic" || echo "✅ Clean!"

# Cleanup
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all
git gc --prune=now --aggressive
```

---

## 🎨 Optional Features

### Docker Configuration 🐳

**Create Dockerfile:**

**Python:**
```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
```

**Node.js:**
```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

CMD ["node", "index.js"]
```

---

### GitHub Actions CI/CD 🔄

**Create .github/workflows/test.yml:**

```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.11'

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
        pip install pytest pytest-cov

    - name: Run tests
      run: |
        pytest --cov=./ --cov-report=xml

    - name: Upload coverage
      uses: codecov/codecov-action@v3
```

---

### Pre-commit Hooks 🪝

**Create .pre-commit-config.yaml:**

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files
      - id: check-merge-conflict

  - repo: https://github.com/psf/black
    rev: 23.7.0
    hooks:
      - id: black

  - repo: https://github.com/pycqa/flake8
    rev: 6.0.0
    hooks:
      - id: flake8
```

**Install:**
```bash
pip install pre-commit
pre-commit install
```

---

### Testing Setup 🧪

**Python (pytest):**

**tests/conftest.py:**
```python
import pytest

@pytest.fixture
def sample_data():
    return {"key": "value"}
```

**tests/test_example.py:**
```python
def test_example(sample_data):
    assert sample_data["key"] == "value"
```

**pytest.ini:**
```ini
[pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
```

---

## 📚 Quick Reference

### Trigger Phrases for Claude

- **"Start a new project"** - Interactive setup
- **"Read .project/PROJECT.md then [task]"** - Context-aware help
- **"Update PROJECT.md with [info]"** - Keep context current
- **"Following our architecture, [task]"** - Architecture-aware coding

### Common Next Steps After Setup

```bash
# 1. Review generated files
cat .project/PROJECT.md
cat README.md

# 2. Set up virtual environment (Python)
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# 3. Connect to GitHub (if applicable)
gh repo create {repo-name} --public --source=. --remote=origin
git push -u origin main

# 4. Start developing!
```

---

## 🆘 Troubleshooting

### "Claude didn't ask me questions"

**Solution:**
Make sure you said exactly: **"Start a new project"** in an empty or nearly-empty folder.

---

### "Claude created wrong folder structure"

**Solution:**
You can tell Claude to regenerate:
```
"I need to change the project type. Let's start over with the folder structure.
Keep existing files but reorganize them for a [Python CLI/Web App/etc.]"
```

---

### "I want to change my answers"

**Solution:**
Just update `.project/PROJECT.md` directly:
```bash
nano .project/PROJECT.md
```

Then tell Claude:
```
"I updated PROJECT.md with new information. Please read it and adjust [what needs changing]."
```

---

## 💡 Pro Tips

### Tip 1: Keep This Guide Accessible

Save it somewhere permanent:

```bash
# Recommended location
mkdir -p ~/.config/claude-code
cp /tmp/claude-code-project-setup-guide.md ~/.config/claude-code/

# Or in your Documents
cp /tmp/claude-code-project-setup-guide.md ~/Documents/
```

Then reference it for every new project!

---

### Tip 2: Customize the Templates

Fork this guide and customize templates for your common project types:

```bash
# Your personalized version
~/.config/claude-code/my-setup-guide.md
```

Add your preferred:
- Code style preferences
- Favorite libraries
- Team conventions
- Company standards

---

### Tip 3: Multiple Project Types

Create variant guides for different needs:

```
~/.config/claude-code/
├── setup-guide.md              # This master guide
├── setup-python-cli.md         # Python CLI preset
├── setup-web-app.md            # Web app preset
└── setup-data-science.md       # Data science preset
```

Each preset pre-fills common choices.

---

## 🎉 You're Ready!

That's it! Now you can:

1. **Create project folder**
2. **cd into it**
3. **Say "Start a new project"**

Claude will handle the rest! 🚀

---

**Remember:** Keep this guide somewhere permanent (not in /tmp!) and reference it for every new project.

**Happy coding!** 💻✨

---

**Guide Version:** 2.0 Interactive
**Last Updated:** November 2025
**Based on:** XRP Watchdog project learnings
