evaluate-commands %sh{
    for filetype in c cpp rust java; do
        printf "%s\n" "add-highlighter shared/$filetype/code/functions    regex (\w*?)\b(for|if|while)?(\h+)?(?=\() 1:function
                       add-highlighter shared/$filetype/code/struct_field regex ((?<!\.\.)(?<=\.)|(?<=->))[a-zA-Z](\w+)?\b(?![>\"\(]) 0:rgb:fb4934,default+b
                       add-highlighter shared/$filetype/code/method       regex ((?<!\.\.)(?<=\.)|(?<=->))[a-zA-Z](\w+)?(\h+)?(?=\() 0:function
                       add-highlighter shared/$filetype/code/return       regex \breturn\b 0:rgb:fb4934,default+b"
    done
    for filetype in c cpp; do
        printf "%s\n" "add-highlighter shared/$filetype/code/types_1 regex \b(v|u|vu)\w+(8|16|32|64)(_t)?\b 0:type
                       add-highlighter shared/$filetype/code/types_2 regex \b(v|u|vu)?(_|__)?(s|u)(8|16|32|64)(_t)?\b 0:type
                       add-highlighter shared/$filetype/code/types_3 regex \b(v|u|vu)(_|__)?(int|short|char|long)(_t)?\b 0:type
                       add-highlighter shared/$filetype/code/types_4 regex \b\w+_t\b 0:type"
    done
    for filetype in cpp rust; do
        printf "%s\n" "add-highlighter shared/$filetype/code/  regex [a-zA-Z](\w+)?(\h+)?(?=::) 0:rgb:be8019,default"
    done
}
