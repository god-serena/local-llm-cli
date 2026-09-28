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

#### `serve-qwythos` (Qwythos 9B v2 MTP)
Start `llama-server` for Qwythos 9B on `0.0.0.0:8080`:

```bash
serve-qwythos

# Serve with Q8_0 precision mode
serve-qwythos q8
```

#### `serve-qwen-27b-gsq` (Qwen 3.8 27B GSQ-RCO IQ3_XXS MTP)
Start `llama-server` for Qwen 3.8 27B GSQ-RCO with speculative decoding:

```bash
serve-qwen-27b-gsq
```

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

### 2. Subagent & Model Execution

Execute coding and reasoning sub-tasks directly from terminal or local wrappers:

#### `qwythos-fast` & `qwythos`
```bash
# Fast subagent mode (Q5_K_M)
qwythos-fast "Write a unit test for backend/app/llm.py"

# High-precision mode (Q8_0)
qwythos "Deconstruct the Japanese grammar in this sentence..."
```

#### `qwen-27b-gsq`
```bash
# Execute with task-lossless GSQ-RCO 27B (IQ3_XXS MTP)
qwen-27b-gsq "Implement a high-performance LRU cache in Rust"
```

#### `qwen-27b-swift`
```bash
# Execute with Swift Qwen 3.8 27B (Q3_K_S)
qwen-27b-swift "Optimize this SQL query plan"
```

#### `qwen-27b-swift-gsq`
```bash
# Execute with Swift 1.5 Qwen 3.8 27B GSQ-RCO (IQ3_XXS MTP)
qwen-27b-swift-gsq "Analyze this code structure"
```

---

### 3. `qwen-select` (Unified Multi-Model Selector)
Select and execute any model alias on demand:

```bash
qwen-select fast "Refactor this function"
qwen-select q8 "Explain this complex algorithm"
qwen-select gsq "Analyze this system architecture"
qwen-select swift "Generate complex schema"
qwen-select swift-gsq "Draft a prompt template"
```
