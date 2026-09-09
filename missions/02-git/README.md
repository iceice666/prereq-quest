# Mission 02 — Git

Practice making focused commits and resolving a merge conflict.

## Task A — Commit each mission

Commit each completed mission separately. Use a short message that says
what changed, such as `solve linux mission` or `fix application output`.

## Task B — Resolve a merge conflict

1. Open `missions/02-git/quest-log.md`, replace the placeholder with your
   own entry, and commit it.
2. Add the repository you forked as the `upstream` remote and fetch it:

```console
git remote add upstream <url-of-the-repo-you-forked-from>
git fetch upstream
```

3. Merge the challenge branch:

```console
git merge upstream/challenge-conflict
```

4. Resolve `missions/02-git/quest-log.md`. Keep both your entry and the
   `torch-bearer` entry, and remove every conflict marker.
5. Finish the merge:

```console
git add missions/02-git/quest-log.md
git commit
```

The final file must contain both entries and no `<<<<<<<`, `=======`, or
`>>>>>>>` lines.

## Verify your work

```console
./scripts/check.sh
git log --oneline --graph --decorate -10
```
