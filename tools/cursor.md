# Cursor 规则

> 同步位置：项目根目录 `.cursorrules`（旧方式）或 `.cursor/rules/` 目录
>
> Cursor 新版本已支持直接读取项目根目录的 `AGENTS.md`，建议优先用 AGENTS.md。
>
> 如果启用 "Include CLAUDE.md in context" 设置，Cursor 也能读取 `CLAUDE.md`。

<!-- 共享规范 -->
本文件引用 shared/ 目录下的共享规范。在项目级使用时，建议直接使用 AGENTS.md 作为单一配置源。

## Cursor 专属配置建议

- 在 Cursor 设置中启用 "Include CLAUDE.md in context"
- 这样 Cursor 能直接读取项目根目录的 AGENTS.md / CLAUDE.md
- 无需维护 `.cursorrules` 文件
