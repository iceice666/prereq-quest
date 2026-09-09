# The Quest

Welcome. This repository is a small diagnostic, not an exam. It exists so
you and your instructor can see what you're already comfortable with, and
what's worth practicing before the term gets going.

There is no single score at the end. Instead, GitHub Actions will build a
capability profile from what you actually did — separate from anything
you self-report.

## How this works

1. Fork this repository to your own GitHub account.
2. Clone your fork locally.
3. Work through the missions below, roughly in order.
4. Commit as you go (see Mission 02 — this matters).
5. Push to your fork.
6. Open the **Actions** tab on your fork and read the results. The first
   time, GitHub asks you to enable workflows on your fork — until you
   click enable, pushes will appear to do nothing. Enabling doesn't
   re-run anything by itself: push again, or use the manual
   **Run workflow** button on the `quest` workflow.
7. Keep pushing fixes until the checks are green.

If you get stuck on *how* to fork, clone, commit, or push — that's fine.
Figuring that out is itself part of what this diagnostic measures. Use
whatever you'd normally use to figure it out.

## If you get stuck

Give it about 30 focused minutes with your usual resources first —
error messages, search, docs, an LLM, a classmate. If you're still
stuck after that, **message your instructor directly** and describe
what you were trying to do, what you ran, and what happened instead.

Getting stuck is data, not a penalty. Where a cohort gets stuck is
exactly what this diagnostic is for, and a clear description of a wall
you hit is worth more than silently giving up on a mission.

## Before you start

Run the doctor script to see what's available on your machine:

```console
./scripts/doctor.sh
```

On **Windows**, run this (and everything else here) from **Git Bash**,
which ships with Git for Windows, or from WSL. These are shell scripts;
PowerShell and `cmd` can't run them.

Git is the only tool you must install locally. If the doctor reports that
Janet or Docker is unavailable, complete that mission by inspecting and
editing the files, then use GitHub Actions to verify it after you push.

## Mission 00 — Who are you?

Create `answers/<your-github-username>.md` from the template at
[`answers/README.md`](answers/README.md) (or copy
[`answers/TEMPLATE.md`](answers/TEMPLATE.md) directly). Fill in the
`Environment`, `Things I have done before`, and the two free-response
sections. You'll fill in the rest of this file as you complete missions.

## Missions

| # | Mission | Focus |
|---|---|---|
| 01 | [Linux scavenger hunt](missions/01-linux/README.md) | filesystem, shell, pipes |
| 02 | [Git](missions/02-git/README.md) | commits, forks, merge conflicts |
| 03 | [SSH](missions/03-ssh/README.md) | SSH authentication / remote connection |
| 04 | [Debug](missions/04-debug/README.md) | reading unfamiliar code |
| 05 | [Docker](missions/05-docker/README.md) | containers, build/run |
| 06 | [Improve something](missions/06-improve/README.md) | judgment, initiative |

## Checking your progress

```console
./scripts/check.sh
```

runs every check that doesn't need an external server. It won't catch
everything GitHub Actions checks (Docker and Janet only run locally if
you have them installed), but it's the fastest feedback loop you have.

## The fine print

- Every check maps to something a working developer does regularly. None
  of it requires memorizing flags or trivia.
- If a check is red, the fix is almost always: read the error message
  first.
- The Actions job summary shows a capability profile, not a score. A
  `⚪ unverified` result is not a failure. SSH is reported this way because
  this repository cannot verify the live server session automatically.
