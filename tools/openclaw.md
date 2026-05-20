# OpenClaw 配置

> OpenClaw 读取 `~/.openclaw/workspace/AGENTS.md` 作为协作规则。

OpenClaw 的 AGENTS.md 主要是 Prism（棱镜）和行童的协作规范，包含沟通方式、执行纪律等，与编码工具规范是不同维度。

## 编码相关的规范

OpenClaw 在编码场景下，应参考 `shared/` 目录下的共享编码规范。具体方式：

- 编码任务中，OpenClaw 自动遵循 `shared/coding-principles.md` 中的编码纪律
- OpenClaw 的 AGENTS.md 中已有"编码纪律"章节，保持同步

## 注意

OpenClaw 的 AGENTS.md 不适合直接 hard link，因为它包含大量 Prism 人格和协作规则，不适用于其他工具。编码规范部分保持内容一致即可。
