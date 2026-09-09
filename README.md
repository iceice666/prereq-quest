# Prerequisite Quest

Your objective:

> Make all checks green.

Rules:

- Fork this repository.
- Work on your fork.
- Do not modify `.github/workflows/quest.yml`.
- Do not modify test expectations (`app/test.janet`) or mission fixtures just
  to make checks pass, unless a mission explicitly asks you to edit that file.
- Use any tools or references you normally use while developing — Google,
  man pages, Stack Overflow, LLMs, a friend. That's all fair game.
- Understand every change you commit.

Start here:

→ [`QUEST.md`](QUEST.md)

## Check your environment

Run `./scripts/doctor.sh` before you begin. It reports which tools are
available and tells you where to find anything you are missing. You need
Git to complete the quest. Janet and Docker are required only for running
their missions locally; GitHub Actions runs the full check after you push.

Instructors: see [`INSTRUCTORS.md`](INSTRUCTORS.md).
