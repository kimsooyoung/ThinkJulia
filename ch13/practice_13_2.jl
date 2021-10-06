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

    reverse(sort(word_arr))
end

function totalwords(hist)
    sum(values(hist))
end

function differentwords(hist)
    length(hist)
end

my_dict = processfile("emma.txt")
total_words = totalwords(my_dict)
diff_words = differentwords(my_dict)
println("Total words used in Emma : $(total_words) \nDifferent words used in Emma : $(diff_words)")