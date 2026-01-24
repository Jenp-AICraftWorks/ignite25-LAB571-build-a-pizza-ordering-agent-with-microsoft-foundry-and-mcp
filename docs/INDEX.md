# Documentation Index

Welcome to the LAB571 documentation! This index helps you find the right resources for your needs.

## Getting Started

### For Workshop Participants

1. **[README.md](../README.md)** - Start here! Workshop overview and session description
2. **Lab Instructions**:
   - [lab/1.md](../lab/1.md) - Welcome and introduction
   - [lab/2.md](../lab/2.md) - Create your first agent
   - [lab/3.md](../lab/3.md) - System prompts and custom instructions
   - [lab/4.md](../lab/4.md) - Knowledge integration with RAG
   - [lab/5.md](../lab/5.md) - Tool calling (pizza calculator)
   - [lab/6.md](../lab/6.md) - MCP integration for external services
   - [lab/7.md](../lab/7.md) - ⭐ NEW: Optional - GitHub Copilot SDK with local models

### For Contributors and Developers

3. **[CLAUDEFLOW_SETUP.md](../CLAUDEFLOW_SETUP.md)** - Complete guide to setting up ClaudeFlow v3.0 in Codespaces
4. **[DELEGATION_GUIDE.md](../DELEGATION_GUIDE.md)** - How to delegate work to ClaudeFlow agents with examples
5. **[AGENT_ORCHESTRATION.md](AGENT_ORCHESTRATION.md)** - Architecture and best practices for multi-agent coordination
6. **[GITHUB_COPILOT_SDK_LOCAL_MODELS.md](GITHUB_COPILOT_SDK_LOCAL_MODELS.md)** - ⭐ NEW: Using GitHub Copilot SDK with local AI models

## Quick Access

### Setup and Configuration

- **Codespace Setup**: [CLAUDEFLOW_SETUP.md § Setting Up Your Codespace](../CLAUDEFLOW_SETUP.md#setting-up-your-codespace)
- **Environment Variables**: [CLAUDEFLOW_SETUP.md § Configure Environment Variables](../CLAUDEFLOW_SETUP.md#step-4-configure-environment-variables)
- **DevContainer Config**: [.devcontainer/devcontainer.json](../.devcontainer/devcontainer.json)
- **ClaudeFlow Example Config**: [claude-flow.example.json](../claude-flow.example.json)

### Agent Orchestration

- **GitHub Copilot Agents**: [AGENT_ORCHESTRATION.md § GitHub Copilot Custom Agents](AGENT_ORCHESTRATION.md#github-copilot-custom-agents)
- **ClaudeFlow Agents**: [AGENT_ORCHESTRATION.md § ClaudeFlow v3.0 Orchestration](AGENT_ORCHESTRATION.md#claudeflow-v30-orchestration)
- **Execution Modes**: [AGENT_ORCHESTRATION.md § Execution Modes](AGENT_ORCHESTRATION.md#execution-modes)
- **Integration Patterns**: [AGENT_ORCHESTRATION.md § Integration Patterns](AGENT_ORCHESTRATION.md#integration-patterns)

### Advanced Topics

- **⭐ GitHub Copilot SDK**: [GITHUB_COPILOT_SDK_LOCAL_MODELS.md § What is the GitHub Copilot SDK](GITHUB_COPILOT_SDK_LOCAL_MODELS.md#what-is-the-github-copilot-sdk)
- **⭐ Local AI Models**: [GITHUB_COPILOT_SDK_LOCAL_MODELS.md § Local AI Model Support](GITHUB_COPILOT_SDK_LOCAL_MODELS.md#local-ai-model-support)
- **⭐ Foundry Local Setup**: [GITHUB_COPILOT_SDK_LOCAL_MODELS.md § Setup Guide](GITHUB_COPILOT_SDK_LOCAL_MODELS.md#setup-guide-visual-studio-code--foundry-local)
- **⭐ Ollama Alternative**: [GITHUB_COPILOT_SDK_LOCAL_MODELS.md § Alternative: Ollama](GITHUB_COPILOT_SDK_LOCAL_MODELS.md#alternative-ollama-for-local-models)

### Usage Examples

- **Single Task Delegation**: [DELEGATION_GUIDE.md § Single Task Delegation](../DELEGATION_GUIDE.md#1-single-task-delegation)
- **Multi-Step Workflows**: [DELEGATION_GUIDE.md § Multi-Step Workflow](../DELEGATION_GUIDE.md#2-multi-step-workflow)
- **Parallel Execution**: [DELEGATION_GUIDE.md § Parallel Execution](../DELEGATION_GUIDE.md#3-parallel-execution-swarm-mode)
- **Common Use Cases**: [DELEGATION_GUIDE.md § Common Use Cases](../DELEGATION_GUIDE.md#common-use-cases)

### Troubleshooting

- **ClaudeFlow Issues**: [CLAUDEFLOW_SETUP.md § Troubleshooting](../CLAUDEFLOW_SETUP.md#troubleshooting)
- **Agent Issues**: [AGENT_ORCHESTRATION.md § Troubleshooting](AGENT_ORCHESTRATION.md#troubleshooting)
- **Delegation Problems**: [DELEGATION_GUIDE.md § Troubleshooting](../DELEGATION_GUIDE.md#troubleshooting)

## Documentation by Role

### Workshop Instructor

**Must Read**:
- [README.md](../README.md) - Session overview
- Lab instructions (lab/1.md through lab/6.md)
- [CLAUDEFLOW_SETUP.md](../CLAUDEFLOW_SETUP.md) - For Codespace demos

**Reference**:
- [DELEGATION_GUIDE.md](../DELEGATION_GUIDE.md) - Show participants how to delegate
- [AGENT_ORCHESTRATION.md](AGENT_ORCHESTRATION.md) - Explain architecture

### Workshop Participant

**Must Read**:
1. [README.md](../README.md) - Start here
2. [lab/1.md](../lab/1.md) - Begin your journey
3. Progress through lab/2.md → lab/6.md

**Optional**:
- [CLAUDEFLOW_SETUP.md](../CLAUDEFLOW_SETUP.md) - If you want to experiment with ClaudeFlow
- [DELEGATION_GUIDE.md](../DELEGATION_GUIDE.md) - Advanced delegation techniques

### Content Contributor

**Must Read**:
- [.github/copilot-instructions.md](../.github/copilot-instructions.md) - Copilot agent guidelines
- [AGENT_ORCHESTRATION.md](AGENT_ORCHESTRATION.md) - Agent coordination strategy
- [.github/instructions/MSLearn.instructions.md](../.github/instructions/MSLearn.instructions.md) - Repository guidelines

**Reference**:
- [DELEGATION_GUIDE.md](../DELEGATION_GUIDE.md) - How to delegate work to agents
- [CLAUDEFLOW_SETUP.md](../CLAUDEFLOW_SETUP.md) - ClaudeFlow capabilities

### DevOps / Platform Engineer

**Must Read**:
- [.devcontainer/devcontainer.json](../.devcontainer/devcontainer.json) - Codespace configuration
- [claude-flow.example.json](../claude-flow.example.json) - ClaudeFlow config
- [AGENT_ORCHESTRATION.md § Security Considerations](AGENT_ORCHESTRATION.md#security-considerations)

**Reference**:
- [CLAUDEFLOW_SETUP.md § Integration with Microsoft Foundry](../CLAUDEFLOW_SETUP.md#integration-with-microsoft-foundry)
- [init-claudeflow.sh](../init-claudeflow.sh) - Initialization script

## Documentation Structure

```
ignite25-LAB571/
├── README.md                          # Workshop overview
├── CLAUDEFLOW_SETUP.md               # ClaudeFlow setup guide
├── DELEGATION_GUIDE.md               # Work delegation guide
├── AGENTS.md                         # Agent registry
├── init-claudeflow.sh                # Setup script
├── claude-flow.example.json          # Example configuration
│
├── docs/
│   ├── INDEX.md                      # This file
│   ├── AGENT_ORCHESTRATION.md        # Architecture guide
│   └── GITHUB_COPILOT_SDK_LOCAL_MODELS.md  # ⭐ NEW: Copilot SDK + local models
│
├── .github/
│   ├── copilot-instructions.md       # Copilot agent instructions
│   ├── agents/                       # Custom agent definitions (80+)
│   └── instructions/                 # Repository-specific instructions
│
├── .devcontainer/
│   └── devcontainer.json             # Codespace configuration
│
└── lab/
    ├── 1.md                          # Welcome and introduction
    ├── 2.md                          # Create your first agent
    ├── 3.md                          # System prompts
    ├── 4.md                          # RAG integration
    ├── 5.md                          # Tool calling
    ├── 6.md                          # MCP integration
    └── 7.md                          # ⭐ NEW: Optional - Local AI models
```

## External Resources

### Microsoft Resources

- **Microsoft Foundry SDK**: https://aka.ms/aifoundrysdk
- **Microsoft Learn**: https://aka.ms/LearnAtIgnite
- **Ignite 2025 Sessions**: https://aka.ms/Ignite25-Next-Steps
- **Foundry Community Discord**: https://aka.ms/MicrosoftFoundry-Ignite25

### ClaudeFlow Resources

- **GitHub Repository**: https://github.com/ruvnet/claude-flow
- **Documentation**: https://deepwiki.com/ruvnet/claude-flow/15-reference
- **MCP Protocol**: https://modelcontextprotocol.io

### GitHub Resources

- **Copilot Documentation**: https://docs.github.com/copilot
- **Codespaces Documentation**: https://docs.github.com/codespaces
- **GitHub Actions**: https://docs.github.com/actions

## Contributing

To contribute to this documentation:

1. Follow the style guide in `.github/copilot-instructions.md`
2. Update this INDEX.md when adding new documentation
3. Ensure all links are relative and working
4. Run documentation through @documentation-expert agent for review

## Support

### For Workshop Questions

- **During Workshop**: Ask your instructor
- **After Workshop**: [Microsoft Foundry Discord](https://aka.ms/MicrosoftFoundry-Ignite25)

### For Technical Issues

- **Codespace Issues**: Check [CLAUDEFLOW_SETUP.md § Troubleshooting](../CLAUDEFLOW_SETUP.md#troubleshooting)
- **Agent Issues**: Check [AGENT_ORCHESTRATION.md § Troubleshooting](AGENT_ORCHESTRATION.md#troubleshooting)
- **ClaudeFlow Issues**: Check [ClaudeFlow GitHub Issues](https://github.com/ruvnet/claude-flow/issues)

### For Content Issues

- **Open an Issue**: [GitHub Issues](https://github.com/microsoft/ignite25-LAB571-build-a-pizza-ordering-agent-with-microsoft-foundry-and-mcp/issues)
- **Contact**: See [README.md § Content Owners](../README.md#content-owners)

---

**Last Updated**: January 2025  
**Maintained By**: LAB571 Workshop Team  
**Version**: 1.0
