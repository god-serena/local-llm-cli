# Personal Local LLM CLI Suite

> This repository contains personal local LLM execution tools, model launchers, and subagent wrapper scripts tailored specifically for my workstation environment (`$HOME/local-llm-cli`, `$HOME/llama-models`). It is publicly visible for personal reference and tracking.

---

## Environment Variables

All scripts support custom environment variable overrides with default fallback values tailored to my workstation:

| Variable | Description | My Machine Default |
| :--- | :--- | :--- |
| `LLAMA_MODELS_DIR` | Path to local GGUF model files directory | `$HOME/llama-models` |
| `LLAMA_BIN` | Path to `llama` / `llama-server` binary | `$HOME/.local/bin/llama` |
| `LLAMA_SERVER_URL` | Llama server base HTTP endpoint | `http://localhost:8080` |
| `HARNESS_BIN` | Path to CLI Agent harness binary | `$HOME/.volta/bin/pi` |

---

## Personal Setup & Deployment

Run the one-time setup script:

```bash
./install.sh
```

---

## CLI Tools Reference

### 1. `serve-qwythos` (Llama Server Launcher)
Start `llama-server` for Qwythos 9B on `0.0.0.0:8080`:

> **Network Configuration Note**:
> Serving on host address `0.0.0.0` and port `8080` (all network interfaces) rather than loopback `127.0.0.1 (localhost)` ensures that Docker containers in local development environments can directly communicate with the host machine's local LLM server endpoint.

```bash
serve-qwythos

# Serve the same model at a higher quant
serve-qwythos q8
```

### 2. `qwythos-fast` & `qwythos` (Subagent Task Execution)
Execute coding and reasoning sub-tasks directly from terminal or local wrappers:

```bash
qwythos-fast "Write a unit test for backend/app/llm.py"

qwythos "Deconstruct the Japanese grammar in this sentence..."
```

### 3. `qwen-select` (Unified Multi-Model Selector)
Select and execute any model alias:

```bash
qwen-select fast "Refactor this function"
qwen-select q8 "Explain this complex algorithm"
qwen-select 27b-swift "Generate complex schema"
```
