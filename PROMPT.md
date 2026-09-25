Correction: the exact existing group is `unix_sudo_svc_clue`, not
`unix_sudo_clue`. The previous exact-name check correctly stopped.

On DEV, first run only:

whoami
sudo -l

Interactive sudo is allowed. Let me enter the password directly in the
terminal. Never request, capture, print, or store the password.

Do not make any filesystem changes yet. Report the sudo permissions for
my current account. If the required privileged command is allowed, rerun
the prepare-host dry-run using:

--group unix_sudo_svc_clue

and the same isolated `/opt/td/clue-rehearsal/...` test root. Stop before
the real privileged command and ask for my confirmation.
