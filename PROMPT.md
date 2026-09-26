Build the current CLUE artifact immediately. Do not modify any file.

Run exactly:

cd C:\repos\clue-rc-20260926
git status --short
.\mvnw.cmd -B -DskipTests package
$artifact = "C:\repos\clue-rc-20260926\assembly\target\clue-code-1.1.1-SNAPSHOT.tar.gz"
if (-not (Test-Path -LiteralPath $artifact -PathType Leaf)) {
    throw "Expected artifact was not created: $artifact"
}
Get-Item -LiteralPath $artifact |
    Select-Object FullName, Length, LastWriteTime
Get-FileHash `
    -Algorithm SHA256 `
    -LiteralPath $artifact
tar -tzf $artifact |
    Select-Object -First 30
tar -tzf $artifact |
    Select-String -Pattern `
        '^deploy/clue_operational_wrapper\.sh$', `
        '^docs/CLUE_OPERATIONAL_DEPLOYMENT\.md$', `
        '^deploy/clue_dev_prereq\.sh$', `
        '^deploy/clue_dev_run\.sh$', `
        '^deploy/clue_with_runtime_secrets\.sh$'
tar -tvzf $artifact |
    Select-String -Pattern `
        'deploy/clue_operational_wrapper\.sh', `
        'deploy/.*\.sh'

Confirm:

1. Maven reports BUILD SUCCESS.
2. The archive is rootless; entries must not start with Deliverables/.
3. deploy/clue_operational_wrapper.sh is present.
4. docs/CLUE_OPERATIONAL_DEPLOYMENT.md is present.
5. All deploy/*.sh files have executable mode.
6. Report the exact artifact path, size and complete SHA-256.

Do not run the full test suite. Do not clean the repository. Do not edit, stage, commit, push, upload to Nexus or trigger CI. Stop after reporting the artifact result.
