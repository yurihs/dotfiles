;; Makes a mouse button into a modifier for the scroll wheel.
;; Credit: Zero Angel at linuxquestions.org

;; Tracks whether anything was pressed
;; while the modifier was active.
(define actionperformed 0)

(define (install-modifier-binding)
  ;; Use button 8 as modifier
  (xbindkey-function '("b:8") enter-mouse-modifier))

(define (leave-mouse-modifier)
  ;; Reset everything!
  ;; Stop processing keys
  (ungrab-all-keys)
  ;; Remove all bindings
  (remove-all-keys)
  ;; Reset mouse chord state
  (set! actionperformed 0)
  ;; Reset modifier keys
  (run-command
    "xdotool keyup ctrl keyup alt keyup shift keyup super&")

  ;; Add bindings again
  (install-modifier-binding)
  ;; Start processing keys again
  (grab-all-keys))

(define (enter-mouse-modifier)
  ;; Stop processing keys
  (ungrab-all-keys)
  ;; Remove all bindings
  (remove-all-keys)

  ;; Add some bindings back

  ;; If pressing the left button...
  (xbindkey-function
    '("b:1")
    (lambda ()
      ;; Previous track
      (run-command "playerctl previous")
      (set! actionperformed 1)))

  ;; If pressing the middle button...
  (xbindkey-function
    '("b:2")
    (lambda ()
      ;; Previous track
      (run-command "xdotool key XF86AudioMute")
      (set! actionperformed 1)))

  ;; If pressing the right button...
  (xbindkey-function
    '("b:3")
    (lambda ()
      ;; Next track
      (run-command "playerctl next")
      (set! actionperformed 1)))

  ;; If scrolling up...
  (xbindkey-function
    '("b:4")
    (lambda ()
      ;; Volume up.
      (run-command "xdotool key XF86AudioRaiseVolume")
      (set! actionperformed 1)))

  ;; If scrolling down...
  (xbindkey-function
    '("b:5")
    (lambda ()
      ;; Volume down.
      (run-command "xdotool key XF86AudioLowerVolume")
      (set! actionperformed 1)))

  ;; When the modifier is released...
  (xbindkey-function
    '(release "b:8")
    (lambda ()
      ;; If no other key was pressed...
      (if (= actionperformed 0)
        ;; Pause.
        (run-command "playerctl play-pause"))

      ;; Finally, leave the modifier.
      (leave-mouse-modifier)))

  ;; Bindings are set,
  ;; start processing keys again.
  (grab-all-keys))

;; Main
(install-modifier-binding)
