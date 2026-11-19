---
description: Review and create a local commit from the requested changes without pushing or changing branches.
---

## User Input

```text
$ARGUMENTS
```

Commit only the changes relevant to the user's request. If the requested scope is unclear, ask before staging.

## Workflow

1. Inspect `git status --short`, staged and unstaged diffs, and recent commit subjects to understand scope and repository message style.
2. Review the full diff for every file intended for the commit. Leave unrelated or untracked files untouched.
3. If files are already staged, verify that every staged change belongs to this request. If there are no staged changes, stage only the reviewed paths by name; never use `git add -A` or `git add .`.
4. Review the complete staged diff. Stop and ask if it contains unrelated changes, secrets, or anything unexpected.
5. Create one local commit with a concise message matching repository history. Report its hash and summary.

## Boundaries

- Do not push, create a PR, merge, switch branches, delete branches, reset, clean, stash, or discard changes.
- Do not include unrelated changes just to make the worktree clean.
- Do not rewrite or amend existing commits.
- If a commit hook fails, report the failure and leave the staged changes intact for review.
