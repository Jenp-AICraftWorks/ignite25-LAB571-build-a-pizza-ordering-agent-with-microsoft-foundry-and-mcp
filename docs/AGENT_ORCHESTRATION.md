# Agent Orchestration for LAB571

## Overview

This document describes the agent orchestration strategy for the LAB571 Pizza Ordering Agent workshop, including both GitHub Copilot custom agents and ClaudeFlow v3.0 swarm intelligence.

## Architecture

### Two-Tier Agent System

The LAB571 workshop uses a two-tier agent orchestration system:

1. **GitHub Copilot Custom Agents** (Tier 1)
   - Repository-specific agents defined in `.github/agents/`
   - Integrated directly with GitHub Copilot Workspace
   - Optimized for code review, documentation, testing, and security
   - 80+ specialized agents available

2. **ClaudeFlow v3.0 Orchestration** (Tier 2)
   - Advanced multi-agent workflows and swarm intelligence
   - Parallel execution for complex tasks
   - MCP integration for external services
   - Persistent memory and learning capabilities

### When to Use Each Tier

**Use GitHub Copilot Custom Agents When**:
- Working directly in VS Code or Codespaces
- Need quick, focused agent responses (code review, documentation)
- Working on specific files or pull requests
- Need integration with GitHub workflows

**Use ClaudeFlow v3.0 When**:
- Need multi-agent coordination (3+ agents)
- Require parallel task execution (swarm mode)
- Building complex workflows with dependencies
- Need persistent context across multiple sessions
- Require advanced monitoring and debugging

## GitHub Copilot Custom Agents

### Core Agents (10)

Defined in `.github/copilot-instructions.md` and individual agent files:

1. **@code-reviewer** - Code quality, Python PEP 8, best practices
2. **@security-specialist** - API security, credential management
3. **@test-specialist** - Workshop validation, testing procedures
4. **@documentation-expert** - Lab instructions, README maintenance
5. **@refactoring-expert** - Code refactoring, design patterns
6. **@security-auditor** - Security audits, vulnerability scanning
7. **@performance-optimizer** - Performance tuning, optimization
8. **@cicd-workflow-reviewer** - GitHub Actions, deployment
9. **@release-manager** - Release coordination, versioning
10. **@incident-responder** - Emergency fixes, incident response

### Cloud Specialists (3)

1. **@azure-specialist** - Microsoft Foundry, Azure AI services
2. **@gcp-specialist** - Google Cloud Platform (backup)
3. **@aws-specialist** - AWS services (backup)

## ClaudeFlow v3.0 Orchestration

### Architecture Components

The ClaudeFlow platform provides comprehensive orchestration capabilities including workflow builder, swarm engine, MCP tools, persistent memory, real-time monitoring, and SONA learning.

### Execution Modes

#### 1. Single Agent Mode
Best for focused, specialized tasks

#### 2. Sequential Workflow Mode
For tasks with dependencies

#### 3. Swarm Mode (Parallel)
For independent tasks that can run simultaneously

#### 4. Hive-Mind Mode (Coordinated)
For complex tasks requiring agent coordination

## Integration Patterns

### Pattern 1: Copilot → ClaudeFlow Delegation
Use Copilot for initial triage, delegate complex tasks to ClaudeFlow

### Pattern 2: ClaudeFlow → Copilot Validation
Use ClaudeFlow for development, Copilot for validation

### Pattern 3: Hybrid Parallel Execution
Run both systems simultaneously for maximum throughput

## Resources

- [ClaudeFlow Setup Guide](../CLAUDEFLOW_SETUP.md)
- [GitHub Copilot Instructions](../.github/copilot-instructions.md)
- [Custom Agents Directory](../.github/agents/)
- [Microsoft Foundry Documentation](https://aka.ms/aifoundrysdk)

---

**Version**: 1.0  
**Last Updated**: January 2025  
**Maintained By**: LAB571 Workshop Team
