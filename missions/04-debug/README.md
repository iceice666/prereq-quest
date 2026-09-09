# Mission 04 — Debug unfamiliar code

`app/main.janet` is a small program written in
[Janet](https://janet-lang.org/). You do not need prior Janet experience.
Use the output and source code to find the defect.

## Task

Run the program:

```console
janet app/main.janet Brian
```

You should see:

```text
hello, Brian
42
```

The starter program prints the wrong number. Fix `app/main.janet` so its
output matches the example. Do not change `app/test.janet`.

## Verify your work

```console
./scripts/check.sh
```

If Janet is unavailable locally, the checker skips this test. Push your
change and use the GitHub Actions result instead.

## Record your answer

In your profile, under `## Mission 04 — Debug`:

```md
What was wrong:

What I changed:
```
