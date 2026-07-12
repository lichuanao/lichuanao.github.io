# 李传傲的博客

一个基于 **Jekyll + Chirpy 主题 + GitHub Pages** 的个人博客。完全免费、开源，内容用 Markdown 书写，推送即发布。

> 技术栈：Jekyll（静态站点生成）+ Chirpy（主题）+ GitHub Pages（托管/构建）。
> 日常维护只需写 Markdown 并提交，无需任何本地构建工具。

---

## 目录结构速览

```
blog/
├── _config.yml          # 站点总配置（标题、语言、社交链接等）
├── _posts/              # 文章都在这里，文件名 YYYY-MM-DD-标题.md
├── _tabs/               # 顶部导航标签（about / archives / categories / tags）
├── _data/               # 联系方式、分享按钮等配置
├── assets/img/          # 图片、头像等静态资源
├── .github/workflows/   # 自动构建+部署到 GitHub Pages 的工作流
└── Gemfile              # 主题版本（升级只改这里）
```

---

## 一、写文章（最核心的日常操作）

1. 在 `_posts/` 目录下新建文件，命名格式：

   ```
   YYYY-MM-DD-english-or-han-slug.md
   ```

   例如：`2026-07-12-my-first-post.md`

2. 文件开头写 **front matter**（至少包含标题、日期、分类、标签）：

   ```yaml
   ---
   title: 文章标题
   date: 2026-07-12 10:00:00 +0800
   categories: [技术]
   tags: [Jekyll, 教程]
   # 可选：pin: true        # 置顶
   # 可选：math: true       # 启用 KaTeX 公式
   # 可选：mermaid: true    # 启用流程图
   ---
   ```

3. 下面用 Markdown 写正文。支持的排版见示例文章
   [`2026-07-10-markdown-demo.md`](_posts/2026-07-10-markdown-demo.md)。

4. 提交并推送：

   ```bash
   git add .
   git commit -m "新增文章：xxx"
   git push
   ```

   推送后 GitHub Actions 会自动构建，几分钟内文章上线。

---

## 二、常用配置（`_config.yml`）

| 配置项 | 说明 |
|--------|------|
| `title` / `tagline` | 站点标题与副标题 |
| `lang` | 界面语言，`zh-CN` 即中文界面；换语言只改这一行 |
| `timezone` | 时区，默认 `Asia/Shanghai` |
| `url` | 站点地址，用户站点为 `https://<用户名>.github.io` |
| `github.username` | 你的 GitHub 用户名（用于链接与版权） |
| `social.name` / `social.email` | 作者名与邮箱 |
| `avatar` | 侧边栏头像路径，如 `/assets/img/avatar.svg` |
| `comments.provider` | 评论系统，推荐 `giscus`（见下文） |

---

## 三、部署到 GitHub Pages

### 方式 A：用户站点（推荐，地址最干净）

1. 在 GitHub 新建仓库，仓库名**必须**为：

   ```
   lichuanao.github.io
   ```

2. 把本目录内容推送到该仓库：

   ```bash
   git init
   git add .
   git commit -m "init blog"
   git branch -M main
   git remote add origin https://github.com/lichuanao/lichuanao.github.io.git
   git push -u origin main
   ```

3. 在仓库 **Settings → Pages → Build and deployment → Source** 选择
   **GitHub Actions**（不要选 "Deploy from a branch"）。

4. 等待 Actions 跑完（Actions 标签页可见进度），访问
   `https://lichuanao.github.io` 即可。

### 方式 B：项目站点（任意仓库名）

仓库名随意（如 `blog`），但需在 `_config.yml` 设置：

```yaml
baseurl: "/blog"   # 改成你的仓库名（带斜杠前缀）
url: "https://lichuanao.github.io"
```

访问地址为 `https://lichuanao.github.io/blog`。

---

## 四、升级主题

主题版本固定在 `Gemfile`：

```ruby
gem "jekyll-theme-chirpy", "~> 7.6"
```

把版本号调大后提交推送，GitHub Actions 会用新版本重新构建。
建议偶尔升级以获得新功能与安全修复。

---

## 五、可选增强

- **评论**：推荐 [giscus](https://giscus.app)（免费、基于 GitHub Discussions）。
  在 `_config.yml` 的 `comments` 填 `provider: giscus` 及对应参数。
- **访问统计**：在 `analytics` 中填 Umami / Google Analytics 等的 id。
- **自定义域名**：在仓库 Settings → Pages → Custom domain 填写，
  并把 `url` 改为你的域名。
- **本地预览**（可选）：安装 Ruby 后运行
  `bundle install` 再 `bundle exec jekyll s`，访问 `http://localhost:4000`。

---

## 六、常见问题

- **推送后网站没更新？** 去仓库 Actions 看构建是否失败；常见原因是
  Markdown 的 front matter 格式不对（日期必须是 `YYYY-MM-DD HH:MM:SS +0800`）。
- **图片怎么放？** 放到 `assets/img/`，文中用 `/assets/img/xxx.png` 引用。
- **想加导航标签？** 在 `_tabs/` 加一个 `.md` 文件即可自动出现。
