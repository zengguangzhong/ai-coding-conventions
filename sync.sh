#!/bin/bash
# sync.sh — 将 AI 编码规范同步到各工具配置位置
#
# 使用方式：
#   ./sync.sh          # 同步所有工具
#   ./sync.sh claude   # 只同步 Claude Code
#   ./sync.sh cursor   # 只同步 Cursor
#   ./sync.sh codex    # 只同步 Codex
#
# 同步方式：hard link（修改任何一端都会同步到另一端）

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SHARED_DIR="$REPO_DIR/shared"
TOOLS_DIR="$REPO_DIR/tools"

# 颜色输出
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

log() {
    echo -e "${BLUE}[sync]${NC} $1"
}

ok() {
    echo -e "${GREEN}[✓]${NC} $1"
}

# 同步 Claude Code 全局配置
sync_claude() {
    local target="$HOME/.claude/CLAUDE.md"
    local source="$TOOLS_DIR/claude-code.md"

    # Claude Code 不支持 @include，需要拼接
    log "生成 Claude Code 完整配置..."
    {
        cat "$SHARED_DIR/coding-principles.md"
        echo ""
        echo "---"
        echo ""
        # 提取 Claude Code 专属部分（跳过 @include 行和注释行）
        grep -v '^<!--' "$source" | grep -v '^@include' | sed '/^$/N;/^\n$/d'
    } > "$target"

    ok "Claude Code → $target"
}

# 同步 Cursor（项目级别，需要用户在项目中运行）
sync_cursor() {
    log "Cursor: 建议在项目根目录使用 AGENTS.md，并在 Cursor 设置中启用 'Include CLAUDE.md in context'"
    log "Cursor 全局规则目录: ~/.cursor/rules/（如需要可手动创建）"
    ok "Cursor — 使用 AGENTS.md 统一方案，无需额外配置"
}

# 同步 Codex 全局配置
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

# 同步所有
sync_all() {
    echo ""
    log "🚀 开始同步 AI 编码规范..."
    echo ""
    sync_claude
    sync_cursor
    sync_codex
    echo ""
    log "✨ 同步完成！"
    echo ""
    echo "提示："
    echo "  - 修改规范请编辑本仓库（ai-coding-conventions/）中的文件"
    echo "  - 修改后重新运行 ./sync.sh"
    echo "  - 跨电脑同步：git pull && ./sync.sh"
}

# 主逻辑
case "${1:-all}" in
    claude)   sync_claude ;;
    cursor)   sync_cursor ;;
    codex)    sync_codex ;;
    all)      sync_all ;;
    *)
        echo "用法: $0 [claude|cursor|codex|all]"
        exit 1
        ;;
esac
