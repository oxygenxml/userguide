# Terminology: en-US → ja-JP

## Do not translate

| Term | Kind | Note |
|---|---|---|
| `.git` | code |  |
| `<context>` | code |  |
| agent-instructions.md | code |  |
| AI Positron | product |  |
| Alt | name |  |
| Amazon S3 | brand |  |
| API | acronym | Half-width, with a space before Japanese: API キー in text (UI writes APIキー; copy UI labels as-is). |
| CALS | acronym |  |
| conref | code |  |
| Content Fusion | product |  |
| Contents | other |  |
| diff | other |  |
| DITA | acronym |  |
| DITA map | name | Keep in Latin script with a half-width space before particles: DITA map を開きます. No plural marking. UI labels write DITA マップ: copy that only in UI quotes. |
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
| OK | other | Half-width, also in the UI: OK をクリックします. |
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
| SME | acronym |  |
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
| accept | 承諾する | approve a tracked change | pos: verb; forbidden: 受け入れる; ex: accepted changes → 承諾された変更; note: Tracked changes, as in Word: 承諾 / 却下. Invitations use 同意する (UI). |
| admin | 管理者 | organization admin role | pos: noun; deprecated: アドミン; ex: Users with the Admin role can… → 管理者ロールを持つユーザーは…; note: Same word as administrator (k0015). |
| administration page | 管理ページ | Enterprise server admin web interface | pos: noun; ex: For access to the administration page → 管理ページにアクセスするには |
| advanced search | 高度な検索 | search using query syntax | pos: noun |
| AI functionality | AI 機能 | AI features of the product | pos: noun; ex: AI functionality is available through AI Positron. → AI 機能は AI Positron を通じて利用できます。 |
| apply | 適用する | put a setting into effect | pos: verb; ex: The changes are applied immediately. → 変更はすぐに適用されます。 |
| authentication | 認証 | verifying user identity | pos: noun; ex: two authentication types → 2 種類の認証タイプ |
| author | 著者 | content author role | pos: noun; deprecated: 作成者; deprecated: 作者; ex: All Content Authors in your organization → 組織内のすべてのコンテンツ著者; note: Role name (UI majority). 作成者 means creator of an item, not this role. |
| auto-renewal | 自動更新 | automatic subscription renewal | pos: noun; ex: enable or disable auto-renewal → 自動更新を有効または無効にする |
| billing | 請求 | invoicing and payments | pos: noun; ex: review billing history → 請求履歴を確認する; note: Not 課金 (= charge, k0101). |
| branch | ブランチ | Git branch | pos: noun; deprecated: 分岐; ex: select a different branch → 別のブランチを選択します |
| breadcrumb | パンくずリスト | navigation path trail | pos: noun; ex: from the main navigation and the breadcrumb → メインナビゲーションとパンくずリストから |
| bring into workspace | ワークスペースに取り込む | add job results to the workspace | pos: verb; forbidden: ワークスペースに統合する; ex: bring the translated files into your workspace → 翻訳済みファイルをワークスペースに取り込みます; note: Matches the UI button. 統合 is reserved for integrate. |
| build | ビルド | deliverable generation run | pos: noun; ex: Run a new build. → 新しいビルドを実行します。 |
| build | ビルドする | produce output from a deliverable | pos: verb; deprecated: 作成する; ex: Build the deliverable. → 成果物をビルドします。; note: UI minority uses 作成する for building a deliverable. |
| change | 変更 | modification of content | pos: noun; ex: Then commit the change. → 次に、変更をコミットします。 |
| client ID | クライアント ID | OIDC application identifier | pos: noun |
| client secret | クライアントシークレット | OIDC application secret | pos: noun |
| close | 閉じる | end the review phase of a task | pos: verb; ex: The owner closes the review. → 所有者がレビューを閉じます。; note: As in the UI action レビューを閉じる\; noun: レビューのクローズ. |
| cloud-based | クラウドベースの | hosted online | pos: adj; ex: a cloud-based collaboration platform → クラウドベースの共同作業プラットフォーム |
| commit | コミット | Git commit | pos: noun; ex: when pushing commits → コミットをプッシュするとき |
| commit | コミットする | record changes in Git | pos: verb; forbidden: 確定する; ex: Review the translated files, then commit them. → 翻訳済みファイルを確認してから、コミットします。; note: Git only. Never 確定 or 保存 (save). |
| concurrent editing | 同時編集 | several users editing one file | pos: noun; ex: When concurrent editing is enabled → 同時編集が有効になっている場合 |
| Content Completion Assistant | コンテンツ補完アシスタント | proposal list for valid XML | pos: noun |
| Content Fusion Docs Web Platform | Content Fusion Docs Web Platform | Content Fusion public hosting service | pos: name; deprecated: Content Fusion Docs Web プラットフォーム; case: keep; ex: The Content Fusion Docs Web Platform connector → Content Fusion Docs Web Platform コネクタ; note: Service name stays in English (UI majority). |
| context DITA map | コンテキスト DITA map | map used to resolve keys in a review task | pos: noun; deprecated: コンテキスト DITA マップ; ex: if the task owner specified a context DITA map → タスクの所有者がコンテキスト DITA map を指定した場合; note: DITA map stays in English. The UI writes DITA マップ: copy it only when quoting a UI label. |
| context publication | コンテキストパブリケーション | publication used to resolve keys | pos: noun; deprecated: コンテキストの公開; ex: keys defined in the context publication → コンテキストパブリケーションで定義されたキー; note: UI label Context publication = コンテキストの公開\; copy it only in UI quotes. |
| cross reference | 相互参照 | DITA xref link | pos: noun; deprecated: クロスリファレンス; ex: insert a cross reference link → 相互参照リンクを挿入する |
| data handling | データの取り扱い | how customer data is processed | pos: noun; ex: Data Handling and Your Responsibilities → データの取り扱いとお客様の責任 |
| demote | 降格する | move a map node down one level | pos: verb; ex: a demoted chapter is changed to a topicref → 降格した章は topicref に変更されます; note: Opposite: 昇格する (promote). |
| disk usage | ディスク使用量 | disk space consumed by projects | pos: noun |
| DITA context | DITA コンテキスト | map and DITAVAL used to resolve keys | pos: noun; ex: a DITA context cannot be selected → DITA コンテキストを選択できません |
| DITA specialization | DITA 特殊化 | custom DITA element types | pos: noun; ex: rules for your own DITA specializations → 独自の DITA 特殊化のルール |
| domain name | ドメイン名 | DNS name of the server | pos: noun |
| download | ダウンロードする | copy from the server to the computer | pos: verb; ex: To download the task → タスクをダウンロードするには |
| due date | 期限日 | deadline of a review task | pos: noun; deprecated: 期日; ex: when the due date is within 3 days → 期限日まで 3 日以内の場合; note: UI majority 期限日\; the short label Due date = 期日. |
| edit | 編集する | change content | pos: verb; ex: Edit the topic. → トピックを編集します。; note: Noun: 編集. |
| editor | エディター | editing area of the application | pos: noun; deprecated: エディタ; ex: the current document open in the editor → エディターで開いている現在のドキュメント |
| email | メール | electronic message | pos: noun; deprecated: 電子メール; deprecated: Eメール; ex: The e-mail messages generated by the server → サーバーが生成するメール; id: c-0101; note: email address: メールアドレス. |
| execution log | 実行ログ | output record of a job | pos: noun; ex: Every job that starts running keeps an execution log. → 実行を開始したすべてのジョブは実行ログを保持します。; note: UI label Execution log = 実行ログ. |
| execution status | 実行ステータス | state of pending or running builds | pos: noun; deprecated: 実行状態; note: UI label Execution Status = 実行ステータス. |
| expiration | 期限切れ | end of a subscription period | pos: noun; deprecated: 失効; ex: Subscription expiration impact → サブスクリプション期限切れの影響; note: Date: 有効期限 (k0249). |
| file locking | ファイルロック | exclusive file access | pos: noun; ex: How File Locking and Unlocking Work → ファイルのロックとロック解除の仕組み; note: Builds on ロック (core)\; unlock: ロック解除. |
| filter | フィルター | criterion that restricts results | pos: noun; deprecated: フィルタ; ex: set other filters to narrow the results → 他のフィルターを設定して結果を絞り込みます |
| filter | フィルタリングする | exclude content or list items | pos: verb; admitted: 絞り込む (for narrowing a displayed list); ex: to filter the files to be displayed → 表示するファイルを絞り込むには; note: DITAVAL content filtering: フィルタリングする. |
| framework | フレームワーク | document type configuration package | pos: noun; ex: the additional frameworks folders → 追加のフレームワークフォルダー |
| Getting Started | はじめに | introductory chapter | pos: phrase; deprecated: 入門; ex: Getting Started with Translation → 翻訳を始める; note: UI label Getting Started = はじめに\; 'Getting Started with X' titles: X を始める. |
| Git account | Git アカウント | stored Git credentials in Content Fusion | pos: noun; note: UI label writes Gitアカウント (no space)\; copy it as-is in UI quotes. |
| glossary | 用語集 | list of terms and definitions | pos: noun; deprecated: グロッサリー |
| help menu | ヘルプメニュー | menu with documentation links | pos: noun; note: UI Help = ヘルプ. |
| Hydraulic Gear Pump | 油圧ギアポンプ | name of a sample project | pos: name; note: Sample project name as in the UI: 油圧ギアポンプ（多言語）. |
| incremental translation | 増分翻訳 | translating only new or changed files | pos: noun; deprecated: インクリメンタル翻訳; ex: the incremental translation workflow → 増分翻訳ワークフロー |
| integrated | 統合済み | task status after integration | pos: adj; ex: the owner marks the task as integrated → 所有者がタスクを統合済みとしてマークします; note: Review task status (UI majority)\; 取り込み済み is the translation-job label. |
| internationalization | 国際化 | designing content for multiple languages | pos: noun; note: Abbreviation i18n stays as is. |
| join | 参加する | become a member of an organization | pos: verb; ex: join an existing organization → 既存の組織に参加する; note: As in the UI\; target takes に. |
| join | 結合する | combine table cells | pos: verb; forbidden: 統合する; forbidden: マージする; ex: join table cells → 表のセルを結合する; note: Table cells only\; 統合 = integrate, マージ = Git merge. |
| keyword | キーワード | DITA keyword or search term | pos: noun; note: Both the DITA keyword element and a search term. |
| license | ライセンス | right to use the product | pos: noun; ex: If you already have a license key → ライセンスキーを既にお持ちの場合 |
| license allocation | ライセンス割り当て | distribution of license seats to users | pos: noun; deprecated: ライセンス配分; ex: Manage license allocation within the organization. → 組織内のライセンス割り当てを管理します。; note: Builds on 割り当てる (core). |
| link | リンクする | connect a project to a Git repository | pos: verb; ex: that repository is automatically linked → そのリポジトリが自動的にリンクされます |
| localization | ローカリゼーション | adapting content for a locale | pos: noun; deprecated: 地域化; ex: your localization team → ローカリゼーションチーム |
| lock | ロック | exclusive edit hold on a file | pos: noun; ex: until the lock is released → ロックが解除されるまで; note: unlock: ロックを解除する. |
| lock | ロックする | prevent others from editing | pos: verb; ex: your account is temporarily locked → アカウントが一時的にロックされています |
| log in | ログインする | authenticate to the application | pos: verb; ex: During the lockout period, logging in is rejected. → ロックアウト期間中は、ログインが拒否されます。; note: Noun use: ログイン. |
| main CSS style | メイン CSS スタイル | base CSS layer for the editor | pos: noun; ex: additional CSS styles → 追加の CSS スタイル |
| main style | メインスタイル | base CSS style of a document | pos: noun |
| map reference | マップ参照 | DITA mapref | pos: noun; note: Built on マップ and 参照 (as キー参照). |
| merge | マージ | Git merge operation | pos: noun; forbidden: 統合; ex: If the merge succeeds → マージが成功した場合; note: 統合 is reserved for integration\; UI minority uses it for merge. |
| merge | マージする | integrate changes | pos: verb; forbidden: 統合する; ex: select an existing branch to merge into the current branch → 現在のブランチにマージする既存のブランチを選択する; note: 統合する is reserved for integrate. |
| organization | 組織 | tenant grouping users and projects | pos: noun; ex: Users can belong to multiple organizations. → ユーザーは複数の組織に所属できます。 |
| Organization Administrator | 組織管理者 | organization-level admin role | pos: noun; admitted: 組織の管理者 (in running text, not as the role name); ex: You must have the Organization Administrator role. → 組織管理者ロールが必要です。 |
| owner | 所有者 | user who manages a task or project | pos: noun; admitted: オーナー (project owner, matching the project UI); ex: You can add another owner to an existing task. → 既存のタスクに別の所有者を追加できます。; note: UI majority 所有者 (tasks)\; project screens often use オーナー. |
| Oxygen Data Directory | Oxygen データディレクトリ | Oxygen user data folder | pos: noun; ex: located inside your Oxygen Data Directory → Oxygen データディレクトリ内にあります; note: Oxygen stays in Latin script. |
| password | パスワード | login secret | pos: noun |
| pending | 保留中 | job not yet started | pos: adj; ex: builds that are pending → 保留中のビルド; note: Before a noun: 保留中の. |
| pending reviewer | 保留中のレビュアー | invited reviewer without an account yet | pos: noun |
| personal workspace | 個人用ワークスペース | user's own working copy of a project | pos: noun; deprecated: 個人ワークスペース; deprecated: パーソナルワークスペース; ex: in the header of the personal workspace → 個人用ワークスペースのヘッダーで |
| plugin | プラグイン | software extension | pos: noun; ex: Content Fusion offers a plugin → Content Fusion にはプラグインが用意されています |
| profile | プロフィール | user profile page | pos: noun; note: UI label Profile = プロファイル: copy only in UI quotes\; プロファイル- is for profiling. |
| profile settings | プロフィール設定 | user profile preferences page | pos: noun |
| project | プロジェクト | Content Fusion project | pos: noun; ex: When a project is open → プロジェクトが開いているとき |
| project settings | プロジェクト設定 | configuration of a project | pos: noun |
| promote | 昇格する | move a map node up one level | pos: verb; ex: a promoted topicref is changed to a chapter → 昇格した topicref は章に変更されます |
| publication | パブリケーション | DITA map plus optional DITAVAL | pos: noun; deprecated: 出版物; deprecated: 公開物; deprecated: 資料; ex: a translated publication → 翻訳済みのパブリケーション; note: Never 公開 (= publishing). |
| publication map | パブリケーションマップ | DITA map of a publication | pos: noun; deprecated: パブリケーション・マップ; note: Solid katakana compound, no ・. |
| pull | プルする | Git, bring remote commits into the workspace | pos: verb; deprecated: 取得する; ex: Pull the incoming commits. → インカミングコミットをプルします。; note: UI minority uses 取得 / 取り込む for pull. |
| Quick Fix | クイックフィックス | automatic fix for a validation problem | pos: noun; ex: Quick Fix proposals → クイックフィックスの候補 |
| quick start | クイックスタート | first steps guide | pos: noun; ex: Quick Start Guide → クイックスタートガイド |
| re-review | 再レビュー | request that reviewers review again | pos: noun; ex: requested re-review for the task → タスクの再レビューをリクエストしました |
| re-run | 再実行する | start a new job from an existing one | pos: verb; ex: To re-run a translation job → 翻訳ジョブを再実行するには; note: UI label Re-run = 再実行. |
| reactivation | 再アクティブ化 | restoring a suspended organization | pos: noun; ex: Automatic reactivation → 自動再アクティブ化 |
| refresh | 更新する | reload displayed data | pos: verb; deprecated: リフレッシュする; ex: Refresh incoming commits → インカミングコミットを更新; note: UI majority 更新\; one Refresh label uses リフレッシュ. |
| reject | 拒否する | refuse a tracked change | pos: verb; ex: by accepting or rejecting them → 承認または拒否して; note: Pairs with Accept = 承認 (UI). |
| relationship table | リレーションシップテーブル | DITA reltable | pos: noun; ex: Inserts an empty relationship table. → 空のリレーションシップテーブルを挿入します。; note: DITA reltable. |
| renewal | 更新 | extension of a subscription | pos: noun; ex: The renewal date. → 更新日。; note: Auto-renewal: 自動更新. |
| reply | 返信 | answer to a comment | pos: noun; ex: When you add a reply to a comment thread → コメントスレッドに返信を追加すると |
| repository | リポジトリ | Git repository | pos: noun; deprecated: レポジトリ; ex: in your project's repository → プロジェクトのリポジトリで |
| request access | アクセスをリクエストする | ask the owner for access | pos: phrase; deprecated: アクセスを要求する; note: UI majority (Request access = アクセスをリクエスト). |
| reuse | 再利用 | DITA content reuse | pos: noun |
| review | レビュー | the act or process of reviewing | pos: noun; ex: They are added to your workspace for review. → レビュー用にワークスペースに追加されます。 |
| review | レビューする | check content and suggest changes | pos: verb; deprecated: 校閲する; ex: Reviewers review the topics. → レビュアーがトピックをレビューします。 |
| review | 確認する | look over settings, usage or results | pos: verb; forbidden: レビューする; ex: Review the storage usage. → ストレージ使用量を確認します。; note: レビューする is reserved for content review (k0602). |
| review status | レビューステータス | lifecycle state of a review task | pos: noun; ex: The individual review statuses remain visible. → 個々のレビューステータスは引き続き表示されます。 |
| review task | レビュータスク | unit of review work in Content Fusion | pos: noun; deprecated: レビュー任務; ex: Completing and Managing Review Tasks → レビュータスクの完了と管理 |
| review task dashboard | レビュータスクのダッシュボード | start page of a review task | pos: noun; note: UI label Dashboard = ダッシュボード. |
| review task header | レビュータスクのヘッダー | top bar of an open review task | pos: noun; ex: In the review task header, click Share. → レビュータスクのヘッダーで、共有をクリックします。 |
| reviewer | レビュアー | person who reviews a task | pos: noun; deprecated: レビュー担当者; deprecated: レビューアー; ex: to provide context for the reviewers → レビュアーにコンテキストを提供するために |
| reviewer status | レビュアーステータス | finalization state of one reviewer | pos: noun; ex: individual reviewer status → 個々のレビュアーステータス |
| running | 実行中 | job currently being processed | pos: adj; ex: jobs that are already running or finished → すでに実行中または終了したジョブ |
| save | 保存する | write changes to disk | pos: verb; ex: all the modified topics are also saved → 変更されたすべてのトピックも保存されます |
| search syntax | 検索構文 | rules for writing search queries | pos: noun |
| share | 共有する | give others access to a task | pos: verb; ex: share the task with reviewers → タスクをレビュアーと共有します |
| sharing settings | 共有設定 | task access configuration | pos: noun |
| sign up | サインアップする | create an account | pos: verb; ex: until they sign up and open the task → サインアップしてタスクを開くまで |
| single sign-on | シングルサインオン | login through an identity provider | pos: noun; abbr: SSO; ex: OIDC single sign-on → OIDC シングルサインオン |
| Smart Paste | スマートペースト | paste that keeps style and structure | pos: noun |
| status | ステータス | state of a task, file or subscription | pos: noun; admitted: 状態 (when quoting UI labels that use it); ex: Each source file has one of three statuses → 各ソースファイルには 3 つのステータスのいずれかがあります |
| storage usage | ストレージ使用状況 | amount of storage consumed | pos: noun; note: UI wording. Chunk-0 example ストレージ使用量 (k0603) is acceptable in running text. |
| style guide | スタイルガイド | document with writing rules | pos: noun |
| subscript | 下付き文字 | lowered text formatting | pos: noun; ex: a sub (subscript) tag → sub（下付き文字）タグ |
| subscription | サブスクリプション | paid or trial plan | pos: noun; ex: How to Buy an Organization Subscription → 組織のサブスクリプションを購入する方法 |
| subscription status | サブスクリプションステータス | state of an organization subscription | pos: noun |
| success rate | 成功率 | share of successful builds | pos: noun |
| superscript | 上付き文字 | raised text formatting | pos: noun; ex: a sup (superscript) tag → sup（上付き文字）タグ |
| system requirements | システム要件 | minimum environment needed | pos: noun; ex: your system meets the following requirements → システムが次の要件を満たしていること |
| table | 表 | rows and columns in a document | pos: noun; admitted: テーブル (when quoting UI labels that use it); ex: Inserts a new table row with empty cells. → 空のセルを含む新しい表の行を挿入します。 |
| target language | ターゲット言語 | language translated into | pos: noun; deprecated: 対象言語; ex: for each target language → 各ターゲット言語について |
| task activity | タスクのアクティビティ | messages and changes in a task | pos: noun; deprecated: タスクの操作; note: UI section title Task activity = タスクの操作\; copy it only in UI quotes. |
| task files | タスクファイル | files included in a review task | pos: noun; note: Same as task file (k0733)\; no plural marking. |
| Tasks Manager | タスクマネージャー | Oxygen view listing review tasks | pos: name; ex: in the Tasks Manager → Content Fusion タスクマネージャーで; note: View name as in the UI (Content Fusionタスクマネージャー). |
| terminology | 用語 | set of approved terms | pos: noun; ex: approved terminology → 承認済みの用語 |
| topic reference | トピック参照 | DITA topicref | pos: noun; note: Like キー参照. |
| track changes | 変更追跡 | recording edits as reviewable changes | pos: noun; deprecated: 変更の追跡; ex: Track changes always on. → 変更追跡を常にオン。; note: Same as change tracking (k0098). |
| translation | 翻訳 | translating content or its result | pos: noun |
| translation agency | 翻訳会社 | external translation company | pos: noun |
| translation index | 翻訳インデックス | file recording translated source versions | pos: noun; ex: The translation index is a single file. → 翻訳インデックスは単一のファイルです。 |
| translation instructions | 翻訳の指示 | guidance given to the translation agent | pos: noun |
| tree editor | ツリーエディター | DITA map tree editing view | pos: noun; ex: Its map is displayed in the tree editor. → そのマップはツリーエディターに表示されます。 |
| upgrade | アップグレード | increase of subscription seats or plan | pos: noun; ex: After you complete an upgrade → アップグレードが完了したら |
| upgrade | アップグレードする | move to a newer product build | pos: verb |
| upload | アップロード | transfer of files to a server | pos: noun; ex: If the upload is interrupted → アップロードが中断された場合 |
| upload | アップロードする | send files to the server | pos: verb; ex: Content Authors who will be uploading tasks → タスクをアップロードするコンテンツ著者 |
| user guide | ユーザーガイド | this documentation | pos: noun |
| user interface | ユーザーインターフェース | application screens | pos: noun; deprecated: ユーザーインターフェイス; abbr: UI; ex: the search UI → 検索 UI; note: UI majority インターフェース (3 vs 2). |
| username | ユーザー名 | account login name | pos: noun; note: Same as user name (k0807). |
| validation | 検証 | checking files against rules | pos: noun; ex: The maximum number of validation errors → 検証エラーの最大数 |
| version | バージョン | saved state of a file | pos: noun; ex: the previous version of the file → ファイルの以前のバージョン |
| visibility | 可視性 | public or private access setting of a project | pos: noun; ex: depending on the project visibility → プロジェクトの可視性に応じて; note: UI label Visibility = 可視性. |
| visual editor | ビジュアルエディター | WYSIWYG editing view | pos: noun; deprecated: ビジュアルエディタ; ex: to open it in the visual editor → ビジュアルエディターで開くには; note: No UI string\; built on エディター. |
| workspace | ワークスペース | user's working copy of a project | pos: noun; ex: from a card in your workspace → ワークスペースのカードから |
