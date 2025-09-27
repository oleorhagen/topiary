; Do not format strings or comments
[
  (comment)
  (quoted_string)
] @leaf

(comment) @multi_line_indent_all

; Bundle blocks should have blank lines between them
(bundle_block) @allow_blank_line_before

; Add newlines between bundle blocks
(source_file
  (bundle_block) @prepend_hardline
)

(
  (bundle_block) @append_delimiter
  (#delimiter! "\n\n")
)

; Add spaces around keywords
(bundle_block_keyword) @append_space
(bundle_block_type) @append_space
(bundle_block_name) @append_space

; Bundle body formatting - add blank line after opening brace
(bundle_block_body
  "{" @append_hardline @append_hardline @append_indent_start
  "}" @prepend_hardline @prepend_indent_end
)

; Add blank line after bundle opening brace
(bundle_block_body
  "{" @append_delimiter
  (#delimiter! "\n")
)

; Promise guard formatting - should be at bundle level with newline after
(promise_guard) @prepend_hardline @append_hardline

; Bundle section - add indentation for promises within section
(bundle_section
  (promise_guard) @append_indent_start
)


; Promise formatting - promiser should be indented under section
(promise
  (promiser) @append_hardline @append_indent_start @append_space
  ";" @prepend_hardline @prepend_indent_end @prepend_indent_end
)

; Attribute formatting - each attribute on separate line with basic indentation
(attribute) @prepend_hardline

; Arrow operator formatting
"=>" @prepend_space @append_space

; Comma in attributes - should stay at end of line with following space
(promise "," @append_space)

; Class guard formatting - should have blank line before and after, and indent content
(class_guard) @prepend_hardline @append_hardline @append_indent_start @prepend_indent_end

; List formatting - multiline with trailing comma
(list
  "{" @append_hardline @append_indent_start
  "}" @prepend_hardline @prepend_indent_end
)

; Add trailing comma and newline for list items
(list "," @append_hardline)

; Ensure trailing comma is added to last item in list if not present
(list
  (quoted_string) @append_delimiter . ","* @do_nothing . "}"
  (#delimiter! ",")
)


; Function call formatting - add spaces after commas
(call "," @append_space)

; Add blank line after promise semicolon to separate sections
(promise ";" @append_hardline @append_hardline)
