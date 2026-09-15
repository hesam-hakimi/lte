# Inputs for preparing the internal team test kit

This archive contains documentation and one English engineering prompt. It does not contain a VSIX, install the extension, or run Windows work. The intended audience for the eventual test kit is Hesam's direct technical teammates doing experimental development.

## Transfer and use

1. Transfer this archive to Windows and extract it into a fresh documentation staging directory outside every active worktree, for example a new directory under C:\docs. Preserve existing files and the supplied bytes. A ChatGPT download link is not a Windows path.
2. Keep README_FIRST.md, PROMPT.md, HASHES.json and references/ together. Verify the extracted entries against HASHES.json with existing tooling.
3. Submit the complete PROMPT.md once in a new engineering session, attaching this archive or supplying its actual extracted Windows location. Use the existing ETL checkout as a read-only input; do not create another product implementation.
4. The Windows agent prepares a local, reviewable kit from the retained qualified 0.3.160 VSIX. Distribution and test execution are separate actions. The agent must return the real kit path and limitations before the owner decides how to share it.

## The previously missing contract

references/09_AGILE_REPAIR_AND_VERIFICATION_CONTRACT.md is the exact v1.2 reference: 23,684 bytes, SHA-256 5387aa5c42940eceb2ffcd4d68d732ad3d57f1c69c2288c66bd0f32455e6f75b. Its original Library identity is libfile_2d8c734833f881919b03f0bd38073622. It is copied without editing or line-ending conversion.

Read it in full. Its historical running/pending statements remain historical; the later owner-reported handoff in PROMPT.md supplies current dispositions for this proposed task. The canonical reference collection has not been rewritten. Delivering this file now does not retroactively prove that the completed frontmatter task read it.

HASHES.json describes the three content entries and intentionally excludes itself and the ZIP container. It verifies transfer correspondence; it is not independent acceptance of Windows results.
