---
name: task-master
description: Plan out work to be done.
---

- Use the following skills wherever appropriate:
  - file-editor
  - literate-programmer
  - org-todo-collector
- Have org-todo-collector locate tasks.
- Do NOT do anything which is not requested by such tasks.
  - If work is identified that is not requested, then include that in the feedback produced
- Identify a single task to do (the first found) and for that task:
  - *all* tasks should result in work being done
  - if a request is for you to do something for yourself,
    it should result in the creation of tools and documentation that can drive
    subsequent efficiency, expressiveness, and knowledge sharing.
    That it is for you informs *how* it should be done, but not *what* should be done.
  - if work has already been started, continue the work or refine it to more
    closely align with what is described in the text.
  - if the content includes a `Questions from Al` section, then parse the answers
    that have been added alongside the questions and proceed accordingly.
  - if there is significant ambiguity, then produce corresponding feedback
- Produce feedback
  - For all work that has been done, modify the AL-TODO tag to AL-REVIEW,
    and update the content as needed to reflect that work has been done
    (e.g., if the text suggests something will be done, update it to reflect that it is done).
  - If any work could not be done, update the tag to AL-REVIEW and extend the
    content to include a `Questions from Al` child section.
  - If any additional work has been identified as potentially beneficial for any reason,
    then introduce new AL-REVIEW headlines describing that work. The content of those
    sections should be proposals for how the work could be done such that changing the tag
    to AL-TODO would result in implementing the changes.

