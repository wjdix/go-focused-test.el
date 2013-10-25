# Emacs Go Lang Focused Testing
`go-focused-test` provides some convenience functions for running Go tests.

## Installation

To install, download `go-focused-test` and add the following to your init file:

	(add-to-list 'load-path "/path/to/go-focused-test")
	(require 'go-focused-test)

## Usage

`go-focused-test` provides two functions.

	(run-go-tests)
	(run-go-test-at-point)

In my emacs init file I bind the two functions like so:

	(define-key go-mode-map "\C-c \C-f" 'run-go-test-at-point)
	(define-key go-mode-map "\C-c \C-t" 'run-go-tests)
