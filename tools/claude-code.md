# Claude Code 全局配置

> 同步位置：`~/.claude/CLAUDE.md`

<!-- 共享规范 -->
@include shared/coding-principles.md
@include shared/code-style.md
@include shared/git-conventions.md

---

## Claude Code 专属

### 工具使用

- Web 搜索：优先使用 Tavily（通过 search skill），WebSearch 额度耗尽时用 Tavily 替代
- 复杂任务使用 `EnterPlanMode` 制定计划

### 经验教训

- 记录位置：当前项目 `./experience/` 目录
- 成功经验：可复用的方案、技巧
- 失败教训：踩过的坑、不可行的方案

### 注意事项

- Claude Code 使用 `@AGENTS.md` 语法引用项目级 AGENTS.md
- 项目级 CLAUDE.md 只写 `@AGENTS.md` 即可引用项目的通用规范
- Claude 专属的指令放在 CLAUDE.md 中，通用规范放在 AGENTS.md 中
