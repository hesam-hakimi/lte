Good question — I do not have a confirmed service account yet. I was referring to the runtime identity that AutoSys will use to execute this job. The check I ran was only a diagnostic under my personal ID.

Could you please confirm which account or credential context AutoSys will use, and whether that identity is expected to retrieve the four Salt pillar secrets non-interactively? Once confirmed, we can validate the wrapper in the correct runtime context. Please disregard the NOPASSWD request until the runtime identity and expected access mechanism are confirmed.
