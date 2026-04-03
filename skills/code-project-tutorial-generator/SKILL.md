---
name: "code-project-tutorial-generator"
description: "把一次已经完成或基本完成的代码项目、开发流程、调试过程或与 Codex 的协作过程整理成可发布的中文教程博客。Use when Codex needs to turn a finished coding project or implementation session into a reusable tutorial blog post. Works with a target blog project configured by `.codex/project-tutorial-blog.json` or `project-tutorial-blog.json`. Do not use for statistics notes, essays, general blog posts, README writing, or non-tutorial articles."
---

# Code Project Tutorial Generator

先读 `references/config-resolution.md`、`references/style-guide.md`、`references/tutorial-template.md` 和 `references/source-summary-template.md`。

## Use This Skill To

- 把刚完成的代码项目或开发流程整理成教程博客。
- 根据当前对话、代码改动和项目结果输出一篇可发布的教程文章。
- 根据目标博客项目里的 `tutorial-sources/<slug>.md` 重新生成或重写项目教程。

## Do Not Use This Skill To

- 写统计学笔记、数学笔记或普通学习笔记。
- 写随笔、观点文或非教程型博客。
- 润色 README、项目介绍页或非博客文稿。
- 处理和代码项目无关的内容创作。

## Target Project Resolution

按 `references/config-resolution.md` 的顺序定位目标博客项目。

- 优先使用用户明确指定的项目路径。
- 否则在当前工作目录向上寻找 `.codex/project-tutorial-blog.json`。
- 再不行就寻找 `project-tutorial-blog.json`。
- 如果当前仓库明显是 Astro content blog，允许使用默认推断。
- 如果仍然无法确定，先停下来，让用户指定项目根目录或添加配置文件。

## Source Priority

按这个顺序取材：

1. 当前线程里真实发生的步骤、命令、决策、报错与修复。
2. `tutorial-sources/<slug>.md` 中已经保存的任务摘要。
3. 目标项目里的最终文件、配置、脚本和产物。
4. 外部研究补充的时效性信息。

不要编造没有发生过的步骤。若只能根据最终结果倒推，明确说明哪些内容是推断。

## Workflow

### Phase 1: Collect Facts

- 确定教程主题、目标产物和合适的 `<slug>`。
- 先定位目标博客项目与配置文件。
- 根据配置确定文章输出路径和摘要输出路径。
- 如果摘要文件存在，先读它；如果不存在且当前线程信息充分，稍后自动补写一个。
- 读取真实相关文件，不要只靠记忆复述。
- 提取这些最小事实：
  - 起点和前提
  - 最终产物
  - 关键步骤顺序
  - 关键命令或界面操作
  - 关键决策及原因
  - 踩坑与修复

### Phase 2: Refresh Unstable Facts

只研究容易过时的事实：

- 版本号
- 下载链接
- 当前推荐做法
- 部署平台入口或 UI 名称
- 命令参数或配置方式

把研究当成补充，不要让它覆盖真实流程。

### Phase 3: Propose Outline

在写正文前，先给用户一个简短计划：

1. 用 2-4 条 bullet 总结已确认事实和必要研究结论。
2. 如果存在多种写法，推荐一种最适合“未来的自己/半新手”的写法。
3. 列出准备写入教程的主要步骤，通常 5-10 步。
4. 明确哪些坑、决策或环境细节会保留。
5. 等用户确认后再写。

### Phase 4: Write Tutorial

- 严格按 `references/tutorial-template.md` 的结构写。
- 严格按 `references/style-guide.md` 的风格写。
- 文章输出到配置文件指定的 `contentDir/<slug>/<articleFileName>`。
- frontmatter 必须满足配置里的字段要求；如果配置未声明，至少提供 `title`、`description`、`publishDate`。
- 同时创建或更新配置文件指定的 `summaryDir/<slug>.md`。

### Phase 5: Final Checks

- 确认步骤顺序与真实过程一致。
- 确认代码块、命令、路径、链接可直接复制使用。
- 确认 frontmatter 的必填字段齐全且长度受控。
- 确认只解释复现所需的背景，不把文章写成面向完全零基础的百科。
- 如果缺少关键事实，先指出缺口，不要用想象补齐。

## Output Rules

- 默认输出简体中文；技术术语可中英混用。
- 标题、步骤、故障排除都要可扫描。
- 优先保留真实决策和真实坑，而不是泛泛而谈的最佳实践。
- 用教程服务复现，不用教程包装过程。
