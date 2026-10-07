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

### 1. Server Launchers (`llama-server`)

> **Network Configuration Note**:
> Serving on host address `0.0.0.0` (all network interfaces) rather than loopback `127.0.0.1 (localhost)` ensures that Docker containers in local development environments can directly communicate with the host machine's local LLM server endpoint.
>
> **Metrics & Observability**:
> All server launchers include `--metrics` enabled by default, exposing Prometheus-compatible performance metrics at `http://<host>:<port>/metrics` (e.g. `http://localhost:8080/metrics`).

#### `serve-qwen-27b-swift` (Swift-Qwen 3.8 27B Q3_K_S)
Start `llama-server` for Swift-Qwen 3.8 27B (Q3_K_S) on `0.0.0.0:8080`:

```bash
serve-qwen-27b-swift

# Serve without speculative decoding
serve-qwen-27b-swift nomtp
```

#### `serve-qwen-27b-swift-gsq` (Swift 1.5 Qwen 3.8 27B GSQ-RCO IQ3_XXS MTP)
Start `llama-server` for Swift 1.5 Qwen 3.8 27B GSQ-RCO on `0.0.0.0:8080`:

```bash
serve-qwen-27b-swift-gsq

# Serve without speculative decoding
serve-qwen-27b-swift-gsq nomtp
```

---

### 2. Unified Client Execution (`local-llm`)

Execute prompts directly against whichever model is currently active in `llama-server` on `localhost:8080`. The client dispatches via the `pi` agent harness (using the generic `local` model ID) and automatically falls back to direct HTTP completions.

```bash
# Standard command-line prompt
local-llm "Explain speculative decoding in one sentence"

# Piped / non-interactive execution
cat query.sql | local-llm

# Custom system instructions
local-llm -s "You are a compiler engineer" "Explain loop invariant code motion"

# Inspect currently loaded model on port 8080
local-llm --info
```

---

### 3. Agent Bridge Integration

The subagent registered under `~/.gemini/config/agents/` delegates local pair programming tasks:
- **`@local_llm`**: Primary unified subagent routing directly to the active `llama-server` via `local-llm`.
