# Reviewing a change

For a pull request, branch, commit range or uncommitted work. The author's question is "did I make the interface worse?", so focus on problems the change created or worsened, and say little about older issues nearby.

## Never modify the checkout

A review is read-only. `git fetch` is fine. Never `git checkout`, `git switch`, `git stash` or `gh pr checkout`: they rewrite files the author has open. Read other refs with `git show <ref>:<path>` or `git diff`. To render a PR, use a separate worktree in a temp folder and remove it afterwards.

## 1. Resolve the scope

With a target given (`pr 482`, a branch, a range), use it. With none:

1. If the branch is ahead of its merge base with the default branch: review that range **plus** any uncommitted changes (state both counts).
2. Else if there are uncommitted changes: review those.
3. Else there's nothing to review. **Don't guess** (never silently fall back to the last commit). Offer: the open PR for this branch, the last commit (named by SHA and subject), a target the user names, or a full review of the current interface.

Record the base commit. Exclude lockfiles, snapshots, generated and vendored files, and binaries, and say what you excluded.

## 2. Expand to affected surfaces

A changed file matters where it renders. Look one step out (its direct importers); go a second step only for tokens, themes and shared primitives, which reach everything. Review at most five consumers and say how many you skipped.

## 3. Read what was removed

Regressions hide on the `-` side of the diff. Look for removed:

- `aria-*`, `role`, `alt`, `<label>`/`htmlFor`, native elements replaced by `div`/`span`
- focus styles, `outline`, `tabindex`
- `prefers-reduced-motion`, `prefers-contrast`
- `lang`, `dir`, logical properties swapped for left/right
- `text-wrap`, `line-clamp`, `overflow-wrap`, tabular figures
- tokens replaced by literals, or by a lighter colour
- user-facing strings shortened or deleted (errors, empty states, labels)

A removal is only a regression if nothing equivalent replaced it (for example, `aria-label` → `aria-labelledby` pointing at visible text; `outline` → a `box-shadow` focus ring; `role="button"` dropped because the element became a `<button>`).

```bash
git diff -U0 "$BASE" HEAD -- . ':!*.lock' ':!**/__snapshots__/**' \
  | grep -E '^-' | grep -vE '^--- ' \
  | grep -E 'aria-|role=|alt=|htmlFor|focus|outline|tabindex|prefers-|lang=|dir=|text-wrap|line-clamp|overflow-wrap|tabular'
```

## 4. Check the change does what it says

Read the PR title, description, linked issue and commits. Look for what's **missing**:

- A new variant or theme applied to some states but not all (hover, focus, active, disabled, loading, selected).
- A new component without loading, empty, error, disabled or narrow-width states.
- New strings missing from the translation files the project keeps.
- A control added to one place but not to sibling screens that already carry its peers.

Don't comment on scope creep; that's a process question.

## 5. Classify each finding

| Status | Means |
|---|---|
| **Introduced** | The change created it |
| **Regression** | The change weakened something that was correct |
| **Pre-existing** | Already there and not made worse |

Classify by cause, not location: a broken consumer of a changed token is Introduced even if that file wasn't touched. Use `git blame` on the reviewed range when unsure.

## 6. Report

Use the standard report format with:

- A scope block: target, base and head refs with short SHAs, commit and file counts, exclusions, surfaces expanded and skipped.
- A **Status** column in the findings table.
- The verdict and score cover **Introduced and Regression findings only**.
- At most three Pre-existing findings, listed separately as not this change's responsibility.
- Visual claims marked **Not verified** unless you rendered the change.
