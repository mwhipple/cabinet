#!/usr/bin/env bash
# Extract AL-TODO headlines from all org-mode files under /host
find /host -name "*.org" -type f -print0 | xargs -0 -I{} pandoc "{}" --filter /host/al/org-todo-filter.hs 2>/dev/null
