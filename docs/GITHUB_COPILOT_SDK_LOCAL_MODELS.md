# Using GitHub Copilot SDK with Local AI Models

## Overview

This guide demonstrates how to leverage the newly released **GitHub Copilot SDK** (2024-2025) with **local AI models** for privacy-focused, cost-efficient AI-assisted development in the LAB571 Pizza Ordering Agent workshop.

## What is the GitHub Copilot SDK?

The **GitHub Copilot SDK** is a multi-platform SDK (currently in technical preview) that provides programmatic access to GitHub Copilot's agentic workflows. Available for:
- Node.js/TypeScript
- Python
- Go
- .NET

The SDK communicates with the Copilot CLI via JSON-RPC, enabling you to:
- Build custom Copilot Extensions
- Integrate Copilot capabilities into your own applications
- Create domain-specific AI assistants
- Orchestrate multi-agent workflows

## Local AI Model Support

### Microsoft Foundry Local + AI Toolkit

As of 2025, you can run AI models **completely locally** using:
- **Microsoft Foundry Local**: Infrastructure for deploying and managing LLMs locally
- **AI Toolkit for Visual Studio Code**: Extension for exploring, deploying, and managing AI models

### Benefits of Local Models

- 🔒 **Privacy**: Code and data never leave your machine
- 💰 **Cost Efficiency**: No cloud compute charges
- ⚡ **Performance**: Low latency for local execution
- 🎯 **Customization**: Fine-tune models for your specific needs
- 📴 **Offline Capability**: Work without internet connectivity

### Supported Local Models

**Microsoft Models:**
- **Phi & Phi-3**: Efficient models for reasoning and code generation
- **Qwen**: Multilingual model for code and general tasks

**Open Source Options:**
- **CodeLlama**: Specialized for code completion
- **DeepSeek-Coder**: High-performance coding assistant
- **Custom ONNX models**: Optimized for CPU, GPU, or NPU

## Integration with LAB571 Workshop

### Use Case 1: Local Development Environment

Use Foundry Local for developing and testing your Pizza Ordering Agent without cloud dependencies:

```python
# Example: Using local model endpoint with Azure AI Agents SDK
import os
from azure.ai.projects import AIProjectClient
from azure.identity import DefaultAzureCredential

# Configure local model endpoint
local_endpoint = "http://localhost:8000/v1/chat/completions"
os.environ["AZURE_AI_LOCAL_ENDPOINT"] = local_endpoint

# Create agent with local model
project_client = AIProjectClient(
    credential=DefaultAzureCredential(),
    endpoint=local_endpoint
)

# Rest of agent configuration remains the same
agent = project_client.agents.create_agent(
    model="phi-3-local",
    name="PizzaBot Local",
    instructions="You are a helpful pizza ordering assistant..."
)
```

### Use Case 2: GitHub Copilot Extensions with Local Models

Build a custom Copilot Extension that uses local models for the pizza domain:

```javascript
// Example: Copilot Extension using Foundry Local
const { CopilotSDK } = require('@github/copilot-sdk');

const sdk = new CopilotSDK({
  modelEndpoint: 'http://localhost:8000/v1/chat/completions',
  modelName: 'phi-3-local'
});

// Create pizza-specific skillset
const pizzaSkillset = {
  name: 'contoso-pizza',
  description: 'Pizza ordering and menu assistance',
  tools: [
    {
      name: 'calculate_pizza',
      description: 'Calculate pizza size for number of people',
      parameters: { /* ... */ }
    }
  ]
};

sdk.registerSkillset(pizzaSkillset);
```

### Use Case 3: Hybrid Cloud + Local Architecture

Combine cloud models (for complex reasoning) with local models (for quick completions):

```python
# Example: Hybrid architecture
from azure.ai.agents.models import MessageRole

class HybridPizzaBot:
    def __init__(self):
        # Cloud model for complex queries
        self.cloud_agent = create_cloud_agent()
        
        # Local model for quick completions
        self.local_agent = create_local_agent()
    
    def process_query(self, query: str):
        # Use local model for simple queries
        if self.is_simple_query(query):
            return self.local_agent.process(query)
        
        # Use cloud model for complex queries
        return self.cloud_agent.process(query)
    
    def is_simple_query(self, query: str) -> bool:
        # Simple heuristic: check query length and complexity
        return len(query.split()) < 10 and "?" not in query
```

## Setup Guide: Visual Studio Code + Foundry Local

### Prerequisites

1. **Visual Studio Code** (latest version)
2. **GitHub Copilot** subscription
3. **AI Toolkit extension** for VS Code
4. **Python 3.9+** or **Node.js 18+**

### Step 1: Install AI Toolkit Extension

```bash
# Install from VS Code Marketplace
# Search for: "AI Toolkit for Visual Studio Code"
# Publisher: Microsoft
```

Or via command line:
```bash
code --install-extension ms-windows-ai-studio.windows-ai-studio
```

### Step 2: Set Up Foundry Local

```bash
# Install Foundry Local (if not already installed)
pip install azure-ai-foundry-local

# Start Foundry Local server
foundry-local serve --host 0.0.0.0 --port 8000
```

### Step 3: Configure AI Toolkit in VS Code

1. Open VS Code Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`)
2. Type: "AI Toolkit: Select Model"
3. Choose "Foundry Local via AI Toolkit"
4. Select your preferred local model (e.g., Phi-3)

### Step 4: Test Local Model Integration

```python
# test_local_model.py
import requests
import json

def test_local_model():
    """Test Foundry Local endpoint"""
    url = "http://localhost:8000/v1/chat/completions"
    
    payload = {
        "model": "phi-3",
        "messages": [
            {"role": "system", "content": "You are a pizza expert."},
            {"role": "user", "content": "What's on a Margherita pizza?"}
        ],
        "temperature": 0.7
    }
    
    response = requests.post(url, json=payload)
    print(json.dumps(response.json(), indent=2))

if __name__ == "__main__":
    test_local_model()
```

### Step 5: Integrate with GitHub Copilot SDK

```bash
# Install Copilot SDK (Node.js example)
npm install @github/copilot-sdk

# Or Python SDK
pip install github-copilot-sdk
```

```python
# Example: Python Copilot SDK with local model
from github_copilot import CopilotClient

client = CopilotClient(
    model_endpoint="http://localhost:8000/v1/chat/completions",
    model_name="phi-3"
)

# Use the client for code completion
completion = client.complete(
    prompt="def calculate_pizza_size(people:",
    max_tokens=100
)
print(completion)
```

## Alternative: Ollama for Local Models

For developers preferring Ollama:

### Setup Ollama

```bash
# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Pull a code model
ollama pull codellama
ollama pull deepseek-coder

# Start Ollama server
ollama serve
```

### Configure VS Code Extensions

**Option 1: Continue.dev Extension**
- Install "Continue" extension from VS Code Marketplace
- Configure to use Ollama endpoint (`http://localhost:11434`)

**Option 2: Ollama Dev Companion**
- Install "Ollama Dev Companion" from VS Code Marketplace
- Select your preferred Ollama model
- Get Copilot-like completions with full privacy

## Best Practices for Local Model Development

### 1. Model Selection

| Model | Use Case | Memory Requirements |
|-------|----------|---------------------|
| Phi-3-mini | Quick completions, low memory | 2-4 GB RAM |
| Phi-3-medium | Balanced performance | 8-16 GB RAM |
| Qwen-Coder | Code-specific tasks | 8-16 GB RAM |
| CodeLlama | Large context code generation | 16+ GB RAM |

### 2. Performance Optimization

```python
# Enable GPU acceleration (if available)
os.environ["CUDA_VISIBLE_DEVICES"] = "0"

# Use smaller context windows for faster inference
max_context_length = 2048  # vs 8192 for cloud models

# Cache model weights for faster startup
model_cache_dir = ".cache/foundry-local"
```

### 3. Hybrid Strategy

- Use **local models** for:
  - Code completion
  - Simple queries
  - Rapid prototyping
  - Sensitive data processing

- Use **cloud models** for:
  - Complex reasoning
  - Large context windows
  - Production deployments
  - Multi-modal tasks

## Security Considerations

### Data Privacy

✅ **Local models ensure**:
- No code is transmitted to external servers
- Compliance with data residency requirements
- GDPR/CCPA compliance by default
- No risk of API key leakage

⚠️ **Important Notes**:
- Still follow secure coding practices
- Don't commit secrets even when using local models
- Use environment variables for configuration
- Regularly update local models for security patches

### Example: Secure Local Configuration

```python
# .env file (never commit this)
FOUNDRY_LOCAL_ENDPOINT=http://localhost:8000
LOCAL_MODEL_NAME=phi-3
LOCAL_MODEL_CACHE=/home/user/.cache/foundry-local

# In your code
from dotenv import load_dotenv
load_dotenv()

local_endpoint = os.getenv("FOUNDRY_LOCAL_ENDPOINT")
model_name = os.getenv("LOCAL_MODEL_NAME")
```

## Workshop Integration Checklist

Use this checklist to enhance LAB571 with local model support:

- [ ] Document local model setup in README
- [ ] Add optional lab section for Foundry Local setup
- [ ] Provide environment variable templates for local endpoints
- [ ] Include performance benchmarks (local vs cloud)
- [ ] Add troubleshooting guide for common local setup issues
- [ ] Create example configurations for hybrid deployments
- [ ] Update agent creation code to support local endpoints
- [ ] Add cost comparison (local vs cloud)
- [ ] Include privacy/compliance benefits documentation

## Resources

### Official Documentation

- [GitHub Copilot SDK](https://github.com/github/copilot-sdk) - Multi-platform SDK repository
- [Microsoft Foundry Local](https://devblogs.microsoft.com/foundry/ai-assisted-development-powered-by-local-models/) - Official blog announcement
- [AI Toolkit for VS Code](https://code.visualstudio.com/docs/intelligentapps/overview) - VS Code AI Toolkit docs
- [Copilot Extensions Documentation](https://docs.github.com/en/copilot/building-copilot-extensions) - Extension development guide

### Community Resources

- [Building an Ollama-Powered GitHub Copilot Extension](https://dev.to/nickytonline/building-an-ollama-powered-github-copilot-extension-2l4n)
- [Continue.dev for VS Code](https://docs.continue.dev/) - Open-source Copilot alternative
- [Ollama Quickstart Guide](https://github.com/chaz8081/ollama-quickstart)

### Microsoft Ignite 2025 Sessions

- LAB571: Build a Pizza Ordering Agent (this workshop)
- LAB545: Managing Sensitive Data in the Age of AI
- Sessions on Agentic Security and AI Governance

## Contributing

Have you found innovative ways to use local models with the Pizza Ordering Agent? Contributions welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/local-model-integration`)
3. Add your examples or documentation
4. Submit a pull request

## Support

**Questions about local models?**
- Microsoft Foundry Discord: [https://aka.ms/MicrosoftFoundry-Ignite25](https://aka.ms/MicrosoftFoundry-Ignite25)
- GitHub Discussions: [Repository Discussions](https://github.com/Jenp-AICraftWorks/ignite25-LAB571-build-a-pizza-ordering-agent-with-microsoft-foundry-and-mcp/discussions)

**Issues with GitHub Copilot SDK?**
- [GitHub Copilot SDK Issues](https://github.com/github/copilot-sdk/issues)

---

**Last Updated**: January 2026  
**Maintained By**: Microsoft Ignite Team  
**License**: MIT
