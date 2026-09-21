Finish the CLUE repository handover using the existing destination checkout and PR #1. Verify the current branch and PR state before editing.

1. Update the destination README with a concise CLUE overview, setup instructions, actual configuration names, test commands and current integration limitations. Preserve required EDP instructions.
2. Review tools/inspect_artifacts.py and tools/sanitize_postman.py, whose defaults reference excluded material. Make external inputs explicit or document the existing supported arguments and provide actionable missing-input errors. Keep vendor documents, credentials and runtime artifacts excluded.
3. Update the handoff and startup instructions with the verified destination checkout, repository, branch and PR. Clearly distinguish the original source checkout from the destination used for subsequent CLUE development. Preserve other sessions’ ownership.
4. Document why the two destination tests were skipped using existing results. Run only checks needed for these focused changes; do not repeat the full suite or perform live provider calls.

Commit and push these scoped changes to the same import branch and update PR #1. Do not create another PR or merge it.

Do not modify or push CI/CD files, including .github content, root CI.yml, MANIFEST.in or sonar-project.properties.

Return the updated commit, PR URL, changed files, validation results and exact local path to use for continued development. Keep the unresolved PenHub TLS and PAT configuration status accurately documented.
