#!/bin/bash
# sync.sh — 将 AI 协作规范同步到各工具配置位置
#
# 使用方式：
#   ./sync.sh          # 同步所有工具
#   ./sync.sh claude   # 只同步 Claude Code
#   ./sync.sh cursor   # 只同步 Cursor
#   ./sync.sh codex    # 只同步 Codex
#
# 同步方式：生成目标文件（拼接 core/ + domains/coding/ + tools/ 专属内容）

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CORE_DIR="$REPO_DIR/core"
DOMAINS_DIR="$REPO_DIR/domains"
TOOLS_DIR="$REPO_DIR/tools"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

log() { echo -e "${BLUE}[sync]${NC} $1"; }
ok()   { echo -e "${GREEN}[✓]${NC} $1"; }

sync_claude() {
    local target="$HOME/.claude/CLAUDE.md"
    local source="$TOOLS_DIR/claude-code.md"

    log "生成 Claude Code 完整配置..."
    {
        echo "# Claude Code 协作配置"
        echo ""
        echo "> 由 ai-collaboration-conventions/sync.sh 自动生成。修改请编辑本仓库。"
        echo ""
        echo "---"
        echo ""
        echo "# 核心协作规范"
        echo ""
        cat "$CORE_DIR/thinking.md"
        echo ""
        echo "---"
        echo ""
        cat "$CORE_DIR/communication.md"
        echo ""
        echo "---"
        echo ""
        cat "$CORE_DIR/discipline.md"
        echo ""
        echo "---"
        echo ""
        echo "# 编码规范"
        echo ""
        cat "$DOMAINS_DIR/coding/principles.md"
        echo ""
        echo "---"
        echo ""
        cat "$DOMAINS_DIR/coding/code-style.md"
        echo ""
        echo "---"
        echo ""
        cat "$DOMAINS_DIR/coding/git-conventions.md"
        echo ""
        echo "---"
        echo ""
        # Claude Code 专属部分（去掉开头的标题和说明）
        sed -n '/^## Claude Code 专属/,$ p' "$source"
    } > "$target"

    ok "Claude Code → $target"
}

sync_cursor() {
    log "Cursor: 使用 AGENTS.md 统一方案"
    log "  在 Cursor 设置中启用 'Include CLAUDE.md in context' 即可"
    ok "Cursor — 无需额外配置"
}

sync_codex() {
    local config_dir="$HOME/.codex"
    local config_file="$config_dir/config.toml"

    mkdir -p "$config_dir"

    if [ ! -f "$config_file" ]; then
        log "创建 Codex 全局配置..."
        cat > "$config_file" << 'EOF'
# Codex 全局配置
project_doc_fallback_filenames = ["CLAUDE.md", "claude.md"]
EOF
        ok "Codex 配置 → $config_file"
    else
        ok "Codex 配置已存在: $config_file"
    fi
}

sync_all() {
    echo ""
    log "🚀 开始同步 AI 协作规范..."
    echo ""
    sync_claude
    sync_cursor
    sync_codex
    echo ""
    log "✨ 同步完成！"
    echo ""
    echo "提示："
    echo "  - 修改规范请编辑本仓库中的文件"
    echo "  - 修改后重新运行 ./sync.sh"
    echo "  - 跨电脑同步：git pull && ./sync.sh"
}

case "${1:-all}" in
    claude) sync_claude ;;
    cursor) sync_cursor ;;
    codex)  sync_codex ;;
    all)    sync_all ;;
    *)
        echo "用法: $0 [claude|cursor|codex|all]"
        exit 1
        ;;
esac
