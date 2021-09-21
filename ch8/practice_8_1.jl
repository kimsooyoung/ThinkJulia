function reverseTraversal(my_str)
    my_str = reverse(my_str)
    index = firstindex(my_str)

    while index <= length(my_str)
        print(my_str[index], " ")
        index = nextind(my_str, index)
    end 
end

reverseTraversal("abcdefg")