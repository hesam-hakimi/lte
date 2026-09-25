Resume the existing manual DEV rehearsal. Do not rebuild or re-upload
the package.

First verify:

id -nG tclue999devs

Proceed only if vmc2_clue_dev is present.

Then:

1. Run the exact administrator preparation command printed in the
   previous report. Interactive sudo is acceptable, but never capture
   or log the password.
2. Run the privileged deployment rehearsal as canonical account
   tclue999devs.
3. Verify offline installation, pip check, entry points, status,
   current symlink, second-run idempotency, and post-install dry-run.
4. Do not call Salt, HKV, AutoSys, Symcor, or Tungsten.
5. Report PRIVILEGED_RUNTIME_REHEARSAL as PASS or FAILED with evidence.
