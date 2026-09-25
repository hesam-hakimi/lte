Confirmed, with one correction:

- Service account: TCLUE999DEVS
- Canonical Linux account: tclue999devs
- Required Linux group: vmc2_clue_dev
- Server: crcluesbdzwnk0.dev.vmc2.td.com

Yes, the service account needs to be a member of vmc2_clue_dev.

If possible, please process the group membership manually now so we can
complete the DEV deployment validation. I will also submit the formal
privileged-access request so the access is properly recorded for Phase 2.

Please let me know when the membership has propagated, and I will verify
it with:

id -nG tclue999devs
