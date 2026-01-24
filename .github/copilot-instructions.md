# LAB571: Build a Pizza Ordering Agent - Copilot Instructions

## Project Context

**Project Name**: LAB571: Build a Pizza Ordering Agent with Microsoft Foundry and MCP  
**Purpose**: Hands-on Microsoft Ignite 2025 workshop teaching domain-specific AI agents with Foundry Agent Service  
**Primary Technologies**: Microsoft Foundry, Python, MCP (Model Context Protocol), RAG, Tool Calling  
**Repository**: https://github.com/microsoft/ignite25-LAB571-build-a-pizza-ordering-agent-with-microsoft-foundry-and-mcp

### Enterprise Custom Agents Setup
- Workshop operates within an Enterprise org using GitHub Enterprise custom agents.
- Central org agents live in AICraftWorksOrg/.github-private → `.github/agents`.
- Repo `.github/agents` are auto-synced from `.github-private/agents` and should be treated as read-only.
- To update/add agents for the workshop, edit `.github-private/agents`; CI mirrors changes.

### Lab Overview

This workshop guides learners through building Contoso PizzaBot - a domain-specific AI agent that can:
- Answer questions about pizzas
- Recommend pizzas based on preferences
- Manage orders using external services via MCP
- Use RAG (Retrieval-Augmented Generation) with knowledge bases
- Implement tool calling for pizza calculators

### Repository Structure

```
ignite25-LAB571/
├── lab/                # Step-by-step lab instructions (1.md through 6.md)
│   └── foundry/        # Foundry-related screenshots and images
├── img/                # Banner images and screenshots
├── requirements.txt    # Python dependencies
└── README.md
```

**Key Lab Steps**:
- `lab/1.md` - Welcome and introduction
- `lab/2.md` - Create your first agent
- `lab/3.md` - System prompts and custom instructions
- `lab/4.md` - Knowledge integration with RAG
- `lab/5.md` - Tool calling (pizza calculator)
- `lab/6.md` - MCP integration for external services

## Coding Agent Orchestration: Environment-Based Multi-Agent Strategy

GitHub Copilot Coding Agent enables environment-specific orchestration. Use this matrix to route tasks appropriately:

### 4-Tier Environment Strategy

**Local Development (1-2 agents)**:
- `@code-reviewer` - Code quality, style enforcement
- `@documentation-expert` - Lab instruction clarity, README updates
- Task context: Lab instruction updates, Python code samples, documentation fixes
- Blocking agents: None (fast iteration for workshop content)
- Example: "Update lab step 3 with clearer MCP integration instructions / @documentation-expert"

**Dev Environment (4-5 agents)**:
- `@code-reviewer` + `@test-specialist` + `@documentation-expert`
- Additional: `@azure-specialist` (for Foundry configuration)
- Task context: Agent functionality verification, Python code validation
- Blocking agents: None (dev feedback loop)
- Example: "Add validation for pizza order tool calling / @code-reviewer @test-specialist"

**Staging Environment (7-8 agents)**:
- Core agents + `@security-specialist` + `@performance-optimizer` + `@refactoring-expert`
- Additional: `@cicd-workflow-reviewer` (for deployment pipeline changes)
- Task context: Pre-workshop validation, workshop material testing, security review
- Blocking agents: `@security-specialist` (mandatory for API key handling)
- Example: "Review MCP server security for API credentials / @security-specialist @code-reviewer"

**Production (9-10 BLOCKING agents)**:
- All agents required: `@code-reviewer`, `@security-specialist`, `@test-specialist`, `@documentation-expert`, `@refactoring-expert`, `@security-auditor`, `@performance-optimizer`, `@cicd-workflow-reviewer`, `@release-manager`, `@incident-responder`
- Task context: Workshop release, major content updates, Ignite deployment
- Blocking agents: ALL (zero-tolerance for workshop issues)
- Example: "Deploy workshop materials for Ignite 2025 / @release-manager @documentation-expert @security-auditor"

### Customer Portal Work - Staging-First Policy

**IMPORTANT**: All Customer Portal related work must follow a staging-first deployment strategy:

**Policy Requirements**:
- **Staging Only**: All Customer Portal PRs must target the `staging` branch until the Customer Portal work is fully complete and validated
- **No Direct Production**: Customer Portal work must NOT be merged to production/main branches until explicitly approved
- **Full Validation Required**: Customer Portal must undergo complete end-to-end testing in staging environment before production promotion
- **Readiness Criteria**: Portal work is considered "ready for production" only when:
  - All portal features are complete and tested
  - Security review has been completed by `@security-specialist` and `@security-auditor`
  - Performance testing shows acceptable metrics
  - Integration testing with all dependencies passes
  - User acceptance testing (UAT) is complete
  - Documentation is finalized
  - Rollback plan is documented and validated

**PR Workflow for Customer Portal**:
1. Create feature branch from `staging`
2. Submit PR targeting `staging` branch (NOT production/main)
3. Complete staging environment review (7-8 agents as defined above)
4. Merge to staging for validation
5. After full validation and approval, create separate PR from `staging` to production
6. Production PR requires all 9-10 blocking agents approval

**Example PR Titles**:
- ✅ CORRECT: "[Portal] Add user authentication - TARGET: staging"
- ✅ CORRECT: "[Portal] Customer dashboard - Staging deployment"
- ❌ INCORRECT: "[Portal] Add user authentication - TARGET: main"
- ❌ INCORRECT: "[Portal] Customer dashboard" (without staging specification)

**Non-Portal Work**: Standard workshop content and lab materials can follow normal PR workflows as defined in the 4-Tier strategy above.

---

## Agent Definitions (10 Core Agents)

### 1. **@code-reviewer**
- **Expertise**: Code quality, best practices, Python style enforcement, architecture alignment
- **When to use**: All pull requests, code refactoring, Python sample updates
- **Outputs**: Code review feedback, refactoring suggestions, Python style corrections

### 2. **@security-specialist**
- **Expertise**: Security architecture, API key management, secret handling, compliance
- **When to use**: MCP server configuration, API credential handling, external service integration
- **Outputs**: Security review, API key best practices, secure configuration patterns
- **CRITICAL**: Must approve any change touching API credentials, MCP server configuration, or external integrations

### 3. **@test-specialist**
- **Expertise**: Python testing, agent validation, workshop testing, manual test procedures
- **When to use**: Agent functionality testing, lab validation, Python code testing
- **Outputs**: Test strategy, validation procedures, workshop test plans

### 4. **@documentation-expert**
- **Expertise**: Technical writing, workshop instruction design, README maintenance, learner experience
- **When to use**: Lab instruction updates, documentation changes, workshop content updates
- **Outputs**: Clear lab instructions, updated README, learner guides, troubleshooting docs

### 5. **@refactoring-expert**
- **Expertise**: Code refactoring, design patterns, Python best practices, workshop code quality
- **When to use**: Technical debt, large feature implementation, architecture review
- **Outputs**: Refactoring plan, improved code samples, cleaner workshop code

### 6. **@security-auditor**
- **Expertise**: Security auditing, dependency audits, API security, compliance
- **When to use**: Before workshop releases, security reviews, dependency vulnerability assessment
- **Outputs**: Audit report, vulnerability findings, remediation plan

### 7. **@performance-optimizer**
- **Expertise**: Agent performance optimization, Python optimization, Foundry best practices
- **When to use**: Agent response time issues, optimization opportunities
- **Outputs**: Performance analysis, optimization recommendations, faster agent responses

### 8. **@cicd-workflow-reviewer**
- **Expertise**: GitHub Actions, workshop deployment, automation
- **When to use**: Workflow file changes, deployment pipeline issues
- **Outputs**: Workflow improvements, deployment automation

### 9. **@release-manager**
- **Expertise**: Workshop release management, version control, Ignite coordination
- **When to use**: Workshop releases, version updates, Ignite deployment
- **Outputs**: Release plan, version updates, workshop deployment checklist

### 10. **@incident-responder**
- **Expertise**: Incident response, workshop issues, emergency fixes, learner support escalation
- **When to use**: Workshop incidents, critical bugs during Ignite, emergency content fixes
- **Outputs**: Incident response plan, root cause analysis, rapid fixes

---

## Cloud Infrastructure Specialists

### **@azure-specialist** - Microsoft Foundry & Azure Expert
- **Use for**: Foundry Agent Service architecture, Azure AI services integration, RAG configuration, MCP server deployment
- **Solution Patterns**: Microsoft Foundry projects, Azure AI services, Agent Service, Knowledge bases, Tool calling, MCP integration
- **Example**: "Design agent architecture with Foundry Agent Service and Azure AI Search for RAG / @azure-specialist"
- **Output Includes**: Architecture diagram, Foundry configuration, RAG setup, MCP integration plan

### **@gcp-specialist** - Google Cloud Platform Infrastructure Expert
- **Use for**: Alternative cloud deployments (not primary for this workshop)
- **Solution Patterns**: GKE, Cloud Run, Vertex AI
- **Note**: This workshop focuses on Microsoft Foundry; GCP integration is not a primary use case

### **@aws-specialist** - Amazon Web Services Infrastructure Expert
- **Use for**: Alternative cloud deployments (not primary for this workshop)
- **Solution Patterns**: Lambda, ECS, SageMaker
- **Note**: This workshop focuses on Microsoft Foundry; AWS integration is not a primary use case

---

## Infrastructure PR Checklist (Required for All Infrastructure Changes)

When submitting a PR involving infrastructure, security, or deployment configuration, ensure:

### Networking & Security
- [ ] No hardcoded API keys or credentials in code or lab instructions
- [ ] MCP server configuration uses environment variables
- [ ] All external endpoints documented (Foundry, pizza APIs, MCP servers)
- [ ] Learner authentication patterns secure and documented

### Secrets & Configuration Management
- [ ] No hardcoded secrets, API keys, or credentials in code or lab files
- [ ] API keys referenced via environment variables in instructions
- [ ] Workshop instructions guide learners on secure credential management
- [ ] Example .env files use placeholder values only

### Workshop Deployment
- [ ] Lab instructions tested end-to-end
- [ ] All Python dependencies listed in requirements.txt
- [ ] Workshop tested in Codespaces environment
- [ ] Rollback procedure documented for workshop updates
- [ ] All external service dependencies documented

### Data & Compliance
- [ ] No PII in sample data or lab instructions
- [ ] Pizza ordering examples use fictitious data only
- [ ] Data retention policies clear for workshop participants
- [ ] Compliance with Microsoft workshop policies validated

### Monitoring & Observability
- [ ] Foundry telemetry configured for agent monitoring
- [ ] Lab validation procedures documented
- [ ] Common learner issues and troubleshooting included
- [ ] Performance baselines established for workshop agents

### Agent Routing & Review
- [ ] **@azure-specialist** assigned for Foundry-specific changes
- [ ] **@security-specialist** assigned for API key handling
- [ ] **@documentation-expert** assigned for lab instruction updates
- [ ] **@test-specialist** assigned for workshop validation

### Customer Portal Specific (If Applicable)
- [ ] **PR targets `staging` branch** (NOT main/production)
- [ ] PR title includes "[Portal]" prefix for clear identification
- [ ] All Customer Portal features complete before production consideration
- [ ] End-to-end testing completed in staging environment
- [ ] User acceptance testing (UAT) documented and passed
- [ ] Security review by both `@security-specialist` AND `@security-auditor` complete
- [ ] Performance testing shows acceptable response times and load handling
- [ ] Integration testing with all portal dependencies verified
- [ ] Rollback plan specific to portal changes documented
- [ ] Production promotion requires explicit approval from `@release-manager`
- [ ] Staging validation period completed (minimum recommended time TBD)
- [ ] All portal documentation finalized and reviewed

**Note**: Customer Portal work must remain in staging until ALL checklist items are complete and work is explicitly approved for production deployment.

---

## Development Workflow

### Environment Setup

**Prerequisites**:
- Python 3.9+
- Visual Studio Code
- Microsoft Foundry account (free tier available)
- GitHub account (for Codespaces)

**Setup Steps**:
```bash
# Clone repository
git clone https://github.com/microsoft/ignite25-LAB571-build-a-pizza-ordering-agent-with-microsoft-foundry-and-mcp.git
cd ignite25-LAB571-build-a-pizza-ordering-agent-with-microsoft-foundry-and-mcp

# Install Python dependencies
pip install -r requirements.txt
```

### Running the Workshop

**GitHub Codespaces** (recommended for learners):
1. Open repository in GitHub Codespaces
2. Dependencies auto-install via devcontainer.json
3. Follow lab instructions in `lab/` folder (start with `lab/1.md`)

### Testing Lab Instructions

**Manual Testing**:
1. Follow each lab step sequentially (starting with `lab/1.md`)
2. Verify all code samples execute successfully
3. Test all MCP endpoints as described in the lab instructions
4. Validate agent responses match expectations

## Workshop-Specific Guidelines

### Lab Instruction Style

- **Clear Step Numbers**: Use sequential numbering (Step 1, Step 2, etc.)
- **Code Samples**: All Python code must be tested and runnable
- **Screenshots**: Update screenshots if UI changes
- **Troubleshooting**: Include common issues and solutions
- **Time Estimates**: Each lab step should include estimated completion time

### Python Code Conventions

- **PEP 8 Compliance**: Follow Python style guidelines
- **Type Hints**: Use type hints for function signatures
- **Docstrings**: All functions and classes must have docstrings
- **Error Handling**: Graceful error handling with clear messages
- **Logging**: Use Python logging module for debugging

### MCP Integration Best Practices

- **Environment Variables**: Store all credentials in .env files
- **Error Handling**: Graceful MCP connection failures
- **Documentation**: Clear MCP server setup instructions
- **Testing**: Test MCP endpoints independently before agent integration

## Security Guidelines

- **API Key Management**: Never commit API keys to repository
- **Example Data**: Use only fictitious pizza orders and customer data
- **External Services**: Document all external API dependencies
- **Workshop Isolation**: Ensure workshop participants can't access each other's data

## Common Workshop Issues

### Issue 1: Foundry API Connection Failures
**Solution**: Check API key configuration, verify network connectivity, confirm Foundry service status

### Issue 2: MCP Server Not Responding
**Solution**: Verify MCP server is running, check port configuration, validate environment variables

### Issue 3: RAG Knowledge Base Empty
**Solution**: Verify knowledge base upload, check file format, confirm Foundry indexing completed

### Issue 4: Tool Calling Not Working
**Solution**: Validate tool schema definition, check Foundry tool registration, test tool independently

## Resources

- [Microsoft Foundry Documentation](https://aka.ms/aifoundrysdk)
- [MCP Protocol Specification](https://modelcontextprotocol.io)
- [Ignite 2025 Session Materials](https://aka.ms/Ignite25-Next-Steps)

## Contact

**Content Owner**: Henk Boelman ([GitHub](https://github.com/hnky))  
**Session**: LAB571 - Microsoft Ignite 2025  
**Community**: [Microsoft Foundry Discord](https://aka.ms/MicrosoftFoundry-Ignite25)

---

**Maintained By**: Microsoft Ignite Team  
**Last Updated**: December 12, 2025  
**Template Version**: 1.0 (AICraftWorks Org Standard)
