# AI Coding Conventions

统一的 AI 编码协作规范仓库。一套规范，多工具同步。

## 仓库结构

```
ai-coding-conventions/
├── README.md                    # 本文件
├── shared/                      # 所有工具共享的核心规范
│   ├── coding-principles.md     # 编码原则（思考优先、简洁、精准变更）
│   ├── code-style.md            # 代码风格（中文文档、技术栈偏好等）
│   └── git-conventions.md       # Git 规范（commit message、分支策略）
├── tools/                       # 各工具的入口配置
│   ├── claude-code.md           # Claude Code 全局配置 → 放到 ~/.claude/CLAUDE.md
│   ├── cursor.md                # Cursor 规则 → 放到 .cursor/rules/
│   ├── codex.md                 # Codex 配置 → AGENTS.md 或 ~/.codex/
│   └── openclaw.md              # OpenClaw 配置（AGENTS.md 片段）
├── templates/                   # 新项目模板
│   └── project-agents.md        # 新项目 AGENTS.md 模板
└── sync.sh                      # 同步脚本（hard link 到各工具配置位置）
```

## 使用方式

### 1. 克隆到本地

```bash
git clone git@github.com:zengguangzhong/ai-coding-conventions.git
```

### 2. 运行同步脚本

```bash
./sync.sh
```

脚本会将各配置 hard link 到对应工具期望的位置。修改本仓库文件后，各工具自动生效。

### 3. 新项目初始化

复制 `templates/project-agents.md` 到新项目根目录作为 `AGENTS.md`，然后根据项目情况补充项目专属内容。

## 同步逻辑

本仓库是**单一真相源**。`sync.sh` 通过 hard link 把配置分发到各工具的位置：

| 工具 | 配置位置 | 来源 |
|------|----------|------|
| Claude Code | `~/.claude/CLAUDE.md` | `tools/claude-code.md` |
| Cursor | `.cursor/rules/` 或项目根 `.cursorrules` | `tools/cursor.md` |
| Codex | `AGENTS.md` 或 `~/.codex/` | `tools/codex.md` |
| OpenClaw | `~/.openclaw/workspace/AGENTS.md` 片段 | `tools/openclaw.md` |

## 跨电脑同步

公司和家里都 clone 这个仓库，`git pull` 后跑 `sync.sh` 即可。

## 修改规范

1. 在本仓库修改对应文件
2. `git commit && git push`
3. 另一台电脑 `git pull && ./sync.sh`

⚠️ 不要直接修改各工具位置的配置文件（hard link 会同步，但养成习惯在本仓库改更好管理）。
