;; Write queries here (see $VIMRUNTIME/queries/ for examples).
;; Move cursor to a capture ("@foo") to highlight matches in the source buffer.
;; Completion for grammar nodes is available (:help compl-omni)

(block
  name: (expr) @_name
  (#eq? @_name "src")
  parameter: (expr) @injection.language
  contents: (contents) @injection.content
  (#set! injection.include-children))
