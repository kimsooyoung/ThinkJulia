function processfile(filename)
    my_dict = Dict()
    for line in eachline(filename)
        processline(line, my_dict)
    end
    my_dict
end

function processline(line, dict)
    if line == ""
        return nothing
    end

    line = replace(line, '-'=>' ')
    for word in split(line)
        word = string(filter(isletter, [word...])...)
        word = lowercase(word)
        dict[word] = get!(dict, word, 0) + 1
    end
end

function sortdict(dict)
    word_arr = []

    for (key, val) in dict
        push!(word_arr, (val, key))
    end

    sort(word_arr, rev=true)
end

function printmostcommon(hist, num=10)

    sorted_arr = sortdict(hist)

    for (val, key) in sorted_arr[1:20]
        println("$key\t: $val ")
    end
end

my_dict = processfile("emma.txt")
printmostcommon(my_dict)

