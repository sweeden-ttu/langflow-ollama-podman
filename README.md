# langflow-ollama-podman

LangFlow visual workflow builder with Ollama LLM integration deployed via Podman

## Description

This project provides a containerized deployment of LangFlow (a visual workflow builder for LangChain/LangGraph) with Ollama LLM integration using Podman.

## Features

- **Visual AI workflow builder** - Drag-and-drop interface for building AI workflows
- **Ollama integration** - Local LLM inference with Ollama
- **Podman deployment** - Containerized deployment using Podman
- **LangChain/LangGraph support** - Build complex AI pipelines with LangChain and LangGraph

## Ollama port mapping (canonical)

Same mapping across all Ollama projects. Workflows that use **@granite**, **@deepseek**, **@qwen-coder**, or **@codellama** call Ollama on the port for that model and environment.

| Environment        | granite | deepseek | qwen-coder | codellama |
|--------------------|---------|----------|------------|-----------|
| Debug (VPN)        | 55077   | 55088    | 66044      | 66033     |
| Testing +1 (macOS) | 55177   | 55188    | 66144      | 66133     |
| Testing +2 (Rocky) | 55277   | 55288    | 66244      | 66233     |
| Release +3        | 55377   | 55388    | 66344      | 66333     |

See **docs/AGENTS.md** for details. LangFlow runs on port 7860.

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
