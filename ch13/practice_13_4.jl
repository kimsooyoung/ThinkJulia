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

    for (key, val) in d1
        if key ∉ keys(d2)
            output[key] = nothing
        end
    end

    output
end

my_dict = processfile("emma.txt")
word_dict = getworddict()

sub_dict = subtract(my_dict, word_dict)
println(keys(sub_dict))