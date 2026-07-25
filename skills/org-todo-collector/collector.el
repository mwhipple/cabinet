;;; collector.el --- Collect AL-TODO headlines from org files -*- lexical-binding: t; -*-

;; This skill provides a function to locate all org-mode headlines tagged with
;; "AL-TODO" across any number of org files, and return for each such headline
;; the headline text, its full subtree (including children), and any internal
;; references (file links and URL links) present in that subtree.

(require 'org)

(defun org-todo-collector (files tag &optional max-results)
  "Collect all headlines with TAG from FILES.
FILES can be a single file or a list of files. Returns a list of entries,
each entry is a plist: (:headline TEXT :children TEXT :references LIST).

TAG is the string to match (e.g., \"AL-TODO\").
MAX-RESULTS, if supplied, limits the number of entries returned."
  (let ((results '()))
    (dolist (file (if (stringp files) (list files) files))
      (with-temp-buffer
        (insert-file-contents-literally file)
        (org-mode)
        (while (or (null max-results) (< (length results) max-results))
          (re-search-forward (concat "\\[\\s-*" tag "\\s-*\\]") nil t)
          (when (match-beginning 0)
            (let ((entry-start (match-beginning 0)))
              (goto-char entry-start)
              (let ((headline (org-get-heading))
                    (children (org-get-subtree)))
                ;; Extract references: file links and URL links.
                (let ((refs '()))
                  (save-excursion
                    (re-search-forward "\\[\\[file:[^]]*\\]\\]" nil t)
                    (while (match-string 0)
                      (push (match-string 0) refs)
                      (re-search-forward "\\[\\[file:[^]]*\\]\\]" nil t)))
                  (save-excursion
                    (goto-char (point-min))
                    (while (re-search-forward "\\[\\[url:[^]]*\\]\\]" nil t)
                      (push (match-string 0) refs)))
                (push (list :headline headline :children children :references refs)
                      results))))))
    results))

