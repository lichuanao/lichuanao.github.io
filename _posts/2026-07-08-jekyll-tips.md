---
title: Jekyll 博客维护小技巧
date: 2026-07-08 09:15:00 +0800
categories: [技术]
tags: [Jekyll, 运维, 技巧]
math: false
---

分享几条让这个博客长期好维护的实用技巧。

## 1. 升级主题只改一行

主题版本固定在 `Gemfile` 里：

```ruby
gem "jekyll-theme-chirpy", "~> 7.6"
```

想升级时，把版本号改大一点（例如 `"~> 7.7"`），重新推送即可。GitHub Actions 会自动用新版本重新构建。

## 2. 本地预览（可选）

如果你希望在推送前先看效果，需要本地装 Ruby，然后：

```bash
bundle install
bundle exec jekyll s
# 打开 http://localhost:4000
```

> 不装 Ruby 也完全没问题——直接推送到 GitHub，由 Actions 构建，省去本地环境。
{: .prompt-tip }

## 3. 固定(pin)重要文章

在文章 front matter 加 `pin: true`，它就会置顶在首页：

```yaml
---
title: 关于本站
pin: true
---
```

## 4. 开启评论

推荐用 **giscus**（免费、基于 GitHub Discussions）：

1. 安装 giscus GitHub App 并在你的仓库开启 Discussions
2. 到 [giscus.app](https://giscus.app) 生成配置
3. 在 `_config.yml` 的 `comments` 中填入 `provider: giscus` 及对应参数

## 5. 自定义导航标签

`_tabs/` 目录下的每个 `.md` 文件都会成为一个顶部导航标签，按需增删即可。
