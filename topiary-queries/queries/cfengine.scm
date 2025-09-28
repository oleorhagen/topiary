; Do not format strings or comments
[
  (comment)
  (quoted_string)
] @leaf


; Add spaces around bundle keywords
[
 (bundle_block_keyword)
 (bundle_block_type)
 (bundle_block_name)
] @append_space

; Insert a newline after all {
; [
;  "{"
; ] @append_hardline

;; Rule #1 - Promises should start a newline
(bundle_block_body
  (bundle_section
    (promise_guard) @prepend_hardline @append_hardline
  )
)

;; Rule #2 - Class guards should start a newline
(bundle_block_body
  (bundle_section
    (class_guarded_promises
      (class_guard) @append_hardline
    )
  )
)

;; Rule #2 - Promises should be indented
(bundle_block_body
  (bundle_section
    (promise_guard) @prepend_indent_start
  ) @append_indent_end
)

;; Rule #3 - Promisers should be indented
(bundle_block_body
  (bundle_section
    (promise_guard) @append_indent_start
  ) @append_indent_end
)
; Also after class guards
(bundle_block_body
  (bundle_section
    (class_guarded_promises
      (class_guard) @append_indent_start
    ) @append_indent_end
  )
)

;; Rule #4 - Promises should have a newline separating them

;; Rule #5 - Promise guards should indent

;; Rule #6 - Promise guards should newline

;; Rule #7 - A ; should always lead to a newline
";" @append_hardline
