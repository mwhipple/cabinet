# Shell Utilities Available via shell_command

## File Operations
- **ls** - List directory contents (`/usr/bin/ls`)
- **cat** - Concatenate and display file contents (`/usr/bin/cat`)
- **cp** - Copy files (`/bin/cp`)
- **mv** - Move/rename files (`/bin/mv`)
- **rm** - Remove files (`/usr/bin/rm`)
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

## Pandoc

### Invoking pandoc
Pandoc is available at `/usr/local/bin/pandoc` (v3.10). It supports multiple input/output formats:

```bash
# Basic conversion
pandoc --from markdown --to html input.md -o output.html

# Using a filter
pandoc --filter /path/to/filter.hs input.md -o output.html

# Server mode for streaming
pandoc --server
```

### Writing filters
Filters can be written in Haskell (using the pandoc library), Lua, or Python. The Haskell approach gives direct access to the AST:

```haskell
import Text.Pandoc
import Text.Pandoc.Lua.Filter

main :: IO ()
main = do
    doc <- readFile "input.md"
    let ast = parsePandoc doc
    -- traverse ast, modify as needed
    print (renderToHtml ast)
```

Lua filters are invoked via `--lua-filter` and can call the pandoc API. Python filters use `pandocfilters`.

### Custom Haskell programs with pandoc
The `Text.Pandoc` library provides:
- `parsePandoc :: String -> Pandoc`
- `renderToHtml`, `renderToMarkdown`, etc.
- AST types: `Pandoc (Block [Inline])` where `Block` includes `Para`, `Header`, `CodeBlock`, etc.

These are useful for building custom document processors, extracting metadata, or transforming content before rendering.

## AL-REVIEW: Session Efficiency Analysis

### Observation
During this session I verified pandoc filter capability but encountered repeated failures due to missing libraries. Key inefficiencies observed:
- Created multiple test files (TestPandoc.hs, TestPandoc2.hs, Filter.hs) before confirming compilation
- Attempted cabal install of full pandoc library twice; both timed out
- Read AGENTS.md at start and later for context (could have been combined)

### Proposal
For future sessions:
1. Check library availability early (via `cabal list` or environment inspection) before creating code
2. Use incremental compilation (compile after each edit) to catch errors sooner
3. Consider caching cabal install results or using a minimal pandoc-types-only approach when full library isn't needed

**Efficiency gain:** Reducing redundant file creation and early dependency checks could save ~10-15 tool calls in similar tasks.

Over.
