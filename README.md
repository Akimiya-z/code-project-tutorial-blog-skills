# Code Project Tutorial Blog Skills

Two Codex skills for turning a finished coding session into a tutorial blog post and then reviewing that tutorial before publishing it.

This repo is intentionally separate from any personal site or machine-specific setup. The skills resolve the target blog project from a small config file inside the blog repo, so other people can reuse them without editing hard-coded absolute paths.

## Included skills

- `code-project-tutorial-generator`
  Turn a finished code project, implementation session, or Codex collaboration into a publishable tutorial blog post.
- `review-code-project-tutorial`
  Review a generated project tutorial blog post for completeness, executability, technical accuracy, and fidelity to the real process.

## What these skills are for

- Code project tutorial blogs
- Build logs that explain a real implementation process
- “How I built this” posts that need to be reproducible

## What these skills are not for

- Statistics notes
- Math notes
- Essays or opinion posts
- General blog polishing
- README writing

## Install

Clone this repo, then run:

```bash
./scripts/install_skills.sh
```

That creates symlinks in `${CODEX_HOME:-$HOME/.codex}/skills`.

## Configure your target blog project

In the target blog project, add this file:

```text
.codex/project-tutorial-blog.json
```

Use the example in [examples/astro-content-blog/.codex/project-tutorial-blog.json](./examples/astro-content-blog/.codex/project-tutorial-blog.json):

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

## Where generated files are saved

These skills do not save files into this repo. They write into the target blog project configured above.

Given a target project root and a slug:

- Tutorial blog post:
  `<projectRoot>/<contentDir>/<slug>/<articleFileName>`
- Tutorial source summary:
  `<projectRoot>/<summaryDir>/<slug>.md`

With the Astro example config, that becomes:

- `src/content/blog/<slug>/index.md`
- `tutorial-sources/<slug>.md`

## Usage

Example generation prompt:

```text
Use $code-project-tutorial-generator 把这次和 Codex 协作完成的代码项目过程整理成教程博客，先给提纲，再生成正文。
```

Example review prompt:

```text
Use $review-code-project-tutorial 审查这篇代码项目教程博客，只先列问题，不要先改。
```

Fast publish-style review:

```text
Use $review-code-project-tutorial 审查这篇代码项目教程博客；如果问题不大，直接整理成发布版。
```

## Current default assumptions

- Target blog is an Astro content blog.
- If no config file is found, the skills can still infer defaults when the current repo contains:
  - `src/content.config.ts`
  - `src/content/blog/`
- If neither config nor safe inference is available, the skills should stop and ask for the target project root.
