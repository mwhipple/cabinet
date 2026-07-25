---
name: agent-kaizen
description: Analyze all missives from a given session and capture efficiency improvements.
---

An efficient session is one that produces results with the minimal amount of time spent and steps
(prioritized in that order).

- Locate all missives (logs, messages, session data) for the current session.
- For each missive, extract any information or suggestions that could have enabled more efficient work.
  - This should include anything within the message along with any indication of effort that could have been avoided
- Factors such as repeated work also be tracked so that redundancy can be reduced
  - Within a session look for any repeated or similar work that could have been collapsed with more supporting
    information or tooling.
  - Track all tool calls (including parameters across all sessions in file in your area.
    This should include the number of times such calls have been made and the total time spent on such calls.
    Review this information for improvements.
- If any additional tasks are identified, create corresponding AL-REVIEW sections with proposals for implementation.
- Any recurring patterns of issues should be called out individually to pursue more systemic improvements.