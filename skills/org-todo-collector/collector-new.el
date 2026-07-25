;;; collector.el --- Collect AL-TODO headlines from org files -*- lexical-binding: t; -*-

;; This skill provides a function to locate all org-mode headlines tagged with
;; "AL-TODO" across any number of org files, and return for each such headline
;; the headline text, its full subtree (including children), and any internal
;; references (file links and URL links) present in that subtree.

(require 'org)

(defun normalize-files (files)
  "Convert FILES to a list of strings."
  (if (stringp files)
      (list files)
    files))

(defun open-org-buffer (file)
  "Open FILE in an org-mode buffer and return the buffer contents."
  (with-temp-buffer
    (insert-file-contents-literally file)
    (org-mode)))

(defun find-tag-in-subtree (tag)
  "Search the current buffer for TAG and return a list of (headline children)."
  (let ((entry-start (re-search-forward (concat "\\[\\s-*" tag "\\s-*\\]") nil t)))
    (when entry-start
      (list (org-get-heading) (org-get-subtree)))))

(defun extract-references ()
  "Extract all file and URL references from the current buffer."
  (let ((refs '()))
    (save-excursion
      (re-search-forward "\\[\\[file:[^]]*\\]" nil t)
      (while (match-string 0)
        (push (match-string 0) refs)
        (re-search-forward "\\[\\[file:[^]]*\\]" nil t)))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\\[\\[url:[^]]*\\]" nil t)
        (push (match-string 0) refs)))
    refs))

(defun make-result-entry (headline children refs)
  "Create a plist entry for a found AL-TODO headline."
  (list :headline headline :children children :references refs))

(defun org-todo-collector (files tag &optional max-results)
  "Collect all headlines with TAG from FILES.
FILES can be a single file or a list of files. Returns a list of entries,
each entry is a plist: (:headline TEXT :children TEXT :references LIST).

TAG is the string to match (e.g., "AL-TODO").
MAX-RESULTS, if supplied, limits the number of entries returned."
  (let ((results '()))
    (dolist (file (normalize-files files))
      (open-org-buffer file)
      (while (or (null max-results) (< (length results) max-results))
        (let ((entry (find-tag-in-subtree tag)))
          (when entry
            (let ((headline (car entry))
                  (children (cdr entry)))
              (push (make-result-entry headline children (extract-references))
                    results))))))
    results))
