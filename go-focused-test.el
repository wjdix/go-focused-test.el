;;; go-focused-test.el --- Convenient function to run focused Go test

;;; Commentary:

;;: Dependencies
;;  Requires `go-mode.el`

;;; Code:

(defun run-go-tests ()
  (interactive)
  (compile "go test -v ."))

(defun run-go-test-at-point ()
  "Run test at point."
  (interactive)
  (compile (format "go test -v . -run %s" (find-test-name-at-point))))

(defun find-test-name-at-point ()
  (let ((start (point)))
    (save-excursion
      (end-of-line)
      (unless (and
               (search-backward-regexp "^[[:space:]]*func[[:space:]]*Test" nil t)
               (save-excursion (go-end-of-defun) (< start (point))))
        (error "Unable to find a test"))
      (save-excursion
        (search-forward "Test")
        (setq test-name (thing-at-point 'word)))
      ))
  test-name)

(provide 'go-focused-test)
;;; go-focused-test.el ends here
