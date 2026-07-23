# Shell Utilities Available via shell_command

## File Operations
- **ls** - List directory contents (`/usr/bin/ls`)
- **cat** - Concatenate and display file contents (`/usr/bin/cat`)
- **cp** - Copy files (`/bin/cp`)
- **mv** - Move/rename files (`/bin/mv`)
- **rm** - Remove files (`/bin/rm`)
- **mkdir** - Create directories (`/usr/bin/mkdir`)
- **rmdir** - Remove empty directories (`/usr/bin/rmdir`)
- **touch** - Create empty files (`/usr/bin/touch`)
- **chmod/chown** - Change permissions/ownership (`/bin/chmod`, `/bin/chown`)

## Text Processing
- **grep** - Search text for patterns (`/usr/bin/grep`)
- **sed** - Stream editor for substitutions (`/usr/bin/sed`)
- **awk** - Pattern scanning and processing language (`/usr/bin/awk`)
- **cut** - Extract portions of lines (`/usr/bin/cut`)
- **sort** - Sort command-line input (`/usr/bin/sort`)
- **uniq** - Report adjacent identical lines (`/usr/bin/uniq`)
- **head** - Show first lines (`/usr/bin/head`)
- **tail** - Show last lines (`/usr/bin/tail`)
- **wc** - Count words/lines/characters (`/usr/bin/wc`)
- **tr** - Translate/delete characters (`/usr/bin/tr`)

## Directory Traversal
- **find** - Search for files in directory trees (`/usr/bin/find`)

## Network Utilities
- **curl** - Transfer data from/to URLs (`/usr/bin/curl`)
- **ssh** - Secure shell (`/usr/bin/ssh`)

## Archive Tools
- **tar** - Tape archive utility (`/usr/bin/tar`)
- **gzip/gunzip** - Gzip compression (`/usr/bin/gzip`, `/usr/bin/gunzip`)

## Emacs Utilities
- **emacs** - Full Emacs editor (`/nix/store/emacs/bin/emacs`)
- **emacsclient** - Communicate with Emacs instances (`/nix/store/emacs/bin/emacsclient`)

## Other Useful Tools
- **jq** - JSON processor (if available)
- **xargs** - Execute commands given arguments (`/usr/bin/xargs`)
- **realpath** - Canonicalize paths (`/usr/bin/realpath`)
- **readlink** - Read symbolic links (`/usr/bin/readlink`)
- **basename/dirname** - Manipulate path components (`/usr/bin/basename`, `/usr/bin/dirname`)
- **perl** - Perl interpreter (`/usr/bin/perl`)

## Usage Notes
- Commands are typically invoked via the `shell_command` tool with a single string argument.
- For multi-command workflows, use `&&` or `;` to chain commands within the same call.
- File operations should be atomic where possible (e.g., copy then delete original).
- Text processing benefits from pipes and redirection for efficiency.

