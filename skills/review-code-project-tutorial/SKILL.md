---
name: "review-code-project-tutorial"
description: "审查已经写好的代码项目教程博客，检查内容完整性、格式一致性、可执行性、技术准确性以及是否忠实于真实过程。Use when Codex needs to review a project tutorial blog post before polishing or publishing it. Works with a target blog project configured by `.codex/project-tutorial-blog.json` or `project-tutorial-blog.json`. Do not use for statistics notes, essays, general blog posts, README writing, or non-tutorial articles."
---

# Review Code Project Tutorial

先读 `references/config-resolution.md` 和 `references/review-checklist.md`。

## Use This Skill To

- 审查新生成的代码项目教程博客。
- 在用户准备发布项目教程博客前，先出结构化问题清单。
- 在用户明确要求时，把已经成型的项目教程博客整理成更适合发布的版本。

## Do Not Use This Skill To

- 审查统计学笔记、数学笔记或普通学习笔记。
- 审查随笔、观点文或普通博客文章。
- 审查 README 或文档站介绍页。

## Target Project Resolution

按 `references/config-resolution.md` 的顺序定位目标博客项目，并确定：

- 目标文章路径
- `summaryDir`
- frontmatter 约束

## Review Workflow

### Phase 1: Read and Analyze

- 读取目标教程文件。
- 如果存在配置文件指定的同 basename 摘要文件，一起读取，用来核对是否忠实于真实过程。
- 如果教程涉及外部平台、版本或 UI，检查是否需要刷新时效性信息。
- 按 `references/review-checklist.md` 逐类检查。

### Phase 2: Report Findings

先汇报，不要先改：

1. 给出一句总体评价。
2. 按类别列出问题：
   - 内容缺失
   - 格式问题
   - 可执行性问题
   - 技术准确性问题
   - 与真实过程不一致的问题
3. 尽量给出行号或上下文定位。
4. 明确建议修什么，不要只说“可以更好”。
5. 问用户是否应用修复。

如果用户明确说了“直接整理成发布版”“审查后直接整理”或同类意思，并且问题不大：

- 先用 2-4 条 bullet 给出极短的审查结论。
- 然后直接进入修订，不需要再单独等待一次确认。

如果问题较大，仍然停在报告阶段，先让用户决定。

### Phase 3: Apply Fixes

得到批准后再改：

- 优先修事实错误、缺失前提、错误顺序和格式问题。
- 保持原文结构和语气，不整篇重写。
- 如果教程和摘要冲突，优先回到真实事实；不确定时先指出冲突。
- 改完后简短汇报修了什么。

## Review Rules

- 只审查会影响复现、可信度、维护性和一致性的问题。
- 必须检查是否符合目标项目配置中的 frontmatter 约束和目录约束。
- 若没有发现问题，明确说明“未发现问题”，并指出剩余风险（如某一步未实测）。
