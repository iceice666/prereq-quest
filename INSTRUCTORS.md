# Instructor guide

This repository is a diagnostic, not an exam. It exists to give you a
practical read on incoming students' developer tooling before the term
starts, so you can calibrate early lectures/labs instead of guessing.

Do not reduce its output to a single pass/fail score. Look at:

- the repository state (did the checks go green, and if not, where)
- the Actions job summary (the capability table)
- commit history (shape of the work, not just the final diff)
- the student's own explanations in `answers/<username>.md`
- their self-reported experience (Mission 00), read *against* what was
  actually observed, not instead of it

Self-report and observation disagreeing is itself useful information —
a student who says they've never used Docker but sails through Mission
05 learns fast; one who claims confidence but can't get the container
running may be overestimating themselves, or may just be having an off
day. Either way, that's a conversation, not a grade.

## Capability dimensions

| Dimension | What it's measuring |
|---|---|
| Git | commits, forks, remotes, merge conflicts |
| Linux | filesystem navigation, hidden files, paths |
| Shell | pipes, redirection, composing commands |
| SSH | authentication and connecting to a remote endpoint |
| Docker | reading a Dockerfile, build/run, basic image debugging |
| Debugging | forming a hypothesis from an error and testing it |
| Code reading | understanding unfamiliar code well enough to fix it |
| Development workflow | committing in logical chunks, using CI feedback |
| Independence / exploration | Mission 06 — what they notice and choose to fix |

Rough levels, for calibration only — do not compute one automatically:

```text
L0 - unfamiliar with basic developer tooling
L1 - can clone/edit/commit/push and run straightforward commands
L2 - comfortable navigating Linux and diagnosing simple failures
L3 - can handle Git conflicts, SSH, Docker, and unfamiliar projects
L4 - demonstrates strong debugging and development workflow
L5 - proactively improves tooling or identifies underspecified problems
```

A student can be L3 on Docker and L1 on Git in the same submission. That
inconsistency is expected and is exactly what the per-dimension table is
for.

## Setting this up for a cohort

1. **Push this repository** to wherever students will fork it from
   (an org repo, a template repo, etc.).

2. **Create the `challenge-conflict` branch** on the *upstream* repo
   (not on student forks) before students start:

   ```console
   git checkout -b challenge-conflict
   ```

   then edit `missions/02-git/quest-log.md`, replacing the placeholder
   line with:

   ```md
   - torch-bearer: left a spare torch by the door
   ```

   Commit and push that branch (`git push origin challenge-conflict`),
   then verify it actually landed on the remote students fork from:

   ```console
   git ls-remote origin challenge-conflict
   ```

   If that prints nothing, Mission 02 Task B is impossible for every
   student and no one can get a green run — there is nothing for them
   to merge. `scripts/check.sh` and the CI workflow both check for the
   resulting text and will tell you immediately if the branch content
   ever drifts from this.

   Note that forking copies `main` only by default, so students won't
   have this branch on their fork. That's intended: Mission 02 has them
   add `upstream` as a remote and fetch it, which is the point.

3. **Prepare Mission 03 (SSH).** Confirm that the endpoint in
   `missions/03-ssh/server.env` is reachable and distributes the expected
   token, then give students the private key through a secure channel.
   Never commit the key to this repository. Live SSH sessions are not
   checked automatically, so verify submitted tokens against the server
   logs when reviewing student work.

4. **Do not commit a solved version of any mission** to the branch
   students fork from. Verify the starter state is genuinely broken
   (Mission 04's arithmetic bug, Mission 05's Dockerfile) by running
   `./scripts/check.sh` yourself on a clean checkout before publishing.

5. Students should not need to touch `.github/workflows/quest.yml`. If
   you change it, make sure `./scripts/check.sh` still means the same
   thing the workflow checks, since students will be using it as their
   fast local feedback loop.

6. **If you commit to the scaffold, add your email to
   `SCAFFOLD_AUTHORS`** near the bottom of `scripts/check.sh`. That list
   is how the "your commits" line tells the student's work apart from
   the starter history. Miss it and every student's count is inflated by
   your commits, which quietly disables the "commit as you go" warning
   in the job summary. Check it with a fresh clone: `./scripts/check.sh`
   should report `your commits: 0`.

## What the checks can't see

`scripts/check.sh` ships in the repo it grades, so a student can read it
and satisfy its letter. That's an accepted trade-off for a low-stakes
diagnostic — but if a green run looks surprising next to a student's
`answers/` writeup, these are the cheap things to look at. Each is a
conversation starter, not an accusation; several have innocent
explanations.

| What a green check can't rule out | How to look |
|---|---|
| Test edited instead of code fixed (Mission 04) | `git diff <upstream>/main -- app/test.janet` — any diff here is the tell |
| Quest log typed by hand, never merged (Mission 02) | `git log --merges --oneline` is empty, or `git merge-base --is-ancestor upstream/challenge-conflict HEAD` fails. Note a student who used rebase or cherry-pick legitimately may also show no merge commit |
| "Improved something" with no actual change (Mission 06) | `git diff <upstream>/main...HEAD --stat` shows nothing outside `answers/` |
| Padded prose that clears a length floor | Read it. The checks only ever verified that text exists, never that it says anything |
| Fabricated SSH token (Mission 03) | Compare against your server's logs. Nothing in this repo can verify it — by design |
| Which human actually did the work | `git log --format='%an <%ae>' ` on their fork; the answers filename is not tied to an identity |

Two things the checker *does* now enforce, so you don't need to check by
hand: the Mission 01 path has to be a file under
`missions/01-linux/files/` (not one the student created elsewhere), and
the commit-count line ignores empty commits.

## Reading results

- A green Actions run means every automatable check passed. It does not
  mean the student understands everything — read `answers/<username>.md`
  and the commit history for that.
- The `your commits` line counts only non-empty commits whose author
  isn't in `SCAFFOLD_AUTHORS` (see setup step 6), so it does separate a
  student's work from the starter history without needing a cohort base
  SHA. It's still worth reading `git log` yourself for the *shape* of
  the work — the count can't tell a thoughtful commit from a trivial one.
- A red run with a clear commit history and a thoughtful `answers/`
  writeup explaining what's still broken is a *better* signal than a
  green run with one squashed commit and empty answer fields.
- Mission 06 has no canonical answer. CI only checks that an explanation
  exists. The content is entirely for you to read.
- Mission 04 has two correct fixes: change `base-value` from 40 to 41, or
  change `the-answer`'s `+ 1` to `+ 2`. Both make the tests pass, so
  students will hand you contradictory descriptions of "what was wrong"
  and both are right. Read the reasoning, not the diff — a student who
  explains why they picked one has done the mission; one whose
  explanation doesn't match their own diff hasn't.
