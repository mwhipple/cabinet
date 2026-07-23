(defun collect-al-todo-headings ()
  "Collect all headings tagged with AL-TODO in the current buffer."
  (let ((elements (org-element-parse-buffer)))
    (dolist (elt elements)
      (when (and (eq (elt :type elt) 'heading)
                 (string= "* AL-TODO" (elt :raw-text elt)))
        (print (elt :contents elt))))))

(collect-al-todo-headings)
