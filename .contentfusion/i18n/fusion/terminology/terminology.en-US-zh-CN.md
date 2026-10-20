# Terminology: en-US → zh-CN

## Do not translate

| Term | Kind | Note |
|---|---|---|
| `.git` | code |  |
| `<context>` | code |  |
| agent-instructions.md | code |  |
| AI Positron | product |  |
| Alt | name |  |
| Amazon S3 | brand |  |
| API | acronym | API key = API 密钥 (UI). |
| CALS | acronym |  |
| conref | code |  |
| Content Fusion | product |  |
| Contents | other |  |
| diff | other |  |
| DITA | acronym |  |
| DITA map | name | Keep in English with spaces around it (上下文 DITA map). No plural: 多个 DITA map. The UI renders it DITA 地图/映射/文件夹: copy those only inside quoted UI labels. |
| DNS | acronym |  |
| EditContext | code |  |
| GitHub | brand |  |
| Google | brand |  |
| `href` | code |  |
| jgit | code |  |
| JSON | acronym |  |
| Linux | product |  |
| main | code |  |
| Microsoft Entra ID | product |  |
| Netlify | brand |  |
| OIDC | acronym |  |
| OK | other | The zh-CN UI translates the button (确认, also 确定). When the guide names the button, copy the UI string of that dialog. |
| Okta | brand |  |
| Oxygen | brand |  |
| Oxygen AI Positron for Content Fusion | product |  |
| Oxygen Content Fusion | product |  |
| Oxygen Content Fusion (Cloud) | product |  |
| Oxygen Content Fusion Connector | product |  |
| Oxygen Content Fusion Enterprise Server | product |  |
| Oxygen Styles Basket | product |  |
| Oxygen XML Author | product |  |
| Oxygen XML Editor | product |  |
| Oxygen XML Web Author | product |  |
| PDF | acronym |  |
| read_repository | code |  |
| SME | acronym | Keep as role abbreviation. Spelled out = 主题专家 (k0704). SME seats = SME 席位. |
| TermBase eXchange | name |  |
| translation-index.xml | code |  |
| Verifone | brand |  |
| Web Author | product |  |
| WebHelp | product |  |
| write_repository | code |  |
| `xml:lang` | code |  |

## Terms

| Source | Target | Context | Details |
|---|---|---|---|
| accept | 接受 | approve a tracked change | pos: verb; ex: accepted changes → 已接受的更改 |
| admin | 管理员 | organization admin role | pos: noun; ex: Users with the Admin role can… → 具有管理员角色的用户可以…; note: Same word as administrator (k0015). One UI label leaves Admin untranslated. |
| administration page | 管理页面 | Enterprise server admin web interface | pos: noun |
| advanced search | 高级搜索 | search using query syntax | pos: noun |
| AI functionality | AI 功能 | AI features of the product | pos: noun; note: Same wording as AI-powered feature (UI). |
| apply | 应用 | put a setting into effect | pos: verb; ex: The changes are applied immediately. → 更改会立即生效。; note: Passive "is applied" often reads better as 生效. |
| authentication | 身份验证 | verifying user identity | pos: noun; deprecated: 认证; note: UI majority 身份验证 (10 vs 4). |
| author | 作者 | content author role | pos: noun; ex: All Content Authors in your organization → 您组织中的所有内容作者; note: Role name (UI). Content Author = 内容作者. |
| auto-renewal | 自动续订 | automatic subscription renewal | pos: noun; admitted: 自动续费 (when quoting the Stop auto-renewal label); ex: enable or disable auto-renewal → 启用或禁用自动续订; note: UI majority 自动续订, consistent with renew = 续订 |
| billing | 账单 | invoicing and payments | pos: noun; note: UI wording (Billing = 账单). Billing period = 计费周期. |
| branch | 分支 | Git branch | pos: noun; ex: select a different branch → 选择其他分支 |
| breadcrumb | 面包屑导航 | navigation path trail | pos: noun; ex: from the main navigation and the breadcrumb → 通过主导航和面包屑导航 |
| bring into workspace | 导入工作区 | add job results to the workspace | pos: verb; ex: bring the translated files into your workspace → 将翻译后的文件导入工作区; note: UI label Bring into workspace = 导入工作区. Badge Integrated = 已导入. |
| build | 构建 | deliverable generation run | pos: noun; deprecated: 生成; ex: build or tool configuration → 构建或工具配置; note: UI minority 生成 (Build ID). Build job = 构建作业. |
| build | 构建 | produce output from a deliverable | pos: verb; deprecated: 生成; ex: Build the deliverable. → 构建可交付物。 |
| change | 更改 | modification of content | pos: noun; deprecated: 变更; ex: Then commit the change. → 然后提交该更改。; note: UI majority 更改. Use 修改 only for modify/modified. |
| client ID | 客户端 ID | OIDC application identifier | pos: noun; note: UI wording. |
| client secret | 客户端密钥 | OIDC application secret | pos: noun; note: UI wording. |
| close | 关闭 | end the review phase of a task | pos: verb; ex: The owner closes the review. → 所有者关闭审阅。; note: UI label Close review reads 关闭审查: copy it as a label. |
| cloud-based | 基于云 | hosted online | pos: adj; ex: a cloud-based collaboration platform → 基于云的协作平台; note: Add 的 before a noun. |
| commit | 提交 | Git commit | pos: noun; ex: when pushing commits → 推送提交时; note: Noun and verb are the same word. Count with 次 (一次提交). |
| commit | 提交 | record changes in Git | pos: verb; forbidden: 保存; ex: Review the translated files, then commit them. → 审阅翻译后的文件，然后提交这些文件。; note: Git only. Never 保存 (save). 提交 also means submit: name Git if ambiguous. |
| concurrent editing | 并发编辑 | several users editing one file | pos: noun; admitted: 多人协作编辑 (when quoting the UI option label); ex: When concurrent editing is enabled → 启用并发编辑后; note: UI split 2/2 between 并发编辑 and 多人协作编辑. |
| Content Completion Assistant | 内容补全助手 | proposal list for valid XML | pos: noun; note: Builds on content completion (k0144). |
| Content Fusion Docs Web Platform | Content Fusion Docs Web 平台 | Content Fusion public hosting service | pos: name; case: keep; note: UI wording (Content Fusion Docs Web平台). |
| context DITA map | 上下文 DITA map | map used to resolve keys in a review task | pos: noun; deprecated: 上下文 DITA 映射; forbidden: 上下文 DITA 文件夹; forbidden: 上下文 DITA 地图; ex: if the task owner specified a context DITA map → 如果任务所有者指定了上下文 DITA map; note: DITA map stays in English (DNT). UI 上下文DITA文件夹 is wrong (folder). |
| context publication | 上下文出版物 | publication used to resolve keys | pos: noun; deprecated: 上下文出版; ex: keys defined in the context publication → 在上下文出版物中定义的键; note: UI majority. Builds on publication (k0532). |
| cross reference | 交叉引用 | DITA xref link | pos: noun; ex: insert a cross reference link → 插入交叉引用链接 |
| data handling | 数据处理 | how customer data is processed | pos: noun |
| demote | 降级 | move a map node down one level | pos: verb; ex: a demoted chapter is changed to a topicref → 降级后的章节会变为 topicref; note: Map tree action\; opposite promote = 升级. |
| disk usage | 磁盘使用量 | disk space consumed by projects | pos: noun; note: UI label Disk Usage = 磁盘使用量. |
| DITA context | DITA 上下文 | map and DITAVAL used to resolve keys | pos: noun; ex: a DITA context cannot be selected → 无法选择 DITA 上下文; note: UI label DITA Context = DITA上下文. |
| DITA specialization | DITA 特化 | custom DITA element types | pos: noun; deprecated: DITA 专门化; ex: rules for your own DITA specializations → 适用于您自己的 DITA 特化的规则 |
| domain name | 域名 | DNS name of the server | pos: noun |
| download | 下载 | copy from the server to the computer | pos: verb; ex: To download the task → 要下载任务 |
| due date | 到期日 | deadline of a review task | pos: noun; deprecated: 截止日期; ex: when the due date is within 3 days → 当到期日在 3 天内时; note: UI labels use 到期日. Notification e-mails use 截止日期. |
| edit | 编辑 | change content | pos: verb; note: UI wording. |
| editor | 编辑器 | editing area of the application | pos: noun; ex: the current document open in the editor → 编辑器中当前打开的文档; note: One UI label leaves Editor in English. |
| email | 电子邮件 | electronic message | pos: noun; admitted: 邮件 (in compounds, e.g. 邮件通知); deprecated: 邮箱; ex: The e-mail messages generated by the server → 服务器生成的电子邮件; id: c-0101; note: 邮箱 means mailbox or e-mail address. |
| execution log | 执行日志 | output record of a job | pos: noun |
| execution status | 执行状态 | state of pending or running builds | pos: noun |
| expiration | 到期 | end of a subscription period | pos: noun; ex: before the expiration date → 在到期日期之前; note: UI: 订阅到期通知. Status Expired = 已过期. |
| file locking | 文件锁定 | exclusive file access | pos: noun; note: Builds on lock = 锁定\; unlock = 解锁. |
| filter | 筛选条件 | criterion that restricts results | pos: noun; deprecated: 过滤器; ex: set other filters to narrow the results → 设置其他筛选条件以缩小结果范围; note: UI: Filters = 筛选, 未配置筛选条件. DITAVAL filter uses 过滤. |
| filter | 筛选 | exclude content or list items | pos: verb; admitted: 过滤 (DITAVAL content filtering); note: UI majority 筛选 (10 vs 3) for lists. |
| framework | 框架 | document type configuration package | pos: noun; note: Oxygen document type framework. UI: 自定义框架. |
| Getting Started | 入门 | introductory chapter | pos: phrase; deprecated: 快速入门; ex: Getting Started with Translation → 翻译入门; note: UI: Getting Started = 入门. |
| Git account | Git 帐户 | stored Git credentials in Content Fusion | pos: noun; deprecated: Git 账户; note: UI majority 帐户 (35 vs 20 账户). |
| glossary | 术语表 | list of terms and definitions | pos: noun |
| help menu | 帮助菜单 | menu with documentation links | pos: noun; note: UI: Help = 帮助. |
| Hydraulic Gear Pump | 液压齿轮泵 | name of a sample project | pos: name; note: UI sample name: 液压齿轮泵（多语言）. |
| incremental translation | 增量翻译 | translating only new or changed files | pos: noun |
| integrated | 已集成 | task status after integration | pos: adj; deprecated: 已整合; forbidden: 已导入; ex: the owner marks the task as integrated → 所有者将任务标记为已集成; note: UI: Mark as integrated = 标记为已集成. 已导入 means imported. |
| internationalization | 国际化 | designing content for multiple languages | pos: noun |
| join | 加入 | become a member of an organization | pos: verb; note: UI: 加入组织. |
| join | 合并 | combine table cells | pos: verb; ex: join table cells → 合并表格单元格; note: Table cells only. Same word as Git merge: keep 单元格 in the phrase. |
| keyword | 关键字 | DITA keyword or search term | pos: noun; deprecated: 关键词; note: DITA <keyword> or search term. |
| license | 许可证 | right to use the product | pos: noun; ex: If you already have a license key → 如果您已有许可证密钥 |
| license allocation | 许可证分配 | distribution of license seats to users | pos: noun; note: Builds on license = 许可证, assign = 分配. |
| link | 关联 | connect a project to a Git repository | pos: verb; ex: that repository is automatically linked → 该仓库会自动关联 |
| localization | 本地化 | adapting content for a locale | pos: noun |
| lock | 锁 | exclusive edit hold on a file | pos: noun; ex: until the lock is released → 直到锁被释放 |
| lock | 锁定 | prevent others from editing | pos: verb; ex: your account is temporarily locked → 您的帐户已被暂时锁定 |
| log in | 登录 | authenticate to the application | pos: verb; forbidden: 登陆; ex: During the lockout period, logging in is rejected. → 在锁定期间，登录将被拒绝。; note: 登陆 is a common misspelling. |
| main CSS style | 主 CSS 样式 | base CSS layer for the editor | pos: noun |
| main style | 主样式 | base CSS style of a document | pos: noun |
| map reference | 映射引用 | DITA mapref | pos: noun; note: DITA mapref. Builds on map = 映射. |
| merge | 合并 | Git merge operation | pos: noun; ex: If the merge succeeds → 如果合并成功 |
| merge | 合并 | integrate changes | pos: verb; forbidden: 集成; ex: select an existing branch to merge into the current branch → 选择要合并到当前分支的现有分支; note: UI minority 集成 collides with integrate (k0325). |
| organization | 组织 | tenant grouping users and projects | pos: noun; ex: Users can belong to multiple organizations. → 用户可以属于多个组织。 |
| Organization Administrator | 组织管理员 | organization-level admin role | pos: noun; ex: You must have the Organization Administrator role. → 您必须具有组织管理员角色。; note: UI wording (组织管理员总数). |
| owner | 所有者 | user who manages a task or project | pos: noun; deprecated: 拥有者; deprecated: 负责人; ex: You can add another owner to an existing task. → 您可以为现有任务添加其他所有者。; note: Role label Owner = 所有者 (UI). |
| Oxygen Data Directory | Oxygen 数据目录 | Oxygen user data folder | pos: noun; ex: located inside your Oxygen Data Directory → 位于您的 Oxygen 数据目录中 |
| password | 密码 | login secret | pos: noun |
| pending | 待处理 | job not yet started | pos: adj; admitted: 待定 (for people, as in the UI labels Pending Reviewer, Pending Member); deprecated: 等待中; forbidden: 暂停; ex: builds that are pending → 待处理的构建; note: UI majority 待处理. 暂停 means paused. |
| pending reviewer | 待定审阅者 | invited reviewer without an account yet | pos: noun; ex: listed as a Pending Reviewer until they sign up → 在注册之前显示为待定审阅者; note: UI label. |
| personal workspace | 个人工作区 | user's own working copy of a project | pos: noun; deprecated: 个人工作空间; ex: in the header of the personal workspace → 在个人工作区的标题栏中 |
| plugin | 插件 | software extension | pos: noun; ex: Content Fusion offers a plugin → Content Fusion 提供了一个插件 |
| profile | 个人资料 | user profile page | pos: noun; admitted: 简介 (when quoting the Profile menu label); note: UI: profile page = 个人资料页面. |
| profile settings | 个人资料设置 | user profile preferences page | pos: noun |
| project | 项目 | Content Fusion project | pos: noun; ex: When a project is open → 打开项目后 |
| project settings | 项目设置 | configuration of a project | pos: noun |
| promote | 提升 | move a map node up one level | pos: verb; ex: a promoted topicref is changed to a chapter → 提升后的 topicref 会变为 chapter; note: Demote = 降低. Element names stay in English. |
| publication | 出版物 | DITA map plus optional DITAVAL | pos: noun; deprecated: 发布; deprecated: 出版; ex: a translated publication → 已翻译的出版物; note: UI majority 出版物. 发布 is reserved for publish/publishing. |
| publication map | 出版物映射 | DITA map of a publication | pos: noun; note: If the source says DITA map, keep DITA map (DNT). |
| pull | 拉取 | Git, bring remote commits into the workspace | pos: verb; ex: Pull the incoming commits. → 拉取传入提交。 |
| Quick Fix | 快速修复 | automatic fix for a validation problem | pos: noun; ex: Quick Fix proposals → 快速修复建议 |
| quick start | 快速入门 | first steps guide | pos: noun; ex: Quick Start Guide → 快速入门指南 |
| re-review | 重新审阅 | request that reviewers review again | pos: noun; deprecated: 重新审核; deprecated: 重新审查; ex: requested re-review for the task → 已请求重新审阅该任务; note: UI button Request re-review = 请求重新审阅. |
| re-run | 重新运行 | start a new job from an existing one | pos: verb; ex: To re-run a translation job → 要重新运行翻译作业; note: UI label Re-run. |
| reactivation | 重新激活 | restoring a suspended organization | pos: noun; ex: Automatic reactivation → 自动重新激活 |
| refresh | 刷新 | reload displayed data | pos: verb |
| reject | 拒绝 | refuse a tracked change | pos: verb; ex: by accepting or rejecting them → 通过接受或拒绝这些更改 |
| relationship table | 关系表 | DITA reltable | pos: noun; ex: Inserts an empty relationship table. → 插入一个空关系表。 |
| renewal | 续订 | extension of a subscription | pos: noun; deprecated: 续费; ex: The renewal date. → 续订日期。; note: UI label Stop auto-renewal reads 停止自动续费. |
| reply | 回复 | answer to a comment | pos: noun; ex: When you add a reply to a comment thread → 当您在评论线程中添加回复时 |
| repository | 仓库 | Git repository | pos: noun; deprecated: 存储库; ex: in your project's repository → 在您项目的仓库中; note: UI majority 仓库 (43 vs 28). Git repository = Git 仓库. |
| request access | 请求访问 | ask the owner for access | pos: phrase; note: UI label Request access. |
| reuse | 重用 | DITA content reuse | pos: noun; deprecated: 复用; ex: showcases reuse and profiling → 展示重用和条件化处理; note: UI majority 重用 (内容重用). |
| review | 审阅 | the act or process of reviewing | pos: noun; deprecated: 审查; deprecated: 审核; deprecated: 评审; ex: They are added to your workspace for review. → 它们会被添加到您的工作区以供审阅。; note: UI is split. 审阅 matches the main labels (审阅任务, 审阅者). |
| review | 审阅 | check content and suggest changes | pos: verb; deprecated: 审查; deprecated: 审核; deprecated: 评审; ex: Reviewers review the topics. → 审阅者审阅主题。 |
| review | 查看 | look over settings, usage or results | pos: verb; forbidden: 审阅; ex: Review the storage usage. → 查看存储使用情况。; note: UI wording. Use 检查 when the source asks to verify something. |
| review status | 审阅状态 | lifecycle state of a review task | pos: noun; deprecated: 审查状态; note: UI label Review Status = 审阅状态. |
| review task | 审阅任务 | unit of review work in Content Fusion | pos: noun; deprecated: 审查任务; deprecated: 审核任务; deprecated: 评审任务; ex: Completing and Managing Review Tasks → 完成和管理审阅任务; note: UI labels review task, Review Tasks and Create Review Task use 审阅任务. |
| review task dashboard | 审阅任务仪表板 | start page of a review task | pos: noun; note: UI: Dashboard = 仪表板. |
| review task header | 审阅任务标题栏 | top bar of an open review task | pos: noun; ex: In the review task header, click Share. → 在审阅任务标题栏中，单击共享。 |
| reviewer | 审阅者 | person who reviews a task | pos: noun; admitted: 审核人 (when quoting the Reviewer role label); deprecated: 审核员; deprecated: 审阅人; ex: to provide context for the reviewers → 为审阅者提供上下文; note: UI majority 审阅者 (31 rows). |
| reviewer status | 审阅者状态 | finalization state of one reviewer | pos: noun; ex: individual reviewer status → 各审阅者的状态 |
| running | 运行中 | job currently being processed | pos: adj; ex: jobs that are already running or finished → 已在运行中或已完成的作业; note: UI status label. |
| save | 保存 | write changes to disk | pos: verb; ex: all the modified topics are also saved → 所有修改过的主题也会被保存 |
| search syntax | 搜索语法 | rules for writing search queries | pos: noun; note: UI label Search syntax = 搜索语法. |
| share | 共享 | give others access to a task | pos: verb; admitted: 分享 (only when quoting the Share button label); ex: share the task with reviewers → 与审阅者共享任务; note: UI majority 共享 (Share Task = 共享任务). |
| sharing settings | 共享设置 | task access configuration | pos: noun; note: UI label Sharing settings. |
| sign up | 注册 | create an account | pos: verb; ex: until they sign up and open the task → 直到他们注册并打开任务 |
| single sign-on | 单点登录 | login through an identity provider | pos: noun; deprecated: 单一登录; note: UI majority 单点登录 (OIDC 单点登录). |
| Smart Paste | 智能粘贴 | paste that keeps style and structure | pos: noun |
| status | 状态 | state of a task, file or subscription | pos: noun; ex: Each source file has one of three statuses → 每个源文件都处于三种状态之一 |
| storage usage | 存储使用情况 | amount of storage consumed | pos: noun; note: UI wording (查看存储使用情况). |
| style guide | 风格指南 | document with writing rules | pos: noun; deprecated: 样式指南; note: 样式 suggests CSS styles. |
| subscript | 下标 | lowered text formatting | pos: noun |
| subscription | 订阅 | paid or trial plan | pos: noun; ex: How to Buy an Organization Subscription → 如何购买组织订阅 |
| subscription status | 订阅状态 | state of an organization subscription | pos: noun |
| success rate | 成功率 | share of successful builds | pos: noun; note: UI label Success rate. |
| superscript | 上标 | raised text formatting | pos: noun |
| system requirements | 系统要求 | minimum environment needed | pos: noun |
| table | 表格 | rows and columns in a document | pos: noun |
| target language | 目标语言 | language translated into | pos: noun; note: UI label Target Languages. |
| task activity | 任务活动 | messages and changes in a task | pos: noun; note: UI wording. |
| task files | 任务文件 | files included in a review task | pos: noun; note: No plural form: same as task file (k0733). |
| Tasks Manager | 任务管理器 | Oxygen view listing review tasks | pos: name; note: UI: Content Fusion任务管理器. One UI string keeps Tasks Manager in English. |
| terminology | 术语 | set of approved terms | pos: noun |
| topic reference | 主题引用 | DITA topicref | pos: noun |
| track changes | 跟踪更改 | recording edits as reviewable changes | pos: noun; ex: Track changes always on. → 始终开启跟踪更改。; note: UI wording. Feature name\; compare change tracking 更改跟踪 (k0098). |
| translation | 翻译 | translating content or its result | pos: noun |
| translation agency | 翻译机构 | external translation company | pos: noun |
| translation index | 翻译索引 | file recording translated source versions | pos: noun; ex: The translation index is a single file. → 翻译索引是单个文件。 |
| translation instructions | 翻译指令 | guidance given to the translation agent | pos: noun |
| tree editor | 树编辑器 | DITA map tree editing view | pos: noun; ex: Its map is displayed in the tree editor. → 其映射显示在树编辑器中。 |
| upgrade | 升级 | increase of subscription seats or plan | pos: noun; ex: After you complete an upgrade → 完成升级后 |
| upgrade | 升级 | move to a newer product build | pos: verb |
| upload | 上传 | transfer of files to a server | pos: noun; deprecated: 上载; ex: If the upload is interrupted → 如果上传中断 |
| upload | 上传 | send files to the server | pos: verb; deprecated: 上载; ex: Content Authors who will be uploading tasks → 将要上传任务的内容作者; note: UI majority 上传. 上载 appears in plugin strings. |
| user guide | 用户指南 | this documentation | pos: noun; note: UI label User Guide. |
| user interface | 用户界面 | application screens | pos: noun |
| username | 用户名 | account login name | pos: noun |
| validation | 验证 | checking files against rules | pos: noun; deprecated: 校验 |
| version | 版本 | saved state of a file | pos: noun |
| visibility | 可见性 | public or private access setting of a project | pos: noun; deprecated: 显示范围; note: UI label Visibility. UI minority 项目显示范围. |
| visual editor | 可视化编辑器 | WYSIWYG editing view | pos: noun; ex: to open it in the visual editor → 在可视化编辑器中打开它; note: No UI string. |
| workspace | 工作区 | user's working copy of a project | pos: noun; deprecated: 工作空间; ex: from a card in your workspace → 从您工作区中的卡片; note: UI uses 工作区 consistently. |
