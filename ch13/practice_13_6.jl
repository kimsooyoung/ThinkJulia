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

function getworddict()
    output = Dict()

    for line in eachline("words.txt")
        get!(output, line, 0)
    end

    output
end

function subtract(d1, d2)
    output = Dict()

    s1 = Set(keys(d1))
    s2 = Set(keys(d2))

    setdiff(s1, s2)
end

my_dict = processfile("emma.txt")
word_dict = getworddict()

sub_set = subtract(my_dict, word_dict) # my_dict - word_dict
# sub_set = subtract(word_dict, my_dict)
println(sub_set)