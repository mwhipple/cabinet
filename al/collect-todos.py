#!/usr/bin/env python3
import subprocess
import sys

org_file = sys.argv[1]

emacs_cmd = [
    "emacs", "-Q", "--batch",
    f"--load=/host/al/collect-org-todos.el",
    f"--eval=\"(find-file \\\"{org_file}\\\")\""
]

subprocess.run(emacs_cmd, check=True)
