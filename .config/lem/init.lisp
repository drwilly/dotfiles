(in-package :lem-user)

(lem-vi-mode:vi-mode)
(lem/line-numbers:toggle-line-numbers)
(setf (lem-vi-mode:option-value "scrolloff") 5)
(setf (variable-value 'line-wrap :global) nil)

;;;; -- buffer --
(define-key lem-vi-mode:*normal-keymap* "Space b b" 'select-buffer)
(define-key lem-vi-mode:*normal-keymap* "Space b n" 'next-buffer)
(define-key lem-vi-mode:*normal-keymap* "Space b p" 'previous-buffer)
(define-key lem-vi-mode:*normal-keymap* "Space b d" 'kill-buffer)
(define-key lem-vi-mode:*normal-keymap* "Space b B" 'select-buffer-next-window)

;;;; -- window --
(define-key lem-vi-mode:*normal-keymap* "Space s h" 'split-active-window-horizontally)
(define-key lem-vi-mode:*normal-keymap* "Space s v" 'split-active-window-vertically)

(define-key lem-vi-mode:*normal-keymap* "Space w n" 'next-window)
(define-key lem-vi-mode:*normal-keymap* "Space w p" 'previous-window)
(define-key lem-vi-mode:*normal-keymap* "Space w d" 'delete-active-window)


(define-key lem-vi-mode:*normal-keymap* "C-p" 'switch-to-last-focused-window)

(define-key lem-vi-mode:*normal-keymap* "C-h" 'window-move-left)
(define-key lem-vi-mode:*normal-keymap* "C-j" 'window-move-down)
(define-key lem-vi-mode:*normal-keymap* "C-k" 'window-move-up)
(define-key lem-vi-mode:*normal-keymap* "C-l" 'window-move-right)

(define-key lem-vi-mode:*normal-keymap* "Space x x" 'delete-active-window)
(define-key lem-vi-mode:*normal-keymap* "Space x o" 'delete-other-windows)

;;;; -- tab --
(define-key lem-vi-mode:*normal-keymap* "Space t c" 'lem/frame-multiplexer::frame-multiplexer-create-with-previous-buffer)
(define-key lem-vi-mode:*normal-keymap* "Space t d" 'lem/frame-multiplexer::frame-multiplexer-delete)

(define-key lem-vi-mode:*normal-keymap* "Space 1" 'lem/frame-multiplexer::frame-multiplexer-switch-1)
(define-key lem-vi-mode:*normal-keymap* "Space 2" 'lem/frame-multiplexer::frame-multiplexer-switch-2)
(define-key lem-vi-mode:*normal-keymap* "Space 3" 'lem/frame-multiplexer::frame-multiplexer-switch-3)
(define-key lem-vi-mode:*normal-keymap* "Space 4" 'lem/frame-multiplexer::frame-multiplexer-switch-4)
(define-key lem-vi-mode:*normal-keymap* "Space 5" 'lem/frame-multiplexer::frame-multiplexer-switch-5)
(define-key lem-vi-mode:*normal-keymap* "Space 6" 'lem/frame-multiplexer::frame-multiplexer-switch-6)
(define-key lem-vi-mode:*normal-keymap* "Space 7" 'lem/frame-multiplexer::frame-multiplexer-switch-7)
(define-key lem-vi-mode:*normal-keymap* "Space 8" 'lem/frame-multiplexer::frame-multiplexer-switch-8)
(define-key lem-vi-mode:*normal-keymap* "Space 9" 'lem/frame-multiplexer::frame-multiplexer-switch-9)
(define-key lem-vi-mode:*normal-keymap* "Space 0" 'lem/frame-multiplexer::frame-multiplexer-switch-0)

;;;; -- [c]ode --
(define-key lem-vi-mode:*normal-keymap* "Space c f" 'format-current-buffer) ;; 'lsp-document-format?
(define-key lem-vi-mode:*normal-keymap* "Space c c" 'lem/language-mode::comment-or-uncomment-region) ;; 'lsp-document-format?