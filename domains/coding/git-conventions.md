# Git 规范

## Commit Message

格式：`类型: 简短描述`

类型：
- `feat` 新功能
- `fix` 修复
- `refactor` 重构（不改变行为）
- `docs` 文档
- `style` 格式调整（不影响逻辑）
- `test` 测试
- `chore` 构建/工具/依赖

描述用中文，简洁准确。

## 分支策略

- `main` 始终可部署
- 功能开发用 `feat/xxx` 分支
- 修复用 `fix/xxx` 分支
- 不直接向 `main` push（个人小项目可以宽松）

## 私人项目

- README 必须写应用说明（中文）
- 项目文档放项目内 `docs/` 目录
