---
**Emphasis:** All produced files should be one or more org-mode files that can be tangled or executed as appropriate.

name: literate-programmer
description: Create and review literate programming content following Knuth's conventions using org mode, producing one or more org-mode files that can be tangled or executed as appropriate.
---

This skill provides guidance for writing literate programming documents in org mode, drawing on the conventions established by Donald Knuth. It includes instructions for creating new literate programming files and reviewing existing content for conformance.

## What is Literate Programming?

Literate programming, as introduced by Knuth, is an approach to writing computer programs where the primary goal is clear communication of ideas rather than just getting code to run. The key principles are:

- **Code and prose together**: The document should be readable as a narrative about the program's design and implementation.
- **Contextual code blocks**: Code appears in the appropriate places within the narrative, not collected at the end.
- **Modular organization**: The document can be split into pieces that are compiled separately but still form a coherent whole.
- **Cross-references**: Use references to navigate between related sections.

## Org Mode as a Literate Programming Tool

Org mode is particularly suited for literate programming because:

1. It supports both prose and code in the same file
2. Code blocks can be tagged with languages and optional arguments
3. The document can be exported to multiple formats (HTML, LaTeX, etc.)
4. Org's outline structure naturally supports modular pieces

**Emphasis:** All produced files should be one or more org-mode files that can be tangled or executed as appropriate.

## Creating Literate Programming Files

### Basic Structure

A literate programming org file should have:

```org
* Title
  :PROPERTIES:
  :LITERAL-PROGRAMMING: yes
  :END:

* Introduction
  The program solves X by ...

* Design Decisions
  - Why we chose approach A over B
  - Trade-offs considered

* Implementation
** Module A
#+begin_src elisp
(defun my-function (arg)
  "Docstring for the function."
  ...)
#+end_src

** Module B
...

* Testing
...

* Conclusion
```

### Code Block Conventions

- Use `#+begin_src` and `#+end_src` with appropriate language tags
- Include docstrings/comments in code blocks that explain *what* the code does, not just syntax
- For complex algorithms, consider adding explanatory text before or after the block
- Keep code blocks reasonably sized; very large blocks may be better split

### Cross-References

Use org links to refer to other sections:

```org
[[file:other-file.org::*Section][See Section]]
```

or within the same file:

```org
* Design Decisions
[[#implementation][Jump to Implementation]]
```

## Reviewing Content for Conformance

When reviewing an existing org file for literate programming conformance, check:

1. **Is it readable as prose?** Try reading it without executing any code blocks. Does the narrative flow?

2. **Are code blocks contextual?** Each block should be introduced by text explaining its purpose and how it fits into the overall design.

3. **Do cross-references make sense?** Ensure references point to relevant sections.

4. **Is the structure modular?** Consider whether the file could be split into logical pieces (e.g., separate modules) while maintaining coherence.

5. **Documentation quality**:
   - Code blocks have meaningful names and docstrings
   - Comments explain non-obvious logic
   - The prose explains design choices, not just implementation details

## Common Pitfalls to Avoid

- Don't dump all code at the end of a document; that defeats the literate programming purpose.
- Avoid overly terse code blocks without explanatory context.
- Don't use org mode primarily as a simple note-taking tool when you're trying to write a literate program.

## Example: A Simple Literate Program

```org
#+TITLE: My First Literate Program
#+OPTIONS: toc:nil

* Introduction

This program computes the sum of numbers from 1 to N using an iterative approach.

* Algorithm Design

The algorithm is straightforward: maintain a running total and iterate through each number, adding it to the total.

#+begin_quote
For i from 1 to N:
    total = total + i
#end_quote

* Implementation

#+begin_src elisp
(defun sum-to-n (n)
  "Return the sum of all integers from 1 to N."
  (let ((total 0))
    (dolist (i (number-sequence 1 n) total)))
  )
#+end_src

** Testing the function

#+begin_src elisp
(assert (= (sum-to-n 5) 15))
#+end_src

* Conclusion

The implementation matches the algorithm described above.
```

## Using This Skill

When you need to create or review literate programming content:

- For creation: Refer to the guidelines above and use the `literate-programmer` tool (see below) which can scaffold a new file with appropriate headers.
- For review: Apply the checklist; if issues are found, document them and suggest corrections.

Over.
