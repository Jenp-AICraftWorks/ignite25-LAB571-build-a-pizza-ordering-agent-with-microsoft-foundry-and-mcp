# How to Use ClaudeFlow v3.0 for Work Delegation

This guide provides practical examples of how to delegate work using ClaudeFlow v3.0 in your Codespace for the LAB571 workshop.

## Quick Start

After setting up your Codespace (see [CLAUDEFLOW_SETUP.md](CLAUDEFLOW_SETUP.md)), you can immediately start delegating work to ClaudeFlow agents.

## Basic Delegation Patterns

### 1. Single Task Delegation

Delegate a specific task to one specialized agent:

```bash
# Review lab instructions
npx claude-flow@v3alpha delegate \
  --agent documentation-expert \
  --task "Review lab/3.md and identify any unclear instructions or missing steps"

# Code review
npx claude-flow@v3alpha delegate \
  --agent code-reviewer \
  --task "Review all Python code in the repository for PEP 8 compliance"

# Security audit
npx claude-flow@v3alpha delegate \
  --agent security-specialist \
  --task "Audit the MCP server configuration for security vulnerabilities"
```

### 2. Multi-Step Workflow

Create a workflow with sequential steps:

```bash
# Create a workflow file
cat > workshop-review-workflow.json << 'EOF'
{
  "name": "Complete Workshop Review",
  "description": "End-to-end review of workshop materials",
  "steps": [
    {
      "id": "step1",
      "agent": "documentation-expert",
      "task": "Review all lab instructions (lab/1.md through lab/6.md)",
      "output": "documentation-review.json"
    },
    {
      "id": "step2",
      "agent": "code-reviewer",
      "task": "Validate all code samples mentioned in the documentation review",
      "input": "documentation-review.json",
      "output": "code-review.json"
    },
    {
      "id": "step3",
      "agent": "test-specialist",
      "task": "Create test cases for all code samples",
      "input": "code-review.json",
      "output": "test-plan.json"
    },
    {
      "id": "step4",
      "agent": "security-specialist",
      "task": "Review for security issues",
      "input": "test-plan.json",
      "output": "security-report.json"
    }
  ]
}
EOF

# Execute the workflow
npx claude-flow@v3alpha workflow run workshop-review-workflow.json
```

### 3. Parallel Execution (Swarm Mode)

Execute multiple independent tasks simultaneously:

```bash
# Create a swarm for parallel tasks
npx claude-flow@v3alpha swarm create \
  --name parallel-review \
  --mode parallel \
  --agents "code-reviewer,documentation-expert,security-specialist,test-specialist" \
  --task "Review your respective areas of the LAB571 workshop" \
  --output parallel-review-results.json

# Monitor swarm progress
npx claude-flow@v3alpha swarm status parallel-review

# Get results when complete
npx claude-flow@v3alpha swarm results parallel-review
```

## Common Use Cases

### Use Case 1: Update Lab Instructions

**Scenario**: You need to update lab step 4 with new Foundry features.

**Delegation Strategy**: Sequential workflow with documentation and validation

```bash
# Step 1: Create the update plan
npx claude-flow@v3alpha delegate \
  --agent azure-specialist \
  --task "Research latest Microsoft Foundry features relevant to RAG and create an outline for updating lab/4.md" \
  --output foundry-features-outline.md

# Step 2: Update documentation
npx claude-flow@v3alpha delegate \
  --agent documentation-expert \
  --task "Update lab/4.md based on foundry-features-outline.md while maintaining the existing workshop style and flow" \
  --files "lab/4.md,foundry-features-outline.md"

# Step 3: Validate changes
npx claude-flow@v3alpha delegate \
  --agent test-specialist \
  --task "Review the updated lab/4.md and create validation steps to ensure all instructions work correctly"
```

### Use Case 2: Security Review Before Deployment

**Scenario**: Workshop deployment to production requires security validation.

**Delegation Strategy**: Parallel security checks + consolidated review

```bash
# Run parallel security checks
npx claude-flow@v3alpha swarm create \
  --name security-validation \
  --mode parallel \
  --agents "security-specialist,security-auditor" \
  --task "Perform comprehensive security review: security-specialist focuses on code and configuration, security-auditor focuses on dependencies and compliance" \
  --output security-validation-results.json \
  --timeout 600

# Wait for results
npx claude-flow@v3alpha swarm wait security-validation

# Review consolidated results
cat security-validation-results.json | jq '.results'
```

### Use Case 3: New Feature Development

**Scenario**: Add a new pizza recommendation feature with ML capabilities.

**Delegation Strategy**: Hive-mind coordination with lead agent

```bash
# Start coordinated development
npx claude-flow@v3alpha swarm create \
  --name ml-pizza-recommender \
  --mode hive-mind \
  --lead-agent azure-specialist \
  --worker-agents "code-reviewer,test-specialist,documentation-expert" \
  --task "Lead Agent: Design ML-based pizza recommendation system using Azure AI.
Worker Agents: 
- code-reviewer: Implement Python code
- test-specialist: Create test suite
- documentation-expert: Update lab instructions" \
  --output ml-feature-complete.json

# Monitor progress with detailed logs
npx claude-flow@v3alpha logs --agent azure-specialist --follow
```

### Use Case 4: Bug Fix During Live Workshop

**Scenario**: Critical bug discovered during the workshop that needs immediate attention.

**Delegation Strategy**: Emergency parallel response

```bash
# Emergency bug fix
npx claude-flow@v3alpha swarm create \
  --name emergency-bugfix \
  --mode parallel \
  --priority critical \
  --agents "debugging-assistant,code-reviewer,test-specialist" \
  --task "Debugging-assistant: Identify root cause of MCP connection failure.
Code-reviewer: Implement fix once root cause is found.
Test-specialist: Validate fix with regression tests." \
  --timeout 300 \
  --notify-on-complete

# Fast-track deployment after fix
npx claude-flow@v3alpha deploy \
  --environment production \
  --fast-track \
  --require-validation security-specialist
```

### Use Case 5: Workshop Content Validation

**Scenario**: Complete pre-Ignite validation of all workshop materials.

**Delegation Strategy**: Comprehensive swarm with all core agents

```bash
# Full workshop validation
npx claude-flow@v3alpha swarm create \
  --name ignite-readiness \
  --mode parallel \
  --agents "code-reviewer,security-specialist,security-auditor,test-specialist,documentation-expert,azure-specialist,performance-optimizer,cicd-workflow-reviewer" \
  --task "Complete validation of LAB571 workshop:
- code-reviewer: Python code quality
- security-specialist: API key and credential security
- security-auditor: Dependency vulnerabilities
- test-specialist: All code samples runnable
- documentation-expert: Lab instructions clarity
- azure-specialist: Foundry configuration correctness
- performance-optimizer: Agent response times
- cicd-workflow-reviewer: Deployment pipeline" \
  --output ignite-readiness-report.json \
  --timeout 1800

# Generate executive summary
npx claude-flow@v3alpha report generate ignite-readiness-report.json \
  --format markdown \
  --output IGNITE_READINESS_REPORT.md
```

## Advanced Techniques

### Technique 1: Conditional Workflows

Create workflows that adapt based on previous step results:

```bash
cat > conditional-workflow.json << 'EOF'
{
  "name": "Smart Review Workflow",
  "steps": [
    {
      "id": "initial-review",
      "agent": "code-reviewer",
      "task": "Quick code review to identify potential issues",
      "output": "initial-review.json"
    },
    {
      "id": "security-check",
      "agent": "security-specialist",
      "task": "Deep security audit",
      "condition": "initial-review.json contains 'security concern'",
      "input": "initial-review.json"
    },
    {
      "id": "standard-validation",
      "agent": "test-specialist",
      "task": "Standard validation tests",
      "condition": "NOT (initial-review.json contains 'security concern')",
      "input": "initial-review.json"
    }
  ]
}
EOF

npx claude-flow@v3alpha workflow run conditional-workflow.json
```

### Technique 2: Agent Composition

Combine multiple agents for complex analysis:

```bash
# Create composite task
npx claude-flow@v3alpha composite create \
  --name workshop-quality-score \
  --agents "code-reviewer,documentation-expert,test-specialist,security-specialist" \
  --aggregation weighted-average \
  --weights "0.3,0.3,0.2,0.2" \
  --task "Each agent scores workshop quality (0-100) in your domain" \
  --output quality-score.json

# View aggregated score
cat quality-score.json | jq '.aggregated_score'
```

### Technique 3: Iterative Refinement

Use ClaudeFlow for iterative improvement:

```bash
# Iterative improvement loop
for i in {1..3}; do
  echo "=== Iteration $i ==="
  
  # Review current state
  npx claude-flow@v3alpha delegate \
    --agent documentation-expert \
    --task "Review lab instructions and suggest improvements" \
    --output iteration-$i-suggestions.json
  
  # Apply improvements
  npx claude-flow@v3alpha delegate \
    --agent documentation-expert \
    --task "Apply suggested improvements from iteration-$i-suggestions.json" \
    --input iteration-$i-suggestions.json
  
  # Validate improvements
  npx claude-flow@v3alpha delegate \
    --agent test-specialist \
    --task "Validate that improvements work correctly" \
    --output iteration-$i-validation.json
  
  # Check if we're done
  quality_score=$(cat iteration-$i-validation.json | jq '.quality_score')
  if [ "$quality_score" -ge 90 ]; then
    echo "Quality threshold reached!"
    break
  fi
done
```

### Technique 4: Cross-Repository Delegation

Coordinate work across multiple repositories:

```bash
# Multi-repo coordination
npx claude-flow@v3alpha multi-repo \
  --repos "repo1:main,repo2:main,repo3:develop" \
  --agent code-reviewer \
  --task "Review API compatibility across all three repositories" \
  --output cross-repo-review.json
```

## Monitoring and Debugging

### Monitor Active Tasks

```bash
# List all active agents
npx claude-flow@v3alpha agent list --active

# Show detailed status
npx claude-flow@v3alpha status --verbose

# Follow logs in real-time
npx claude-flow@v3alpha logs --follow --level info
```

### Debug Failed Tasks

```bash
# View failed task details
npx claude-flow@v3alpha task show <task-id> --include-errors

# Retry with more verbose logging
npx claude-flow@v3alpha task retry <task-id> --log-level debug

# Analyze failure patterns
npx claude-flow@v3alpha analytics failures --last 24h
```

### Performance Metrics

```bash
# View performance dashboard
npx claude-flow@v3alpha metrics dashboard

# Generate performance report
npx claude-flow@v3alpha metrics report \
  --start-date 2025-01-01 \
  --end-date 2025-01-18 \
  --format pdf \
  --output performance-report.pdf
```

## Best Practices

### 1. Task Clarity
Always provide clear, specific tasks:

✅ **Good**: "Review lab/3.md for unclear MCP integration instructions and suggest specific improvements"

❌ **Bad**: "Check the labs"

### 2. Context Provision
Include relevant files and background:

```bash
npx claude-flow@v3alpha delegate \
  --agent code-reviewer \
  --task "Review this code for PEP 8 compliance" \
  --files "src/**/*.py" \
  --context "Python 3.12, Black formatter, type hints required"
```

### 3. Resource Management
Monitor and control resource usage:

```bash
# Limit concurrent agents
npx claude-flow@v3alpha config set swarm.maxConcurrentAgents 3

# Set global timeout
npx claude-flow@v3alpha config set agents.defaults.timeout 600

# Enable cost tracking
npx claude-flow@v3alpha config set monitoring.metrics.costTracking true
```

### 4. Error Handling
Always plan for failures:

```bash
npx claude-flow@v3alpha swarm create \
  --name robust-workflow \
  --agents "code-reviewer,test-specialist" \
  --failure-strategy continue-on-error \
  --retry-failed 2 \
  --notify-on-failure
```

### 5. Documentation
Document your workflows:

```bash
# Add workflow description
npx claude-flow@v3alpha workflow create my-workflow \
  --description "This workflow validates workshop materials before deployment" \
  --tags "validation,pre-deployment,workshop"

# Export workflow for sharing
npx claude-flow@v3alpha workflow export my-workflow \
  --output workflows/my-workflow.json
```

## Integration with GitHub Copilot

Combine ClaudeFlow with GitHub Copilot for maximum efficiency:

1. **Use Copilot for**: Quick questions, single-file edits, immediate feedback
2. **Use ClaudeFlow for**: Multi-file changes, complex workflows, parallel tasks

Example integration:

```bash
# In GitHub Copilot Chat:
# "What changes are needed for the new Foundry feature?"

# Copilot provides recommendation
# Then delegate implementation to ClaudeFlow:

npx claude-flow@v3alpha workflow create implement-copilot-suggestions << 'EOF'
{
  "steps": [
    {
      "agent": "code-reviewer",
      "task": "Implement the changes suggested by Copilot",
      "context": "Copilot recommended: [paste recommendation]"
    },
    {
      "agent": "test-specialist",
      "task": "Validate the implementation"
    }
  ]
}
EOF
```

## Troubleshooting

### Common Issues and Solutions

**Issue**: Agent not responding
```bash
# Solution: Check agent status and restart if needed
npx claude-flow@v3alpha agent status <agent-name>
npx claude-flow@v3alpha agent restart <agent-name>
```

**Issue**: Workflow stuck
```bash
# Solution: View workflow state and cancel if needed
npx claude-flow@v3alpha workflow status <workflow-id>
npx claude-flow@v3alpha workflow cancel <workflow-id>
npx claude-flow@v3alpha workflow retry <workflow-id> --from-step <step-id>
```

**Issue**: Out of memory
```bash
# Solution: Clear memory cache
npx claude-flow@v3alpha memory clear --keep-recent 7d
npx claude-flow@v3alpha memory optimize
```

## Next Steps

1. **Read**: [ClaudeFlow Setup Guide](CLAUDEFLOW_SETUP.md) for installation
2. **Explore**: [Agent Orchestration Documentation](docs/AGENT_ORCHESTRATION.md) for architecture details
3. **Practice**: Try the examples in this guide with the LAB571 repository
4. **Customize**: Create your own workflows for specific workshop needs

## Support

- **Documentation**: See [CLAUDEFLOW_SETUP.md](CLAUDEFLOW_SETUP.md)
- **Issues**: Check ClaudeFlow logs: `npx claude-flow@v3alpha logs`
- **Community**: [Microsoft Foundry Discord](https://aka.ms/MicrosoftFoundry-Ignite25)

---

**Last Updated**: January 2025  
**Version**: 1.0
