# Config Resolution

## Goal

在写文章前，先确定目标博客项目根目录和输出规则。

## Search Order

1. 如果用户明确给出项目路径或文章路径，优先使用。
2. 在当前工作目录向上寻找 `.codex/project-tutorial-blog.json`。
3. 如果没找到，再向上寻找 `project-tutorial-blog.json`。
4. 如果仍然没找到，但当前项目满足下面两个条件：
   - 存在 `src/content.config.ts`
   - 存在 `src/content/blog/`
   则按 Astro content blog 默认值推断：
   - `projectRoot = 当前仓库根目录`
   - `contentDir = src/content/blog`
   - `summaryDir = tutorial-sources`
   - `articleFileName = index.md`
   - `requiredFrontmatter = ["title", "description", "publishDate"]`
5. 如果以上都不满足，停止并让用户指定项目根目录或添加配置文件。

## Config Shape

配置文件使用 JSON。推荐放在目标博客项目根目录下的 `.codex/project-tutorial-blog.json`。

```json
{
  "siteType": "astro-content-blog",
  "contentDir": "src/content/blog",
  "summaryDir": "tutorial-sources",
  "articleFileName": "index.md",
  "requiredFrontmatter": ["title", "description", "publishDate"],
  "optionalFrontmatter": ["updatedDate", "tags", "language"],
  "defaultLanguage": "中文"
}
```

## Output Paths

- 教程正文：`<projectRoot>/<contentDir>/<slug>/<articleFileName>`
- 过程摘要：`<projectRoot>/<summaryDir>/<slug>.md`
