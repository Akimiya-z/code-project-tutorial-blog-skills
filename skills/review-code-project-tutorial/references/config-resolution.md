# Config Resolution

沿用生成器的目标项目定位规则：

1. 优先使用用户明确指定的项目路径或文章路径。
2. 在当前工作目录向上寻找 `.codex/project-tutorial-blog.json`。
3. 如果没找到，再寻找 `project-tutorial-blog.json`。
4. 如果当前项目明显是 Astro content blog，则按默认值推断。
5. 如果仍然无法确定，停止并让用户指定目标项目。

## Review Inputs

审查前至少要确定：

- `projectRoot`
- `contentDir`
- `summaryDir`
- `articleFileName`
- `requiredFrontmatter`

如果用户只说“审查刚生成的教程”，优先使用最近一次生成器输出的路径；否则让用户补充目标文章路径。
