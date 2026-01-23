#!/bin/bash

# ClaudeFlow v3.0 Initialization Script for LAB571
# This script sets up ClaudeFlow in your Codespace

set -e

echo "=========================================="
echo "ClaudeFlow v3.0 Initialization for LAB571"
echo "=========================================="
echo ""

# Check if running in Codespace
if [ -z "$CODESPACES" ]; then
    echo "⚠️  Warning: Not running in GitHub Codespaces"
    echo "This script is optimized for Codespaces but will continue anyway."
    echo ""
fi

# Check for Node.js
echo "📦 Checking prerequisites..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

echo "✅ Node.js $(node --version) detected"

# Check for npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ npm $(npm --version) detected"

# Install ClaudeFlow globally
echo ""
echo "📥 Installing ClaudeFlow v3.0..."
npm install -g @claude/flow@v3alpha || {
    echo "❌ Failed to install ClaudeFlow"
    echo "Trying alternative installation method..."
    npx @claude/flow@v3alpha --version || {
        echo "❌ ClaudeFlow installation failed completely"
        echo "Please check your network connection and try again"
        exit 1
    }
}

echo "✅ ClaudeFlow installed successfully"

# Verify installation
echo ""
echo "🔍 Verifying ClaudeFlow installation..."
if npx claude-flow@v3alpha --version &> /dev/null; then
    VERSION=$(npx claude-flow@v3alpha --version)
    echo "✅ ClaudeFlow $VERSION is ready"
else
    echo "⚠️  ClaudeFlow installed but verification failed"
    echo "You may need to restart your terminal"
fi

# Create .claude-flow directory
echo ""
echo "📁 Setting up ClaudeFlow directories..."
mkdir -p .claude-flow/logs
mkdir -p .claude-flow/memory
mkdir -p .claude-flow/workflows
echo "✅ Directories created"

# Copy example config if it doesn't exist
if [ ! -f "claude-flow.json" ]; then
    echo ""
    echo "📝 Creating ClaudeFlow configuration..."
    if [ -f "claude-flow.example.json" ]; then
        cp claude-flow.example.json claude-flow.json
        echo "✅ Configuration file created from example"
    else
        echo "⚠️  Example config not found, skipping"
    fi
else
    echo "ℹ️  Configuration file already exists"
fi

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo ""
    echo "🔐 Creating .env file..."
    cat > .env << 'EOF'
# Claude API Configuration
ANTHROPIC_API_KEY=your_claude_api_key_here

# Microsoft Foundry Configuration
FOUNDRY_API_KEY=your_foundry_api_key_here
FOUNDRY_ENDPOINT=your_foundry_endpoint_here

# ClaudeFlow Configuration
CLAUDE_FLOW_MEMORY_PATH=.claude-flow/memory/memory.db
CLAUDE_FLOW_LOG_LEVEL=info
EOF
    echo "✅ .env file created"
    echo "⚠️  Remember to update .env with your actual API keys!"
else
    echo "ℹ️  .env file already exists"
fi

# Initialize ClaudeFlow
echo ""
echo "🚀 Initializing ClaudeFlow..."
npx claude-flow@v3alpha init --silent || {
    echo "⚠️  ClaudeFlow initialization had issues, but continuing..."
}

echo ""
echo "=========================================="
echo "✅ ClaudeFlow v3.0 Setup Complete!"
echo "=========================================="
echo ""
echo "📖 Next Steps:"
echo "1. Update your .env file with actual API keys"
echo "2. Read CLAUDEFLOW_SETUP.md for detailed usage"
echo "3. Read DELEGATION_GUIDE.md to learn how to delegate work"
echo "4. Try: npx claude-flow@v3alpha --help"
echo ""
echo "🎯 Quick Test:"
echo "   npx claude-flow@v3alpha agent list"
echo ""
echo "Happy coding! 🚀"
