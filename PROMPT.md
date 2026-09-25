Stop the current PowerShell/base64 diagnostic. Do not create additional
temporary diagnostic scripts.

The failure is already understood: `tclue999devs` cannot traverse
`/home/tag5916`. Do not change my home-directory permissions and do not
diagnose that path further.

Use the existing interactive DEV SSH terminal and native Bash commands
directly. Do not use PowerShell here-strings or nested SSH quoting.

Use:

RID='0.2.0-a516a21.dirty.917b244b'
SRC="/home/tag5916/clue-manual-rehearsal/MANUAL-TEST-ONLY-$RID"
STAGE="/opt/clue/manual-rehearsal/$RID"

Perform these actions:

1. Verify that `$SRC/clue-$RID` and the matching archive and checksum
   sidecar exist. Verify SHA-256 before copying.

2. Create `$STAGE` using sudo with:
   - owner: root
   - group: unix_sudo_svc_clue
   - directory mode: 2750

3. Copy the exact current MANUAL-TEST-ONLY candidate from `$SRC` to
   `$STAGE`. Preserve executable bits, then set:
   - owner/group recursively: root:unix_sudo_svc_clue
   - group read/traverse access
   - no access for others
   Do not copy or use the older
   `/opt/clue/clue-0.2.0-test-f676277-deploy.tar.gz`.

4. Verify as `tclue999devs` that it can read the archive and execute:
   - `bin/clue-prepare-host.sh`
   - `bin/clue-deploy.sh`

5. Run only the prepare-host dry-run using:
   - group: unix_sudo_svc_clue
   - app root:
     `/opt/td/clue-rehearsal/0.2.0-a516a21.dirty.917b244b`
   - template from the staged bundle

6. Do not modify `/opt/td/clue`.
   Stop before the real preparation/install and report:
   - staged paths
   - SHA-256
   - owner/group/modes
   - runtime access checks
   - dry-run exit code and stages
