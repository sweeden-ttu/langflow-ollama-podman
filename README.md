# langflow-ollama-podman

LangFlow visual workflow builder with Ollama LLM integration deployed via Podman

## Description

This project provides a containerized deployment of LangFlow (a visual workflow builder for LangChain/LangGraph) with Ollama LLM integration using Podman.

## Features

- **Visual AI workflow builder** - Drag-and-drop interface for building AI workflows
- **Ollama integration** - Local LLM inference with Ollama
- **Podman deployment** - Containerized deployment using Podman
- **LangChain/LangGraph support** - Build complex AI pipelines with LangChain and LangGraph

## Fixed Ports

| Service    | Port  |
|------------|-------|
| granite   | 55077 |
| deepseek | 55088 |
| qwen-coder | 66044 |
| codellama | 66033 |

Full mapping (all environments): **docs/AGENTS.md**.
| LangFlow   | 7860  |

## Related Projects

- [ollama-podman](https://github.com/yourorg/ollama-podman) - Ollama deployment via Podman
- [langgraph-musl-flow](https://github.com/yourorg/langgraph-musl-flow) - LangGraph workflow examples
- [langchain-anchors](https://github.com/yourorg/langchain-anchors) - LangChain anchoring patterns

## Installation

```bash
pip install -e src/python/
```

## License

MIT
