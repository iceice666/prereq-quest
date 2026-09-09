# Mission 03 — SSH

Connect to the course SSH server with the private key supplied by your
instructor. The server address and username are stored in
`missions/03-ssh/server.env`.

## Task

1. Ask your instructor for the private key if you have not received it.
   The key is deliberately not committed to this repository.
2. From the repository root, load the server settings and connect:

```console
source missions/03-ssh/server.env
ssh -i <path-to-the-key-file> "$QUEST_SSH_USER@$QUEST_SSH_HOST"
```

The server prints a short token and disconnects. A `PTY allocation
request failed` message is expected and can be ignored.

If SSH says the key permissions are too open, restrict the file first:

```console
chmod 600 <path-to-the-key-file>
```

On Windows, place the key in your `~/.ssh` directory and run the commands
from Git Bash or WSL.

## Record your answer

In `answers/<github-username>.md`, complete the `## Mission 03 — SSH`
section:

```md
SSH token:

Command I used:
```

Record the command with the real key path you used. Do not commit the
private key or invent a token. If you cannot connect, send your instructor
the command you ran and the complete error message.
