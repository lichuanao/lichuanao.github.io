---
title: Chirpy 博客配置与修改完全指南
date: 2026-07-12 23:47:00 +0800
categories: [教程]
tags: [jekyll, chirpy, 博客, 配置]
---

本文档详细说明如何修改博客的各个方面。建议先通读一遍，了解整体结构，之后需要修改什么再来查阅对应章节。

## 目录

- [1. 博客目录结构](#1-博客目录结构)
- [2. 全局配置（`_config.yml`）](#2-全局配置configyml)
- [3. 个人信息与头像](#3-个人信息与头像)
- [4. 社交链接与联系方式](#4-社交链接与联系方式)
- [5. 顶部导航栏](#5-顶部导航栏)
- [6. 首页 Banner 与标语](#6-首页-banner-与标语)
- [7. 撰写文章](#7-撰写文章)
- [8. 分类与标签](#8-分类与标签)
- [9. 关于页面](#9-关于页面)
- [10. 页面图标与 Favicon](#10-页面图标与-favicon)
- [11. 评论系统](#11-评论系统)
- [12. 网站分析统计](#12-网站分析统计)
- [13. 黑暗模式与主题色](#13-黑暗模式与主题色)
- [14. 部署与推送](#14-部署与推送)

---

## 1. 博客目录结构

```
blog/
├── _config.yml          ← 全局配置文件（最重要）
├── _data/               ← 数据文件夹
│   └── contact.yml     ← 社交/联系方式
├── _posts/              ← 你的文章放这里
│   └── YYYY-MM-DD-标题.md
├── _tabs/               ← 顶部导航页面
│   ├── home.md
│   ├── about.md
│   ├── categories.md
│   ├── tags.md
│   └── archives.md
├── assets/              ← 静态资源
│   ├── img/             ← 图片（头像、文章配图）
│   │   └── avatar.jpg
│   ├── files/           ← 可下载的附件
│   └── css/             ← 自定义样式
├── _includes/            ← 模板组件（一般不改）
├── _layouts/             ← 页面布局（一般不改）
├── _plugins/             ← Jekyll 插件
├── .github/              ← GitHub Actions 配置
│   └── workflows/
├── push.bat              ← 一键推送脚本（双击运行）
└── push.ps1              ← 一键推送脚本（命令行）
```

> [!NOTE]
> **修改任何文件后都需要推送，GitHub 才会重新构建网站。**本地修改后双击 `push.bat` 即可。

---

## 2. 全局配置（`_config.yml`）

这是最重要的配置文件，修改时注意**冒号后有空格**，否则 Jekyll 会报错。

```yaml
# ====== 网站基本信息 ======
title: 李传傲的博客          # 浏览器标签和首页大标题
tagline: 记录技术、思考与日常  # 头像下方副标题
description: >-              # 网站描述（SEO 推荐）
  一个基于 Jekyll + GitHub Pages 的个人博客，免费、开源、易于维护。

# ====== 语言与地区 ======
lang: zh-CN                  # 语言，简体中文
timezone: Asia/Shanghai      # 时区

# ====== 作者信息 ======
author:
  name: 李传傲
  bio: "热爱技术与创作的个人博客主人"
  location: 中国
  email: lichuanao@example.com   # 公开邮箱，垃圾邮件风险，酌情填写
  links:
    - https://github.com/lichuanao
    # 可以继续添加其他链接

# ====== 头像 ======
avatar: /assets/img/avatar.jpg   # 指向 assets/img/ 下的头像文件

# ====== Footer 版权信息 ======
copyright:
  start_year: 2026               # 版权起始年份
  holder: 李传傲                  # 版权持有人

# ====== 时钟与日期 ======
timezone: Asia/Shanghai
```

### _config.yml 中各字段说明

| 字段 | 说明 | 推荐值 |
|---|---|---|
| `title` | 网站名称 | 中文博客名 |
| `tagline` | 副标题 | 一句话描述 |
| `lang` | 网站语言 | `zh-CN` |
| `timezone` | 时区 | `Asia/Shanghai` |
| `author.name` | 作者名 | 你的名字 |
| `author.email` | 邮箱 | 可留空或填公开邮箱 |
| `avatar` | 头像路径 | `/assets/img/avatar.xxx` |
| `url` | 网站地址 | `https://lichuanao.github.io`（一般不需改） |

> [!WARNING]
> 修改 `_config.yml` 时，**冒号后必须有空格**，YAML 语法要求：`key: value`，而不是 `key:value`。

---

## 3. 个人信息与头像

### 更换头像

1. 准备一张图片，建议是正方形，格式支持 `.jpg` / `.png` / `.gif` / `.svg`
2. 将图片放入 `assets/img/` 目录
3. 修改 `_config.yml` 中的 `avatar` 字段，指向新文件名：
   ```yaml
   avatar: /assets/img/新文件名.jpg
   ```
4. 推送即可

> [!TIP]
> 推荐图片尺寸：至少 200×200 像素，文件大小控制在 200KB 以内加载最快。

### 修改作者信息

编辑 `_config.yml` 中的 `author` 部分：

```yaml
author:
  name: 你的名字
  bio: "一句话个人简介"
  location: 城市
  email: 邮箱@example.com
  links:
    - https://github.com/你的GitHub用户名
    # - https://其他平台链接
```

---

## 4. 社交链接与联系方式

编辑 `_data/contact.yml`：

```yaml
# 社交链接配置文件
# 注释掉某行即可在网站上隐藏该链接

social:
  # 邮箱（已启用）
  email: lichuanao@example.com

  # GitHub（已启用）
  github: https://github.com/lichuanao

  # 取消注释启用其他平台（删除 # 号）：
  # twitter: https://twitter.com/你的用户名
  # facebook: https://facebook.com/你的用户名
  # mastodon: https://mastodon.social/@你的用户名
  # linkedin: https://linkedin.com/in/你的用户名
  # 知乎: https://www.zhihu.com/people/你的用户名

  # RSS 订阅（默认开启，不需要填 URL）
  rss: /feed.xml
```

---

## 5. 顶部导航栏

顶部导航栏的选项卡在 `_tabs/` 目录下，每个 `.md` 文件对应一个导航项。

### 修改现有选项卡

| 文件 | 对应页面 | 说明 |
|---|---|---|
| `_tabs/home.md` | 首页 | 一般不改 |
| `_tabs/about.md` | 关于 | 可以写自我介绍 |
| `_tabs/categories.md` | 分类 | 文章分类列表 |
| `_tabs/tags.md` | 标签 | 文章标签云 |
| `_tabs/archives.md` | 归档 | 按时间归档 |

### about.md 示例结构

```markdown
---
icon: fas fa-info-circle
order: 1        # 导航顺序，越小越靠前
---

## 👋 你好

我是李传傲，一个热爱技术与创作的个人博客主人。

## 🎯 我在做什么

- 探索 AI 与软件开发
- 记录技术学习笔记

## 📬 联系我

通过 [GitHub](https://github.com/lichuanao) 或邮件联系。
```

> [!NOTE]
> `icon` 字段指定 Font Awesome 图标，可以去 [Font Awesome 官网](https://fontawesome.com/icons) 挑选喜欢的图标名称（去掉 `fa-` 前缀）。

---

## 6. 首页 Banner 与标语

首页 Banner 是访客打开网站第一眼看到的内容，主要通过 `_config.yml` 控制：

```yaml
# 首页大标题
title: 李传傲的博客

# 头像下方副标题
tagline: 记录技术、思考与日常

# 或者关闭首页 Banner（显示简洁风格）
# navbar: true
```

---

## 7. 撰写文章

### 文章文件命名规则

格式：**`YYYY-MM-DD-文章标题.md`**

示例：
```
_posts/2026-07-12-markdown-语法速查.md
_posts/2026-07-10-python入门教程.md
```

> [!WARNING]
> 日期必须和文章开头的 `date` 字段一致，且格式必须是 `YYYY-MM-DD`。

### 文章模板（新建文章时复制这个）

```markdown
---
title: 文章标题
date: 2026-07-12 12:00:00 +0800
categories: [分类]
tags: [标签一, 标签二]
---

正文从这里开始...
```

### 文章分类策略

建议按内容类型分类，常用分类：

| 分类 | 适合内容 |
|---|---|
| `技术` | 编程、系统、工具使用 |
| `教程` | 一步一步的操作指南 |
| `随笔` | 个人感想、随想 |
| `笔记` | 学习笔记、读书笔记 |
| `分享` | 资源推荐、经验分享 |

### 文章标签策略

标签比分类更灵活，一篇文章可以有多个标签：

```markdown
tags: [Python, 入门, 教程]
```

建议标签全小写，用连字符分隔（Chirpy 会自动处理）。

### 文章内插入图片

1. 把图片放到 `assets/img/` 目录（新建子文件夹也行，如 `assets/img/posts/`）
2. 在文章中引用：

```markdown
![图片说明](https://lichuanao.github.io/assets/img/图片名.png)
```

---

## 8. 分类与标签

### 创建分类

Chirpy 支持两种分类方式：

**方式一：在文章 front matter 中指定（最常用）**
```yaml
categories: [技术]
```

**方式二：创建专门的分类页面（进阶）**
在 `categories/` 目录下创建 `xxx.md`，内容：
```markdown
---
layout: category
title: Python
category: python
---
```

### 创建标签

同样可以在 `tags/` 目录下创建专门页面：

```markdown
---
layout: tag
title: Python
tag: python
---
```

---

## 9. 关于页面

编辑 `_tabs/about.md`，支持 Markdown 和 HTML 混写，可以放：

- 个人介绍
- 技能栈
- 项目经历
- 联系方式
- 照片（放到 `assets/img/` 然后引用）

---

## 10. 页面图标与 Favicon

### 更换 Favicon（浏览器标签页图标）

1. 准备一张 96×96 像素的 PNG 图片（或 SVG）
2. 放到 `assets/img/favicons/` 目录
3. Chirpy 会自动使用该目录下的图标，无需额外配置

> [!TIP]
> 推荐用 [Favicon.io](https://favicon.io/) 上传图片自动生成所有尺寸，或用在线工具制作。

---

## 11. 评论系统

Chirpy 支持多种评论系统，推荐使用 **Giscus**（免费、基于 GitHub Discussions，无需注册额外账号）。

### 启用 Giscus

1. 打开 [giscus.app](https://giscus.app/zh-CN)，按提示授权
2. 选择你的博客仓库和对应的 Discussion 分类
3. 复制生成的代码
4. 在 `_config.yml` 中配置：

```yaml
comments:
  provider: giscus
  giscus:
    repo: lichuanao/lichuanao.github.io
    repo_id: 你的repo_id
    category: Announcements
    category_id: 你的category_id
    mapping: pathname
    strict: 0
    reactions_enabled: 1
    emit_metadata: 0
    input_position: bottom
    lang: zh-CN
```

> [!NOTE]
> Giscus 的 repo_id 和 category_id 在 giscus.app 生成的代码里可以找到。

---

## 12. 网站分析统计

### 使用 Google Analytics（免费）

1. 访问 [Google Analytics](https://analytics.google.com/)，创建账号和网站媒体资源
2. 复制你的 Measurement ID（格式：`G-XXXXXXXXXX`）
3. 在 `_config.yml` 添加：

```yaml
analytics:
  google:
    id: G-XXXXXXXXXX
```

### 使用 Cloudflare Web Analytics（更隐私）

1. 注册 [Cloudflare Analytics](https://www.cloudflare.com/web-analytics/)
2. 复制脚本
3. 在 `_config.yml` 添加：

```yaml
analytics:
  cloudflare:
    id: 你的id
```

---

## 13. 黑暗模式与主题色

### 修改主题色

在 `_config.yml` 中找到或添加：

```yaml
# Chirpy 7.6 支持的主题色选项：
# 蓝色（默认）：`#377bb8`
# 绿松石色：`#2980b9`
# 绿色：`#27ae60`
# 红色：`#c0392b`
# 粉红色：`#c0392b`
# 紫色：`#8e44ad`
# 橙黄色：`#d35400`
# indigo：`#2c3e50`
```

### 自定义 CSS（高级）

在 `assets/css/` 目录下创建 `custom.css`，写入：

```css
/* 自定义字体 */
body {
  font-family: "Lato", "Source Sans Pro", -apple-system, sans-serif;
}

/* 自定义链接颜色 */
a {
  color: #377bb8;
}

/* 自定义代码块背景 */
pre {
  background-color: #f8f8f8;
}
```

---

## 14. 部署与推送

### 方式一：双击推送（推荐）

双击 `blog/push.bat`，自动提交并推送到 GitHub。

> [!NOTE]
> 运行前确保 Clash 代理开启（7890 端口），否则推送会失败。

### 方式二：命令行推送

```powershell
cd C:\Users\lica\.qclaw\workspace-ua58rsb93veqtxl7\blog
.\push.ps1 "你的提交说明"
```

### 推送后等待构建

GitHub Actions 会自动触发构建，通常需要 **1-3 分钟**。

1. 打开 https://github.com/lichuanao/lichuanao.github.io/actions
2. 查看最新的 Action 运行状态
3. 绿色 ✅ = 构建成功
4. 打开 https://lichuanao.github.io 查看效果

### 强制刷新

推送成功后如果浏览器看到的是旧内容，按 `Ctrl + F5` 强制刷新。

---

## 常见问题

### Q：推送后网站没变化？
A：等 1-3 分钟让 GitHub 构建完成，然后 `Ctrl + F5` 强制刷新。

### Q：GitHub Actions 显示红色失败？
A：打开失败的 Action，查看日志，找到报错原因。常见问题：`_config.yml` 语法错误、图片路径不存在。

### Q：文章没有出现在网站上？
A：检查三点：① 文件名日期格式是否正确；② front matter 是否完整；③ 文件是否在 `_posts/` 目录。

### Q：想本地预览再推送？
A：需要安装 Ruby + Jekyll 环境（较复杂），当前环境不支持。如果确实需要，建议后续单独配置。

---

## 快速修改清单

| 我想修改 | 修改哪个文件 | 字段/内容 |
|---|---|---|
| 博客名称 | `_config.yml` | `title` |
| 副标题 | `_config.yml` | `tagline` |
| 头像 | `_config.yml` + `assets/img/` | `avatar` |
| 作者名/简介 | `_config.yml` | `author.name/bio` |
| 邮箱/GitHub 链接 | `_data/contact.yml` | 对应字段 |
| 导航栏内容 | `_tabs/about.md` 等 | Markdown 内容 |
| 博客主题色 | `_config.yml` | `theme_color` |
| 新文章 | `_posts/YYYY-MM-DD-xxx.md` | 新建文件 |
| 自定义样式 | `assets/css/custom.css` | CSS 代码 |
| Favicon | `assets/img/favicons/` | 替换图标文件 |

