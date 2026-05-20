# AI Collaboration Conventions

统一的 AI 协作规范。不只是编码——涵盖思考方式、沟通风格、工作纪律、写作、工具使用等所有 AI 协作场景。

## 为什么需要这个仓库

我用多个 AI 工具（Claude Code、Cursor、Codex、OpenClaw），在多台电脑上工作。每个工具都有一套配置文件，但我的**协作原则是同一套**——不管用什么工具、在哪个环境。

这个仓库就是那套统一规范。

## 仓库结构

```
ai-collaboration-conventions/
├── README.md                        # 本文件
├── core/                            # 核心协作原则（所有场景通用）
│   ├── thinking.md                  # 思考方式（先想再做、验证前提、不跳步）
│   ├── communication.md             # 沟通风格（语言、立场、格式、禁忌）
│   ├── discipline.md                # 工作纪律（不谄媚、不跳步、先验证再报告）
│   └── safety.md                    # 安全红线（隐私、危险操作、不可删除）
├── domains/                         # 按领域分类的规范
│   ├── coding/                      # 编码场景
│   │   ├── principles.md            # 编码原则
│   │   ├── code-style.md            # 代码风格
│   │   └── git-conventions.md       # Git 规范
│   ├── writing/                     # 写作场景
│   │   └── style.md                 # 写作风格（参考 content-style.md）
│   └── research/                    # 研究场景
│       └── methodology.md           # 调研方法
├── tools/                           # 各工具的入口配置
│   ├── claude-code.md               # Claude Code → ~/.claude/CLAUDE.md
│   ├── cursor.md                    # Cursor → .cursor/rules/
│   ├── codex.md                     # Codex → AGENTS.md
│   └── openclaw.md                  # OpenClaw → AGENTS.md 片段
├── templates/                       # 模板
│   ├── project-agents.md            # 新项目 AGENTS.md 模板
│   └── project-claude.md            # 新项目 CLAUDE.md 模板
└── sync.sh                          # 同步脚本
```

## 核心理念

### 🎯 单一真相源

规范只在这个仓库里写一次。通过 `sync.sh` 分发到各工具位置。

### 🔗 不是编码规范，是协作规范

AI 不只是写代码。它还是：
- 思考伙伴——帮我从不同角度看问题
- 写作助手——帮我表达想法
- 研究助手——帮我搜集整理信息
- 执行助手——帮我完成任务

每种场景都需要不同的协作方式，但底层原则是统一的。

### 🧭 适用原则

- **协作而非服从**：AI 是合伙人，不是工具人。有问题要说出来
- **诚实优先**：不确定就说不确定，不编造
- **主动而非被动**：不等安排，主动发现问题
- **验证再输出**：先验证再说，不把猜测当事实

## 使用方式

### 同步到本地工具

```bash
git clone git@github.com:zengguangzhong/ai-coding-conventions.git
cd ai-coding-conventions
./sync.sh
```

### 修改规范

1. 在本仓库修改对应文件
2. `git commit && git push`
3. 另一台电脑 `git pull && ./sync.sh`

### 新项目初始化

```bash
cp templates/project-agents.md /path/to/project/AGENTS.md
# 然后补充项目专属内容
```

## 同步映射

| 工具 | 配置位置 | 来源 |
|------|----------|------|
| Claude Code | `~/.claude/CLAUDE.md` | `tools/claude-code.md` + `core/` |
| Cursor | `.cursor/rules/` 或 AGENTS.md | `tools/cursor.md` |
| Codex | `AGENTS.md` 或 `~/.codex/` | `tools/codex.md` |
| OpenClaw | `~/.openclaw/workspace/AGENTS.md` | `tools/openclaw.md` + `core/` |
