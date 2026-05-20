# 代码风格

## 技术栈偏好

- **默认技术栈：** React + Node.js + TypeScript + Next.js + Tailwind CSS + pnpm
- 样式用 Tailwind CSS，不自写 CSS
- 包管理用 pnpm

## 命名规范

- 文件名：kebab-case（`user-profile.tsx`）
- 组件名：PascalCase（`UserProfile`）
- 变量/函数：camelCase
- 常量：UPPER_SNAKE_CASE
- 类型/接口：PascalCase

## 代码风格

- 优先使用函数式组件和 hooks
- 优先 const，let 只在需要重赋值时用
- 用早期返回减少嵌套
- 单个函数不超过 50 行，超过则拆分
- 类型优先用 interface，需要联合类型/交叉类型时用 type

## 注释

- 注释用中文
- 解释"为什么"，不解释"做什么"（代码本身应该说明做什么）
- TODO 格式：`// TODO: 原因 - 谁什么时候加的`
