# Git Client TOC Reorganization Plan

## Goal

Improve the Git Client add-on table of contents and long-page reading flow by:

- keeping the main documentation flow task-oriented;
- adding a short UI overview near the beginning;
- keeping the detailed UI reference near the end;
- improving findability for synchronization, conflicts, history, and recovery tasks;
- tracking implementation progress, decisions, and follow-up subtasks in this plan.

## Working Approach

Use this document as the implementation tracker while the reorganization is carried out.

- Mark completed items by changing `- [ ]` to `- [x]`.
- Record decisions in the decision log.
- Add newly discovered subtasks to the relevant phase.
- Note any content gaps before changing the TOC structure that depends on them.

## Proposed Target TOC

1. Install and Access the Git Client
2. Git Client Interface Overview
3. Start Working with Repositories
4. Review, Stage, and Commit Changes
5. Synchronize with Remote Repositories
6. Resolve Conflicts and Interrupted Operations
7. Work with Branches and Tags
8. Review History and Commits
9. Undo and Recover Changes
10. Use Advanced Git Workflows
11. Configure the Git Client
12. Troubleshooting
13. Git Client Interface Reference
14. Git Actions Reference
15. Resources

## Current-to-Target Direction

### Implement in the first pass

- Move the UI overview near the beginning and keep it concise.
- Keep the detailed UI reference near the end.
- Split commit/review work from synchronization.
- Split synchronization from conflict handling.
- Split branches/tags from history/commits.
- Keep the Git Actions Reference near the end.

### Defer until content review confirms enough support

- Undo and Recover Changes
- Troubleshooting
- Final placement and scope of Resources

## Phase 1: Baseline Assessment and Mapping

### Objectives

- Confirm the current TOC structure and child topic organization.
- Map current topics to the proposed target TOC.
- Identify gaps, overloaded sections, and thin sections.

### Steps

- [x] Create a current-to-target mapping table for all existing Git Client topics.
- [x] Identify which current topics can move without content changes.
- [x] Identify which topics need renaming for clearer task-oriented navigation.
- [x] Identify which sections require topic splits or new wrapper topics.
- [x] Identify whether `Undo and Recover Changes` has enough existing content to become a top-level section.
- [x] Identify whether `Troubleshooting` has enough existing content to become a top-level section.

### Current-to-Target Mapping

| Current Topic / Section | Current Parent | Proposed Target Section | Action Needed | Notes |
|---|---|---|---|---|
| `git-addon-install-and-access-the-git-client.dita` | top level | Install and Access the Git Client | Move as-is | Already aligned with target structure. |
| `git-addon-quick-installation.dita` | Install and Access the Git Client | Install and Access the Git Client | Move as-is | Keep under installation/access. |
| `git-addon-manual-installation.dita` | Install and Access the Git Client | Install and Access the Git Client | Move as-is | Keep under installation/access. |
| `git-addon-authentication.dita` | Install and Access the Git Client | Install and Access the Git Client | Move as-is | Keep under installation/access. |
| `git-addon-interface-overview.dita` | late UI/reference area | Git Client Interface Overview | Move earlier; tighten scope | Keep concise and orientation-focused. |
| `git-addon-start-working-with-repositories.dita` | top level | Start Working with Repositories | Move as-is | Already aligned with target structure. |
| `git-addon-cloning-a-repository.dita` | Start Working with Repositories | Start Working with Repositories | Move as-is | No content change needed. |
| `git-addon-making-an-oxygen-project-a-git-repository.dita` | Start Working with Repositories | Start Working with Repositories | Move as-is | No content change needed. |
| `git-addon-selecting-a-working-copy.dita` | Start Working with Repositories | Start Working with Repositories | Move as-is | No content change needed. |
| `git-addon-stage-review-and-synchronize-changes.dita` | top level | Split across multiple workflow sections | Split parent/wrapper topic | Current parent is overloaded. |
| `git-addon-unstaged-files-area.dita` | Review/Stage/Sync | Review, Stage, and Commit Changes | Keep in workflow section | Already task-oriented; title does not need renaming. |
| `git-addon-comparing-changes.dita` | Review/Stage/Sync | Review, Stage, and Commit Changes | Move as-is | Fits local review workflow. |
| `git-addon-staged-files-area.dita` | Review/Stage/Sync | Review, Stage, and Commit Changes | Keep in workflow section | Already task-oriented; title does not need renaming. |
| `git-addon-committing.dita` | Review/Stage/Sync | Review, Stage, and Commit Changes | Move as-is | Fits local commit workflow. |
| `git-addon-exclude-files-from-version-control.dita` | Review/Stage/Sync | Review, Stage, and Commit Changes | Move as-is | Best kept near local change preparation. |
| `git-addon-push-pull.dita` | Review/Stage/Sync | Synchronize with Remote Repositories | Move to new section | Clear separation from local commit workflow. |
| `git-addon-resolve-file-conflicts.dita` | Review/Stage/Sync | Resolve Conflicts and Interrupted Operations | Move to new section | Good anchor topic for conflict/interrupted-operation section. |
| `git-addon-ai-assisted-conflict-resolution.dita` | Resolve File Conflicts | Resolve Conflicts and Interrupted Operations | Move with parent | Keep under conflict-resolution topic. |
| `git-addon-track-file-conflicts.dita` | Resolve File Conflicts | Resolve Conflicts and Interrupted Operations | Move with parent | Keep under conflict-resolution topic. |
| `git-addon-abort-restart-continue-git-operation.dita` | Resolve File Conflicts | Resolve Conflicts and Interrupted Operations | Move with parent for first pass | Recovery-related, but not enough to justify a separate top-level section yet. |
| `git-addon-review-commits.dita` | Review/Stage/Sync | Review History and Commits | Move to history section | Better grouped with commit/history review. |
| `git-addon-explaining-commits-with-ai.dita` | Review/Stage/Sync | Review History and Commits | Move to history section | Depends on commit/history context. |
| `git-addon-manage-branches-tags-and-history.dita` | top level | Split into Branches/Tags and History/Commits | Split parent/wrapper topic | Current parent combines distinct user goals. |
| `git-addon-switching-between-local-branches.dita` | Branches/Tags/History | Work with Branches and Tags | Move as-is | Branch workflow topic. |
| `git-addon-check-out-a-branch.dita` | Branches/Tags/History | Work with Branches and Tags | Move as-is | Branch workflow topic; keep Git term “checkout” as one word in prose. |
| `git-addon-creating-tags.dita` | Branches/Tags/History | Work with Branches and Tags | Move as-is | Tag workflow topic. |
| `git-addon-blame.dita` | Branches/Tags/History | Review History and Commits | Move to history section | Better grouped with authorship/history review. |
| `git-addon-use-advanced-workflows.dita` | top level | Use Advanced Git Workflows | Move as-is | Already aligned with target structure. |
| `git-addon-stashing-files.dita` | Advanced Workflows | Use Advanced Git Workflows | Move as-is | No content change needed. |
| `git-addon-working-with-submodules.dita` | Advanced Workflows | Use Advanced Git Workflows | Move as-is | No content change needed. |
| `git-addon-working-with-worktrees.dita` | Advanced Workflows | Use Advanced Git Workflows | Move as-is | No content change needed. |
| `git-addon-working-with-large-files-in-git.dita` | Advanced Workflows | Use Advanced Git Workflows | Move as-is | No content change needed. |
| `git-addon-actions-shared.dita` | Interface Overview | Git Client Interface Reference | Likely move to late reference section | Decide in Phase 2 whether to keep as separate intro/reference topic. |
| `git-addon-git-staging-view-interface.dita` | Interface Overview | Git Client Interface Reference | Move to late reference section | Detailed UI reference topic. |
| `git-addon-showing-the-repository-history.dita` | Interface Overview | Git Client Interface Reference | Keep in UI reference for first pass | Current content is primarily view description and action inventory, not workflow guidance. |
| `git-addon-git-branch-manager.dita` | Interface Overview | Git Client Interface Reference | Move to late reference section | Detailed UI reference topic. |
| `git-addon-git-menu.dita` | Interface Overview | Git Client Interface Reference | Move to late reference section | Detailed UI reference topic. |
| `git-actions-in-other-views-editors.dita` | Interface Overview | Git Client Interface Reference | Move to late reference section | Detailed UI/reference topic. |
| `git-addon-configure-the-git-client-and-find-reference-information.dita` | top level | Configure the Git Client | Keep as configuration parent; narrow scope | Title/content already say Configure the Git Client; remove “reference information” from structural role. |
| `git-addon-validation.dita` | Configure the Git Client | Configure the Git Client | Move as-is | Configuration-related. |
| `git-addon-preferences.dita` | Configure the Git Client | Configure the Git Client | Move as-is | Configuration-related. |
| `git-addon-customizing-ai-support.dita` | Preferences | Configure the Git Client | Move as-is | Configuration-related child topic. |
| `git-addon-editor-variables.dita` | Configure the Git Client | Configure the Git Client | Move as-is | Configuration/reference topic still fits configuration section. |
| `git-addon-resources.dita` | Configure the Git Client | Resources | Move to separate support section later if retained | Current placement under configuration is weak if Resources remains top-level. |
| `git-addon-actions-reference.dita` | top level | Git Actions Reference | Keep near end | Already aligned with target structure. |
| `git-addon-actions-repository-working-copy.dita` | Actions Reference | Git Actions Reference | Move with parent | No content change needed. |
| `git-addon-actions-review-stage-commit.dita` | Actions Reference | Git Actions Reference | Move with parent | No content change needed. |
| `git-addon-actions-synchronize-conflicts.dita` | Actions Reference | Git Actions Reference | Move with parent | No content change needed. |
| `git-addon-actions-branches-history.dita` | Actions Reference | Git Actions Reference | Move with parent | No content change needed. |
| `git-addon-actions-advanced.dita` | Actions Reference | Git Actions Reference | Move with parent | No content change needed. |
| `git-addon-actions-configuration.dita` | Actions Reference | Git Actions Reference | Move with parent | No content change needed. |

### Findings

- The current map already contains most of the needed content; the main issue is grouping, not missing core topics.
- Two current top-level workflow parents are overloaded:
  - `git-addon-stage-review-and-synchronize-changes.dita`
  - `git-addon-manage-branches-tags-and-history.dita`
- The early/late UI split can be implemented mostly by reordering and narrowing scope rather than by creating many new topics.
- `git-addon-showing-the-repository-history.dita` currently behaves as a UI reference topic because it explains the Git History view structure, panes, toolbar, and context-menu actions in detail.
- `git-addon-unstaged-files-area.dita` and `git-addon-staged-files-area.dita` already use task-oriented titles (`Review Modified Resources` and `Stage and Unstage Changes`), so they do not currently require renaming.
- `git-addon-configure-the-git-client-and-find-reference-information.dita` already has the title `Configure the Git Client`; the map hierarchy, not the topic title, is what currently mixes configuration and support/reference material.
- Existing content does not yet support a strong standalone top-level `Undo and Recover Changes` section. The clearest related topic is `git-addon-abort-restart-continue-git-operation.dita`, but it is still tightly tied to conflict/interrupted-operation handling.
- Existing content does not yet show a dedicated troubleshooting topic set. Troubleshooting should remain deferred unless additional support content is created.

### Dependencies and Content Gaps

- A first-pass TOC change will likely need new or revised wrapper topics for:
  - `Review, Stage, and Commit Changes`
  - `Synchronize with Remote Repositories`
  - `Resolve Conflicts and Interrupted Operations`
  - `Work with Branches and Tags`
  - `Review History and Commits`
  - `Git Client Interface Reference`
- If `Resources` remains top-level, it should be separated structurally from configuration and reviewed for whether it has enough substance to justify top-level placement.
- If a future `Undo and Recover Changes` section is added, it will likely require additional content beyond interrupted-operation handling, such as reset/revert/recovery guidance surfaced as workflow topics rather than only action-reference entries.
- If a future `Troubleshooting` section is added, it will require either new troubleshooting topics or extraction of troubleshooting guidance from existing workflow topics.


## Phase 2: Early UI Overview and Late UI Reference Strategy

### Objectives

- Reposition the UI overview near the beginning.
- Keep detailed UI topics together near the end as a reference section.
- Avoid duplicating detailed UI/action information in the early overview.

### Steps

- [x] Review `git-addon-interface-overview.dita` and define its reduced orientation scope.
- [x] Decide whether to rename the topic title to better emphasize orientation.
- [x] Add or refine links from the overview topic to the detailed UI reference topics.
- [x] Confirm the final child topics for the late `Git Client Interface Reference` section.
- [x] Decide whether `git-addon-actions-shared.dita` remains a separate child topic or is merged/reduced.

### Phase 2 Assessment

#### Reduced Orientation Scope for `git-addon-interface-overview.dita`

Keep the early overview topic short and explicitly orientation-focused. Its job should be to help users quickly understand where Git work happens, not to document each interface area in detail.

Recommended scope:

- Briefly explain that the Git Client adds several entry points in <ph keyref="product"/>.
- Keep a compact location-to-task summary showing where users go for common work:
  - Git Staging view for reviewing, staging, committing, pushing, and pulling
  - Git Branch Manager for branch work
  - Git History for commit/history inspection
  - Git menu for repository-level commands
  - contextual Git menus in Project, DITA Maps Manager, and Editor views
  - Preferences for configuration
- Add direct links from each location summary to the corresponding detailed UI reference topic.
- Avoid detailed action inventories, screenshots of every area, or repeated action tables in this early topic.
- End with a short pointer to the late `Git Client Interface Reference` and `Git Actions Reference` sections for detailed lookup.

#### Title Decision

- Keep the title `Git Client Interface Overview` for the first pass.
- Rationale: the title is already clear, concise, and acceptable if the topic content is kept lightweight and orientation-focused.
- Optional later refinement if needed: `Get Oriented in the Git Client Interface`.

#### Late `Git Client Interface Reference` Section Structure

Confirmed first-pass child topics:

- `git-addon-git-staging-view-interface.dita`
- `git-addon-showing-the-repository-history.dita`
- `git-addon-git-branch-manager.dita`
- `git-addon-git-menu.dita`
- `git-actions-in-other-views-editors.dita`

Section-level notes:

- These topics are all detailed interface/reference topics and belong together near the end.
- `git-addon-showing-the-repository-history.dita` remains here because it is primarily a view reference topic.
- `git-actions-in-other-views-editors.dita` fits the late UI reference section because it explains where contextual Git UI entry points appear.

#### Decision on `git-addon-actions-shared.dita`

- Do not keep `git-addon-actions-shared.dita` as a normal child topic in the late UI reference section.
- Reduce or merge its role instead of presenting it as a standalone navigational topic.
- Rationale:
  - It is a cross-location matrix, not a user goal or interface area.
  - It overlaps conceptually with the `Git Actions Reference` section.
  - It is useful as supporting reference material, but weak as a prominent TOC entry in a chunked long page.
- First-pass implementation preference:
  - keep the file for reuse and linking if needed,
  - but remove it from the main late UI reference child list unless a short introductory wrapper specifically needs it.

### Expected Outputs

- A concise early UI overview topic plan.
- A confirmed late UI reference section structure.

## Phase 3: Workflow Section Restructuring

### Objectives

- Improve findability by separating major Git task areas.
- Align the TOC with common user goals.

### Steps

- [x] Split `Review, Stage, Commit, and Synchronize Changes` into smaller user-goal sections.
- [x] Create or define `Synchronize with Remote Repositories` as a separate section.
- [x] Create or define `Resolve Conflicts and Interrupted Operations` as a separate section.
- [x] Split `Manage Branches, Tags, and History` into `Work with Branches and Tags` and `Review History and Commits`.
- [x] Decide whether `git-addon-showing-the-repository-history.dita` belongs in workflow content or UI reference.

### Phase 3 First-Pass Structure

#### Approved First-Pass Top-Level Order

1. Install and Access the Git Client
2. Git Client Interface Overview
3. Start Working with Repositories
4. Review, Stage, and Commit Changes
5. Synchronize with Remote Repositories
6. Resolve Conflicts and Interrupted Operations
7. Work with Branches and Tags
8. Review History and Commits
9. Use Advanced Git Workflows
10. Configure the Git Client
11. Git Client Interface Reference
12. Git Actions Reference

Deferred from the first pass:

- `Undo and Recover Changes`
- `Troubleshooting`
- separate top-level `Resources`

#### Wrapper Topic Strategy

Repurpose existing parent topics where practical, and create new wrapper topics only where the current parent scope is too broad or mismatched.

Repurpose existing parent topics:

- `git-addon-install-and-access-the-git-client.dita`
- `git-addon-start-working-with-repositories.dita`
- `git-addon-use-advanced-workflows.dita`
- `git-addon-configure-the-git-client-and-find-reference-information.dita` as the configuration parent, with structural scope narrowed in the map
- `git-addon-interface-overview.dita` as the early orientation topic
- `git-addon-actions-reference.dita` as the late actions reference parent

Create new wrapper topics:

- `Review, Stage, and Commit Changes`
- `Synchronize with Remote Repositories`
- `Resolve Conflicts and Interrupted Operations`
- `Work with Branches and Tags`
- `Review History and Commits`
- `Git Client Interface Reference`

Rationale:

- `git-addon-stage-review-and-synchronize-changes.dita` is too tightly written around a combined local-review/sync/conflict flow to reuse cleanly as one of the narrower new sections.
- `git-addon-manage-branches-tags-and-history.dita` is too broad to reuse cleanly for either the branch/tag section or the history/commit section alone.
- `git-addon-review-commits.dita` and `git-addon-explaining-commits-with-ai.dita` fit better under a dedicated history-oriented wrapper topic than under the old mixed parent.

#### Proposed First-Pass Child Grouping

- **Install and Access the Git Client**
  - `git-addon-quick-installation.dita`
  - `git-addon-manual-installation.dita`
  - `git-addon-authentication.dita`

- **Git Client Interface Overview**
  - no detailed UI child topics in this early section

- **Start Working with Repositories**
  - `git-addon-cloning-a-repository.dita`
  - `git-addon-making-an-oxygen-project-a-git-repository.dita`
  - `git-addon-selecting-a-working-copy.dita`

- **Review, Stage, and Commit Changes**
  - `git-addon-unstaged-files-area.dita`
  - `git-addon-comparing-changes.dita`
  - `git-addon-staged-files-area.dita`
  - `git-addon-committing.dita`
  - `git-addon-exclude-files-from-version-control.dita`

- **Synchronize with Remote Repositories**
  - `git-addon-push-pull.dita`

- **Resolve Conflicts and Interrupted Operations**
  - `git-addon-resolve-file-conflicts.dita`
    - `git-addon-ai-assisted-conflict-resolution.dita`
    - `git-addon-track-file-conflicts.dita`
    - `git-addon-abort-restart-continue-git-operation.dita`

- **Work with Branches and Tags**
  - `git-addon-switching-between-local-branches.dita`
  - `git-addon-check-out-a-branch.dita`
  - `git-addon-creating-tags.dita`

- **Review History and Commits**
  - `git-addon-review-commits.dita`
  - `git-addon-explaining-commits-with-ai.dita`
  - `git-addon-blame.dita`

- **Use Advanced Git Workflows**
  - `git-addon-stashing-files.dita`
  - `git-addon-working-with-submodules.dita`
  - `git-addon-working-with-worktrees.dita`
  - `git-addon-working-with-large-files-in-git.dita`

- **Configure the Git Client**
  - `git-addon-validation.dita`
  - `git-addon-preferences.dita`
    - `git-addon-customizing-ai-support.dita`
  - `git-addon-editor-variables.dita`
  - `git-addon-resources.dita` (temporary first-pass placement)

- **Git Client Interface Reference**
  - `git-addon-git-staging-view-interface.dita`
  - `git-addon-showing-the-repository-history.dita`
  - `git-addon-git-branch-manager.dita`
  - `git-addon-git-menu.dita`
  - `git-actions-in-other-views-editors.dita`

- **Git Actions Reference**
  - `git-addon-actions-repository-working-copy.dita`
  - `git-addon-actions-review-stage-commit.dita`
  - `git-addon-actions-synchronize-conflicts.dita`
  - `git-addon-actions-branches-history.dita`
  - `git-addon-actions-advanced.dita`
  - `git-addon-actions-configuration.dita`

### Implementation Notes

- `git-addon-showing-the-repository-history.dita` stays in the late UI reference section for the first pass.
- The first-pass implementation should remove `git-addon-actions-shared.dita` from the main TOC hierarchy.
- The first-pass implementation should prefer creating thin wrapper topics rather than overloading existing parent topics with mismatched summaries.
- Because the Git Client documentation publishes as one long chunked page, each new wrapper topic should include a short transition paragraph that supports continuous reading flow.

### Expected Outputs

- A revised top-level workflow structure.
- A placement decision for history-view-related content.

## Phase 4: Topic Title and Scope Refinement

### Objectives

- Improve TOC scanability.
- Make topic titles more task-oriented where appropriate.

### Steps

- [x] Review titles such as `Unstaged Files Area` and `Staged Files Area` for possible task-oriented renaming.
- [x] Identify topics whose content scope no longer matches their TOC placement.
- [x] Update parent topic titles to match the final TOC wording.
- [x] Record any title changes that require cross-reference review.

### Current Status After First-Pass Implementation

- `git-addon-unstaged-files-area.dita` and `git-addon-staged-files-area.dita` do not currently require renaming because their titles are already task-oriented.
- The new wrapper topics now match the approved first-pass TOC wording.
- The main remaining Phase 4 work is to review whether any moved child topics need scope adjustments now that they appear under narrower parent sections.
- Candidate topics for follow-up scope review:
  - `git-addon-push-pull.dita`
  - `git-addon-resolve-file-conflicts.dita`
  - `git-addon-review-commits.dita`
  - `git-addon-blame.dita`

### Phase 4 Scope Review Findings

- `git-addon-push-pull.dita` fits the new `Synchronize with Remote Repositories` section well. Its title and content are already focused on remote synchronization, and its conflict pointer now reads naturally as a handoff to the separate conflict section.
- `git-addon-resolve-file-conflicts.dita` fits the new `Resolve Conflicts and Interrupted Operations` section, but its current title is narrower than the parent section because interrupted-operation handling is delegated to child topics rather than reflected in the title. This is acceptable for the first pass.
- `git-addon-review-commits.dita` fits the new `Review History and Commits` section well. Its content is task-oriented and centered on using the `Git History` view to inspect and compare revisions.
- `git-addon-blame.dita` fits the new `Review History and Commits` section, but it is currently very thin and may benefit later from expansion or tighter integration with nearby history-review guidance.
- No immediate cross-reference cleanup is required as a result of these placements.

### Approved Title/Scope Decisions

- Keep `Push and Pull Changes` as-is.
- Keep `Resolve File Conflicts` as-is for the first pass.
- Keep `Review Commits` as-is.
- Keep `Show Blame Information` as-is for the first pass, but consider future expansion if the history section is strengthened.

### Expected Outputs

- A list of approved topic title changes.
- A list of scope adjustments needed before or after TOC edits.

## Phase 5: DITA Map and Topic Implementation

### Objectives

- Apply the approved TOC restructuring in the DITA map and supporting topics.
- Keep the chunked long-page reading flow coherent.

### Steps

- [x] Update the Git Client topic hierarchy in the DITA map or parent topic structure.
- [x] Reorder top-level child topics according to the approved first-pass TOC.
- [x] Move detailed UI topics under the late UI reference section.
- [x] Update parent topics and wrapper topics as needed to support the new structure.
- [ ] Validate all modified DITA topics and maps.

### Implementation Status

Completed:

- Created new wrapper topics for the split workflow and late UI reference sections.
- Updated `git_client_add_on.ditamap` to reflect the approved 12-section first-pass structure.
- Moved `git-addon-interface-overview.dita` earlier in the TOC and revised it into a concise orientation topic.
- Removed `git-addon-actions-shared.dita` from the main TOC hierarchy.

Pending:

- Resolve or re-check the validation-tool issue that reported generic `Premature end of file` errors despite the saved files reading back correctly.

### Expected Outputs

- Updated DITA structure reflecting the approved TOC changes.
- Validated modified files.

## Phase 6: Deferred Sections Evaluation

### Objectives

- Decide whether to add new top-level sections that require stronger content support.

### Steps

- [ ] Evaluate whether `Undo and Recover Changes` should be implemented now, deferred, or introduced incrementally.
- [ ] Evaluate whether `Troubleshooting` should be implemented now, deferred, or represented through embedded troubleshooting guidance.
- [ ] Evaluate whether `Resources` remains a top-level section or moves under another support section.

### Expected Outputs

- A decision on each deferred section.
- A list of prerequisite content tasks if any deferred section is later implemented.

## Progress Log

- 2026-07-08: Created the implementation tracking plan.
- 2026-07-08: Completed Phase 1 baseline assessment and current-to-target mapping for the existing Git Client map structure.
- 2026-07-08: Completed Phase 2 UI overview/reference assessment and confirmed the first-pass late UI reference topic set.
- 2026-07-08: Completed Phase 3 first-pass workflow restructuring plan, including wrapper-topic strategy and approved top-level order.
- 2026-07-08: Applied the first-pass DITA map restructuring, created the new wrapper topics, and revised `git-addon-interface-overview.dita` into a concise orientation topic.
- 2026-07-08: Cleaned up remaining references to `git-addon-actions-shared.dita` and completed the first-pass Phase 4 scope review for the main moved workflow/history topics.

## Decision Log

- 2026-07-08: Use a split UI strategy: a short UI overview near the beginning and a full UI reference near the end.
- 2026-07-08: Keep the Git Actions Reference near the end as a separate reference section.
- 2026-07-08: Treat `Undo and Recover Changes`, `Troubleshooting`, and the final placement of `Resources` as deferred decisions pending content review.
- 2026-07-08: Keep `git-addon-showing-the-repository-history.dita` in the late UI reference section for the first pass because its current content is primarily interface description.
- 2026-07-08: Keep `git-addon-abort-restart-continue-git-operation.dita` under conflict/interrupted-operation content for the first pass; do not create a separate top-level recovery section yet.
- 2026-07-08: Do not prioritize renaming `git-addon-unstaged-files-area.dita` or `git-addon-staged-files-area.dita` because their current titles are already task-oriented.
- 2026-07-08: Treat `Resources` as a deferred structural decision; its current placement under configuration is acceptable temporarily but weak as a final information architecture choice.
- 2026-07-08: Keep `Git Client Interface Overview` as the first-pass title and reduce the topic scope instead of renaming it now.
- 2026-07-08: Use the late `Git Client Interface Reference` section for detailed UI topics: staging view, history view, branch manager, Git menu, and contextual Git actions in other views/editors.
- 2026-07-08: Do not keep `git-addon-actions-shared.dita` as a normal child topic in the late UI reference section; keep it only as supporting reference material if still needed.
- 2026-07-08: For the first pass, omit top-level `Undo and Recover Changes`, `Troubleshooting`, and `Resources` sections and implement a 12-section structure instead.
- 2026-07-08: Create new thin wrapper topics for the split workflow and reference sections instead of reusing the two overloaded combined parent topics.
- 2026-07-08: Keep direct links from the early interface overview to the detailed UI reference topics, and also link to the late `Git Client Interface Reference` and `Git Actions Reference` sections for lookup-oriented reading.

## Open Questions

- Should `Resources` remain top-level or move under another support-oriented section?
- What is the cleanest filename strategy for the new wrapper topics so they remain consistent with existing Git Client naming conventions?
- What is causing the validation tool to report generic `Premature end of file` errors even though the saved files read back correctly?

## Additional Subtasks

- Re-check validation once the validation-tool issue is understood or the files are reopened/refreshed.
- Decide the long-term placement of `git-addon-resources.dita`.
- Consider whether the old combined wrapper topics should remain unused, be repurposed, or be removed from future maintenance paths.
- Decide whether `git-addon-actions-shared.dita` should remain as an unmapped support file, be repurposed, or be retired after link cleanup.
- Consider whether `git-addon-blame.dita` should be expanded or merged more tightly into nearby history-review guidance in a later refinement pass.
