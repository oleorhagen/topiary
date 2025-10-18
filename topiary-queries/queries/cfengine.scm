; Do not format strings or comments
[
  (comment)
  (quoted_string)
] @leaf

;; Ensure comments maintain their line breaks
(comment) @prepend_hardline @append_hardline

; Add spaces around bundle keywords
[
  (bundle_block_keyword)
  (bundle_block_type)
  (bundle_block_name)
] @append_space

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

;; Rule #2 & #3 - Promises and promisers should be indented
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

;; Rule #15 - Promises should always be on a separate line (Overlapping with previous definitions - 2do - fix)
(promise) @prepend_hardline @append_hardline

;; Rule #16 - A body_block/bundle should always be ending on a newline
(body_block) @append_hardline
(bundle_block) @append_hardline

;; Rule #17 - A body block should always have a newline as the first entry after the first {
(body_block
  (_
    .
    "{" @append_hardline
  )
)

;; Rule #18 - A body block should always have, as it's last element, the closing brace on a separate line
(body_block
  (_
    "}" @prepend_hardline
    .
  )
)

;; Rule #19 - Insert empty lines between body blocks
(
  [(bundle_block) (body_block)] @append_delimiter
  .
  [(bundle_block) (body_block)]

  (#delimiter! "\n")
)

;; Rule #20 - Body/Bundle block body should always have a space before the opening {
(bundle_block_body
  "{" @prepend_space
)

(body_block_body
  "{" @prepend_space
)

;; Rule #20b - Bundle block body content should be indented
(bundle_block_body
  "{" @append_indent_start
)

(bundle_block_body
  "}" @prepend_indent_end
)

;; Rule #21 - Insert empty lines between promises
(
  (bundle_section) @append_delimiter
  (#delimiter! "\n")
  (#query_name! "Promise newline delimeter")
)

;; Prepend a space before the first promise
(bundle_block_body
  "{"
  .
  (bundle_section) @prepend_delimiter

  (#delimiter! "\n")

  (#query_name! "First promise newline delimeter")
)

;; Rule #22 - Align => When multiple are present in a promise (?)

;; Rule #23 - Indent all parts of a comment
(comment) @multi_line_indent_all

;; Rule #24 - Allow comments and type definitions to have a blank line above them
[
  (comment)
] @allow_blank_line_before
