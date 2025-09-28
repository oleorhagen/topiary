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

;; Rule #1 - Promise guards should start a newline
(promise_guard) @prepend_hardline @append_hardline

;; Rule #2 - Class guards should start a newline
(bundle_block_body
  (bundle_section
    (class_guarded_promises
      (class_guard) @append_hardline @prepend_hardline
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
; ";" @append_hardline

;; Rule #8 - A bundle block should have:
;;; Opening braces on the same line
(
  (bundle_block_keyword)
  (bundle_block_type)
  (bundle_block_name)
  "{"
) @append_hardline
;; And closing brace on a separate line
; Match the last }
(bundle_block_body
  "}" @prepend_hardline @append_hardline
  .
)

;; Rule #9 - Promisers should have a space appended
(promiser) @append_space
; Except if they are directly followed by a ;
(
  (promiser)
  .
  ";"
  .
) @append_antispace

;; Rule #10 - All promise elements should be followed by a space
[
  ; (promiser)
  (attribute)
  (attribute_name)
  "=>"
  "->"
] @append_space

; Except for elements separators
[
  ","
  ";"
] @prepend_antispace

;; Rule #11 (vertical) - attributes should all be on newlines
(
  (attribute) @prepend_hardline
)

;; Rule #12 (horisontal) - The promiser attributes should start and end a new indented scope
(
  (attribute) @prepend_indent_start
) @append_indent_end

;; Rule #13 (horisontal) - slists should have spaces between the elements
(list
  "{"
  .
  _
  "," @append_space
)

;; Rule #14 (horisontal) - function calls should have spaces between elements
(call
  "("
  .
  _
  "," @append_space
)

;; TODO - Separate rules into vertical vs horisontal
