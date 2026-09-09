# Mission 01 — Linux

Use shell commands to find a file and inspect a log. Run every command
from the repository root.

## Task A — Find the file

Somewhere under `missions/01-linux/files/` there is a file containing the
exact string:

```text
THE_PENGUIN_WAS_HERE
```

Find the file that contains it. Record the file's path relative to the
repository root.

<details><summary>Hint: useful tools</summary>

`ls -a`, `find`, `grep`, `cat`, `less`

</details>

## Task B — Count the errors

Count the lines in `missions/01-linux/server.log` that contain `ERROR`.

<details><summary>Hint: useful tools</summary>

`grep`, `wc`, pipes (`|`)

</details>

## Record your answers

Open your profile at `answers/<github-username>.md` and fill in the
`## Mission 01 — Linux` section:

```md
## Mission 01 — Linux

### Task A — find the file

Path:

Command I used:

### Task B — count the errors

Count:

Command I used:
```

- `Path` should be the path to the file you found, relative to the
  repository root.
- `Count` should be a plain number.
- `Command I used` should contain the command that produced your answer.

## Verify your work

```console
./scripts/check.sh
```
