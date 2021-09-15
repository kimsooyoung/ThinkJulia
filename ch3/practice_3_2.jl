function printWhiteSpaces(length_in)
    white_spaces = " " ^ (70 - length_in)
    print(white_spaces)
end

function rightjustify(str_in)
    printWhiteSpaces(length(str_in))
    println(str_in)
end

rightjustify("Hey")
rightjustify("How are you??")
rightjustify("This is long long long long sentance")
