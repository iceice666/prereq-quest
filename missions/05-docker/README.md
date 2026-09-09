# Mission 05 — Docker

The root `Dockerfile` builds successfully, but its container cannot find
the Janet program when it starts. Diagnose and fix the path mismatch.

## Task

```console
docker build -t prereq-quest .
docker run --rm prereq-quest
```

The corrected container must print exactly:

```text
hello, world
42
```

Read the error from `docker run`, then compare the paths in `WORKDIR`,
`COPY`, and `CMD`. Change only the path needed to make the program start.

The container runs the file from Mission 04. Complete that mission first
so the second output line is `42`.

If Docker is unavailable locally, inspect and fix the file, then push and
use the GitHub Actions result to verify it.

## Record your answer

In your profile, under `## Mission 05 — Docker`:

```md
What was wrong:

What I changed:
```
