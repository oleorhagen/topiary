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

; We always want the promisers to be on a new line
; (bundle_block_body
;   (bundle_section) @prepend_hardline @append_hardline
; )

(bundle_block_body
  (bundle_section
    (promise_guard) @prepend_hardline @append_hardline @append_indent_start
  ) @append_indent_end
)

; We always want to indent the promisers within bundle sections
; (bundle_section
;   (promise) @append_indent_start
; )
