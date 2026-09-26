CLUE — controlled implementation, official build, Nexus delivery, and complete evidence capture

Continue the active CLUE engineering work. This is not a project restart.

All responses, implementation notes, code comments, test output summaries, and documentation in this development environment must be in English.

Read these attached documents completely, in this order, before taking any repository action:

1. CLUE_Implementation_Reference_2026-09-26.md
2. CLUE_Implementation_Phases_and_Acceptance_2026-09-26.md
3. CLUE_Implementation_Journal_2026-09-26.md

The historical investigation report is optional evidence only. Do not use its superseded /opt/clue, branch-count, or authorization conclusions as implementation instructions.

Objective

Produce the simplest high-quality release candidate that:

- preserves the verified CLUE application changes;
- uses the current origin/main EDP-owned deployment contract;
- installs under /app/clue;
- is owned and executed on the host by the exact verified environment NPID;
- is built only through the official Maven Assembly path;
- can later be published through the existing CI/XLR process and independently downloaded from Nexus;
- leaves a complete, reproducible evidence trail for every phase.
