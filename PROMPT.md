Perform one final read-only Git/index audit before any staging or commit.

Do not modify, stage, restore, commit, push, publish, open a PR, or trigger CI/XLR.

1. Run and report:
    * git status –short
    * git diff –name-status
    * git diff –cached –name-status
    * git diff – pom.xml assembly/pom.xml CD.yml
    * git diff –cached – pom.xml assembly/pom.xml CD.yml
2. For each of these four values, show a matrix containing:
    * origin/main
    * current index
    * current working tree
    Values:
    * root pom.xml project version
    * assembly/pom.xml parent version
    * assembly/pom.xml module’s own version
    * active DEV CD.yml batch_url
3. Explicitly answer:
    * Would a commit made right now contain all four intended 1.1.1-SNAPSHOT values?
    * Are any intended 1.1.1 changes currently unstaged?
    * Are any unauthorized paths staged or modified?
    * Is MERGE_HEAD still present and equal to the recorded origin/main commit?
    * What exact files would the next commit contain?
4. Confirm that CI.yml, assembly.xml, .gitignore, .gitattributes, mvnw, mvnw.cmd, .mvn/**, and .github/workflows/edp_xl_caller.yml remain unchanged from origin/main.

Stop after the report. Do not repair or stage anything, even if a mismatch is found.
