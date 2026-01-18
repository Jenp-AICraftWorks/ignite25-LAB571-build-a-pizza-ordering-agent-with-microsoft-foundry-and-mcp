# ClaudeFlow v3.0 Setup Guide for LAB571

## Overview

This guide walks you through setting up a GitHub Codespace with ClaudeFlow v3.0 for the LAB571 Pizza Ordering Agent workshop. ClaudeFlow v3.0 is an enterprise AI orchestration platform that enables multi-agent workflows and swarm intelligence.

## What is ClaudeFlow v3.0?

ClaudeFlow v3.0 is an advanced agent orchestration platform that provides:

- **Multi-Agent Orchestration**: Coordinate up to 54+ specialized Claude agents
- **Swarm Mode**: Parallel agent execution for faster development
- **Workflow Builder**: Visual interface for designing AI workflows
- **87 MCP Tools**: Comprehensive toolset for automation
- **Persistent Memory**: SQLite-based agent state and context storage
- **Real-Time Monitoring**: Track workflow progress and diagnose issues
- **Self-Optimizing**: SONA (Self-Optimizing Neural Architecture) for task routing

## Prerequisites

- GitHub account with Codespaces access
- Basic knowledge of Python and command-line interfaces
- Microsoft Foundry account (for the workshop)

## Setting Up Your Codespace

### Step 1: Create a Codespace

1. Navigate to the repository: `Jenp-AICraftWorks/ignite25-LAB571-build-a-pizza-ordering-agent-with-microsoft-foundry-and-mcp`
2. Click the green "Code" button
3. Select the "Codespaces" tab
4. Click "Create codespace on main" (or your working branch)

The Codespace will automatically:
- Install Python 3.12
- Install Azure CLI
- Install Node.js 20 LTS
- Install ClaudeFlow v3.0 CLI
- Configure all dependencies from requirements.txt

### Step 2: Verify ClaudeFlow Installation

Once your Codespace is running, verify the installation:

```bash
# Check ClaudeFlow version
npx claude-flow@v3alpha --version

# Check if Claude Flow CLI is accessible
npx claude-flow@v3alpha --help
```

### Step 3: Initialize ClaudeFlow

Initialize ClaudeFlow for your project:

```bash
# Navigate to your workspace
cd /workspaces/ignite25-LAB571-build-a-pizza-ordering-agent-with-microsoft-foundry-and-mcp

# Initialize ClaudeFlow
npx claude-flow@v3alpha init

# This will create:
# - claude-flow.json (configuration file)
# - .claude-flow/ directory (for persistent storage)
```

### Step 4: Configure Environment Variables

Create a `.env` file in the workspace root:

```bash
# Create .env file
cat > .env << 'EOF'
# Claude API Configuration
ANTHROPIC_API_KEY=your_claude_api_key_here

# Microsoft Foundry Configuration
FOUNDRY_API_KEY=your_foundry_api_key_here
FOUNDRY_ENDPOINT=your_foundry_endpoint_here

# ClaudeFlow Configuration
CLAUDE_FLOW_MEMORY_PATH=.claude-flow/memory.db
CLAUDE_FLOW_LOG_LEVEL=info
EOF
```

⚠️ **Security Note**: Never commit the `.env` file to version control. It's already in `.gitignore`.

## Using ClaudeFlow for Agent Orchestration

### Basic Commands

```bash
# Start ClaudeFlow server
npx claude-flow@v3alpha start

# Check ClaudeFlow status
npx claude-flow@v3alpha status

# View configuration
npx claude-flow@v3alpha config

# Stop ClaudeFlow
npx claude-flow@v3alpha stop
```

### Agent Management

```bash
# List available agents
npx claude-flow@v3alpha agent list

# Spawn a new agent
npx claude-flow@v3alpha agent spawn --type code-reviewer --name pizza-reviewer

# Check agent status
npx claude-flow@v3alpha agent status pizza-reviewer

# Stop an agent
npx claude-flow@v3alpha agent stop pizza-reviewer
```

### Swarm Mode for Parallel Execution

ClaudeFlow's swarm mode allows multiple agents to work on tasks simultaneously:

```bash
# Start a swarm with multiple specialized agents
npx claude-flow@v3alpha swarm create \
  --agents code-reviewer,test-specialist,documentation-expert \
  --task "Review the pizza ordering agent code"

# Monitor swarm progress
npx claude-flow@v3alpha swarm status

# Stop swarm
npx claude-flow@v3alpha swarm stop
```

## Delegating Work to ClaudeFlow Agents

### Pattern 1: Single Agent Delegation

Use this when you need one specialized agent to handle a specific task:

```bash
# Example: Delegate documentation review to documentation-expert
npx claude-flow@v3alpha delegate \
  --agent documentation-expert \
  --task "Review lab instructions in lab/ folder for clarity and completeness" \
  --context "Microsoft Ignite 2025 workshop materials"
```

### Pattern 2: Multi-Agent Workflow

Use this when tasks require multiple specialized skills:

```bash
# Example: Code review → Testing → Documentation
npx claude-flow@v3alpha workflow create pizza-code-review << 'EOF'
{
  "name": "Pizza Agent Code Review",
  "steps": [
    {
      "agent": "code-reviewer",
      "task": "Review Python code for PEP 8 compliance and best practices",
      "output": "code-review-results"
    },
    {
      "agent": "test-specialist",
      "task": "Validate test coverage and suggest additional tests",
      "input": "code-review-results",
      "output": "test-review-results"
    },
    {
      "agent": "documentation-expert",
      "task": "Update documentation based on code changes",
      "input": "test-review-results",
      "output": "final-documentation"
    }
  ]
}
EOF

# Run the workflow
npx claude-flow@v3alpha workflow run pizza-code-review
```

### Pattern 3: Swarm Intelligence for Large Tasks

Use swarm mode when you need to analyze or process large amounts of information:

```bash
# Example: Comprehensive workshop review with 5 agents in parallel
npx claude-flow@v3alpha swarm create \
  --name workshop-review \
  --agents "code-reviewer,security-specialist,test-specialist,documentation-expert,azure-specialist" \
  --mode parallel \
  --task "Complete review of LAB571 workshop materials" \
  --output workshop-review-report.json
```

## Integration with Microsoft Foundry

ClaudeFlow v3.0 integrates seamlessly with Microsoft Foundry for the workshop:

### 1. Configure MCP Tools

Edit `claude-flow.json` to add MCP tools:

```json
{
  "mcp": {
    "servers": {
      "foundry": {
        "endpoint": "${FOUNDRY_ENDPOINT}",
        "apiKey": "${FOUNDRY_API_KEY}"
      }
    },
    "tools": [
      "pizza_calculator",
      "order_management",
      "menu_retrieval"
    ]
  }
}
```

### 2. Use Foundry-Specific Agents

```bash
# Delegate Foundry-specific tasks to azure-specialist
npx claude-flow@v3alpha delegate \
  --agent azure-specialist \
  --task "Configure RAG knowledge base for pizza menu" \
  --mcp-tools foundry
```

## Workflow Examples for LAB571

### Example 1: Lab Instruction Review

```bash
npx claude-flow@v3alpha workflow create lab-review << 'EOF'
{
  "name": "Lab Instruction Review",
  "steps": [
    {
      "agent": "documentation-expert",
      "task": "Review lab/1.md through lab/6.md for clarity",
      "output": "doc-review"
    },
    {
      "agent": "test-specialist",
      "task": "Validate all code samples are runnable",
      "input": "doc-review",
      "output": "code-validation"
    }
  ]
}
EOF
```

### Example 2: Security Review

```bash
npx claude-flow@v3alpha delegate \
  --agent security-specialist \
  --task "Review MCP server configuration for API key security" \
  --files "lab/*.md,requirements.txt,.devcontainer/devcontainer.json"
```

### Example 3: Complete Workshop Validation

```bash
# Use swarm mode for comprehensive validation
npx claude-flow@v3alpha swarm create \
  --name complete-validation \
  --agents "documentation-expert,test-specialist,security-specialist,code-reviewer,azure-specialist" \
  --mode parallel \
  --task "Validate entire LAB571 workshop for Ignite 2025 deployment" \
  --output validation-report.json
```

## Monitoring and Debugging

### View Real-Time Logs

```bash
# Follow ClaudeFlow logs
npx claude-flow@v3alpha logs --follow

# View agent-specific logs
npx claude-flow@v3alpha logs --agent code-reviewer
```

### Check Memory and Performance

```bash
# View persistent memory
npx claude-flow@v3alpha memory show

# Check performance metrics
npx claude-flow@v3alpha metrics
```

### Debug Workflow Issues

```bash
# View workflow execution history
npx claude-flow@v3alpha workflow history

# Get detailed workflow execution
npx claude-flow@v3alpha workflow inspect <workflow-id>
```

## Best Practices

### 1. Agent Selection
- **code-reviewer**: Python code, PEP 8, best practices
- **documentation-expert**: Lab instructions, README, learner experience
- **test-specialist**: Workshop validation, testing procedures
- **security-specialist**: API keys, MCP configuration, credentials
- **azure-specialist**: Foundry configuration, Azure services

### 2. Task Decomposition
- Break large tasks into smaller, agent-specific subtasks
- Use workflows for multi-step processes
- Use swarm mode for parallel independent tasks

### 3. Context Provision
- Always provide clear task descriptions
- Specify relevant files and directories
- Include expected outputs and success criteria

### 4. Error Handling
- Monitor agent status regularly
- Check logs for failures
- Use `--retry` flag for transient failures

## Troubleshooting

### Issue: ClaudeFlow Not Found

```bash
# Solution: Reinstall ClaudeFlow
npm install -g @claude/flow@v3alpha
```

### Issue: Agent Spawn Fails

```bash
# Solution: Check available agents
npx claude-flow@v3alpha agent list --available

# Verify configuration
npx claude-flow@v3alpha config validate
```

### Issue: Memory Database Locked

```bash
# Solution: Clear lock and restart
npx claude-flow@v3alpha stop
rm -f .claude-flow/memory.db-lock
npx claude-flow@v3alpha start
```

### Issue: API Key Not Found

```bash
# Solution: Verify environment variables
source .env
echo $ANTHROPIC_API_KEY
npx claude-flow@v3alpha config check
```

## Advanced Features

### Custom Agent Creation

Create custom agents for workshop-specific tasks:

```bash
# Create a custom pizza-bot-specialist agent
npx claude-flow@v3alpha agent create pizza-bot-specialist << 'EOF'
{
  "name": "pizza-bot-specialist",
  "description": "Specialized agent for Contoso PizzaBot development",
  "capabilities": [
    "python-development",
    "mcp-integration",
    "foundry-configuration"
  ],
  "tools": [
    "pizza_calculator",
    "order_management"
  ]
}
EOF
```

### Workflow Templates

Save reusable workflow templates:

```bash
# Save workshop validation template
npx claude-flow@v3alpha workflow save workshop-validation --template
```

### Integration with GitHub Actions

Add ClaudeFlow to CI/CD pipeline (see `.github/workflows/` for examples).

## Resources

- [ClaudeFlow GitHub Repository](https://github.com/ruvnet/claude-flow)
- [ClaudeFlow Documentation](https://deepwiki.com/ruvnet/claude-flow/15-reference)
- [MCP Protocol Specification](https://modelcontextprotocol.io)
- [Microsoft Foundry Documentation](https://aka.ms/aifoundrysdk)

## Support

For issues with ClaudeFlow setup:
1. Check the troubleshooting section above
2. Review ClaudeFlow logs: `npx claude-flow@v3alpha logs`
3. Consult the [Microsoft Foundry Discord](https://aka.ms/MicrosoftFoundry-Ignite25)

---

**Last Updated**: January 2025  
**Version**: 1.0 (ClaudeFlow v3.0 Integration)
