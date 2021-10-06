function processfile(filename)
    for line in eachline(filename)
        result = processline(line)
        if result != nothing
            println(result)
        end
    end
end

function processline(line)
    if line == ""
        return nothing
    end

    line = replace(line, '-'=>' ')
    output = []
    for word in split(line)
        word = string(filter(isletter, [word...])...)
        word = lowercase(word)
        push!(output, word)
    end
    output
end



processfile("emma.txt")
