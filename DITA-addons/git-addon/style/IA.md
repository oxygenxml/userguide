# Git Client Add-on Documentation — Information Architecture

**Applies to:** `DITA-addons/git-addon/`
**Target version:** Git Client add-on **6.0**

Type key: **T** = task · **C** = concept · **R** = reference · **TS** = troubleshooting.
This is the authoritative build list. Filenames are final; `@id` == filename (without `.dita`).

The guide publishes as a **single page** (root `chunk="to-content"`), so the tree below is the WebHelp TOC / reading order, not a set of separately navigable pages.

---

## Navigation tree

```
git-addon.dita ............................................. C   Git Client Add-on (landing/overview)

1. git-addon-install.dita .................................. C   Install the Git Client
   git-addon-install-store.dita ............................ T   Install from the Add-ons Store
   git-addon-install-manually.dita ......................... T   Install Manually from a File or Update Site

2. git-addon-interface-overview.dita ....................... C   Tour the Git Client Interface

3. git-addon-connect-to-a-git-server.dita .................. C   Connect to a Git Server
   git-addon-authenticate-https.dita ....................... T   Authenticate over HTTPS
   git-addon-authenticate-ssh.dita ......................... T   Authenticate over SSH
   git-addon-manage-credentials.dita ....................... T   Manage Credentials              [NEW 6.0: GIT-477]

4. git-addon-set-up-a-repository.dita ...................... C   Set Up a Repository
   git-addon-clone-a-repository.dita ....................... T   Clone a Repository
   git-addon-create-a-repository.dita ...................... T   Create a Repository from Your Project
   git-addon-open-a-working-copy.dita ...................... T   Open an Existing Working Copy

5. git-addon-review-stage-commit.dita ...................... T   Review, Stage, and Commit Changes   [merges unstaged/staged/commit]
   git-addon-compare-changes.dita .......................... T   Compare Changes Before Committing
   git-addon-sign-commits.dita ............................. T   Sign Your Commits
   git-addon-commit-messages-with-ai.dita .................. T   Write Commit Messages with AI
   git-addon-exclude-files.dita ............................ T   Exclude Files from Version Control  [+GIT-456]

6. git-addon-synchronize.dita .............................. C   Synchronize with a Remote
   git-addon-push-commits.dita ............................. T   Push Commits
   git-addon-pull-changes.dita ............................. T   Pull Changes
   git-addon-fetch.dita .................................... T   Fetch from Remotes                  [+GIT-463]
   git-addon-about-merge-vs-rebase.dita .................... C   About Merge and Rebase

7. git-addon-resolve-conflicts.dita ........................ C   Resolve Conflicts
   git-addon-resolve-a-file-conflict.dita .................. T   Resolve a File Conflict
   git-addon-resolve-conflicts-with-ai.dita ................ T   Resolve Conflicts with AI           [GIT-465]
   git-addon-track-in-progress-operations.dita ............. T   Track and Finish an In-Progress Operation  [merges track+abort/restart/continue; GIT-467]

8. git-addon-branches-and-tags.dita ........................ C   Work with Branches and Tags
   git-addon-switch-branch.dita ............................ T   Switch to Another Branch
   git-addon-check-out-a-branch.dita ....................... T   Check Out a Branch                  [+GIT-459]
   git-addon-create-a-branch.dita .......................... T   Create a Branch
   git-addon-merge-rebase-cherry-pick.dita ................. T   Merge, Rebase, or Cherry-Pick
   git-addon-revert-reset.dita ............................. T   Revert or Reset Commits
   git-addon-manage-tags.dita .............................. T   Create and Manage Tags

9. git-addon-review-history.dita ........................... C   Review History and Commits
   git-addon-inspect-compare-commits.dita .................. T   Inspect and Compare Commits         [+GIT-454]
   git-addon-explain-commit-with-ai.dita ................... T   Explain a Commit with AI
   git-addon-show-blame.dita ............................... T   Show Blame                          [+GIT-489]

10. git-addon-advanced-workflows.dita ...................... C   Advanced Workflows
    git-addon-stash-changes.dita ........................... T   Stash Changes                       [+GIT-490 partial stash]
    git-addon-work-with-submodules.dita .................... T   Work with Submodules
    git-addon-work-with-worktrees.dita ..................... T   Work with Worktrees
    git-addon-work-with-large-files.dita ................... T   Work with Large Files (Git LFS)

11. git-addon-configure.dita ............................... C   Configure the Git Client
    git-addon-preferences.dita ............................. R   Git Client Preferences         (<properties>) [+GIT-491]
    git-addon-ssh-preferences.dita ......................... R   SSH Connections Preferences    (<properties>)
    git-addon-ai-preferences.dita .......................... R   AI Preferences                 (<properties>) [GIT-464]
    git-addon-validate-before-commit-push.dita ............. T   Validate Before Commit and Push
    git-addon-editor-variables.dita ........................ R   Git Editor Variables           (<properties>)

12. git-addon-reference.dita ............................... C   Reference
    git-addon-git-staging-view.dita ........................ R   Git Staging View               [+GIT-466 pull submenu]
    git-addon-git-history-view.dita ........................ R   Git History View               [+GIT-481/482/479/488]
    git-addon-git-branch-manager-view.dita ................. R   Git Branch Manager View        [+GIT-462/476]
    git-addon-git-menu-and-contextual-actions.dita ......... R   Git Menu and Contextual Actions [merges git-menu + other-views]
    git-addon-actions-reference.dita ....................... C   Git Actions Reference (parent)
      git-addon-actions-repository.dita .................... R   Repository and Working Copy Actions
      git-addon-actions-stage-commit.dita ................. R   Review, Compare, Stage, and Commit Actions
      git-addon-actions-sync-conflicts.dita ............... R   Synchronization and Conflict Actions
      git-addon-actions-branches-history.dita ............. R   Branch, Tag, History, and Blame Actions
      git-addon-actions-advanced.dita ..................... R   Advanced Repository Actions
      git-addon-actions-configuration.dita ................ R   Configuration and Preferences Actions

13. git-addon-troubleshooting.dita ......................... C   Troubleshooting
    git-addon-ts-push-rejected-behind.dita ................. TS  Push Is Rejected Because the Branch Is Behind
    git-addon-ts-authentication-fails.dita ................. TS  Authentication Fails (GitHub, GitLab, Bitbucket)
    git-addon-ts-cannot-install.dita ....................... TS  Cannot Install from the Update Site
    git-addon-ts-lfs-proxy.dita ............................ TS  Git LFS Fails Behind a Proxy
    git-addon-ts-rebase-merge-blocked.dita ................. TS  Rebase or Merge Is Blocked
    git-addon-ts-repository-outdated.dita .................. TS  Repository Shows as Outdated       [+GIT-491]

    git-addon-resources.dita ............................... R   Resources
```

## Resource-only reuse library (`lib/`) — not in the nav tree

```
lib/git-staging-uicontrols.dita       Git Staging view control labels
lib/git-history-uicontrols.dita       Git History view labels
lib/git-branch-uicontrols.dita        Git Branch Manager labels
lib/git-menu-uicontrols.dita          Git menu + contextual action labels
lib/git-preferences-uicontrols.dita   Preferences page labels
lib/git-reusables.dita                shared blocks (prereqs/notes used by >=2 topics)
```

---

## Notes on merges/splits vs. the old `git-addon/`

- **Merged:** old `unstaged-files-area` + `staged-files-area` + `committing` → one *Review, Stage, and Commit Changes* task (control detail lives in the Git Staging View reference). `track-file-conflicts` + `abort-restart-continue` → *Track and Finish an In-Progress Operation*. `git-menu` + `actions-in-other-views-editors` → *Git Menu and Contextual Actions*. `creating-tags` + Show Tags dialog → *Create and Manage Tags*.
- **Split:** old single `push-pull` → *Push Commits* / *Pull Changes* / *Fetch from Remotes* + the *About Merge and Rebase* concept.
- **New:** *Manage Credentials* (GIT-477); the whole **Troubleshooting** section (6 topics promoted from inline notes); *Sign Your Commits* and *Write Commit Messages with AI* split out of the old commit topic.
- **Retyped:** every old generic `<topic>` procedure → `<task>`; interface topics → `<reference>` (with `<properties>` for preferences/variables).

## 6.0 functionality folded in (see PLAN.md for issue detail)

Manage Credentials (GIT-477) · partial stash (GIT-490) · Hide Blame + click-to-select (GIT-489) · branch context Push/Pull (GIT-462) and Delete / Show in Branch Manager (GIT-476) · Pull submenu in Staging (GIT-466) · History tracking tooltips/labels/refs (GIT-482/479/481/488) · diff between selected revisions (GIT-454) · fetch improvements (GIT-463) · AI prompt customization (GIT-464) · AI conflict resolution (GIT-465) · in-progress operation state (GIT-467) · add files/folders to ignore (GIT-456) · checkout-from-history pre-fill (GIT-459) · outdated-branch opt-out preference (GIT-491).
