# Codex 配置

> 同步位置：项目根目录 `AGENTS.md`（Codex 原生读取）
>
> 全局配置：`~/.codex/config.toml`

Codex 原生读取项目根目录的 `AGENTS.md`，无需额外配置。

## 全局配置（~/.codex/config.toml）

```toml
project_doc_fallback_filenames = ["CLAUDE.md", "claude.md"]
```

## Codex 专属

- Codex 自动发现项目根目录的 `AGENTS.md`
- 建议把项目规范写在 `AGENTS.md`，Codex 和 Cursor 都能直接读取
