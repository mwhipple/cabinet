---
name: org-todo-collector
description: Collect all AL-TODO headlines from org files, including their subtrees and any referenced content.
---

This skill provides a function `org-todo-collector` that can be invoked via Emacs batch mode. It accepts a list of file paths (or a single path) and a tag string, and returns a list of entries. Each entry contains the headline text, its full subtree, and any internal references (file links and URL links) found within that subtree.

The function is defined in `collector.el`. To use it:

  emacs -Q -l /host/skills/org-todo-collector/collector.el \
    --eval "(org-todo-collector '/path/to/file.org' 'AL-TODO')"

This will print the result as a Lisp list. The caller can then parse that output as needed.
This can be invoked as a shell command like any other.