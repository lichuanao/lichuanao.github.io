---
title: Markdown 排版示例
date: 2026-07-10 20:30:00 +0800
categories: [教程]
tags: [Markdown, 排版]
---

这篇文章演示 Chirpy 主题支持的常用 Markdown 排版能力，方便你日后参考。

## 标题层级

### 三级标题

#### 四级标题

## 强调与链接

这是**加粗**、*斜体*、~~删除线~~，以及[一个链接](https://jekyllrb.com)。

## 列表

- 无序列表项 A
- 无序列表项 B
  - 嵌套项 B-1

1. 有序列表项一
2. 有序列表项二

## 引用

> 简洁是可靠的前提。
> —— Edsger W. Dijkstra

## 代码块

行内代码：`git status`。

```python
def greet(name: str) -> str:
    return f"Hello, {name}!"

print(greet("world"))
```

## 表格

| 功能 | 是否免费 | 说明 |
|------|:------:|------|
| GitHub Pages | ✅ | 静态站点托管 |
| Jekyll | ✅ | 静态站点生成器 |
| Chirpy 主题 | ✅ | 开源博客主题 |

## 提示框

> 这是一个普通提示。
{: .prompt-info }

> 这是一个成功提示。
{: .prompt-success }

> 这是一个警告提示。
{: .prompt-warning }

> 这是一个危险提示。
{: .prompt-danger }

## 数学公式（KaTeX）

行内公式 $E = mc^2$，块级公式：

$$
\int_{-\infty}^{\infty} e^{-x^2}\,dx = \sqrt{\pi}
$$

> 注意：使用数学公式需在文章 front matter 中加 `math: true`。
{: .prompt-tip }
