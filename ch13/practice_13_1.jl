function filterline(file_name)
    output = []

    for line in eachline(file_name)
        for word in split(line)
            word = string(filter(isletter, [word...])...)
            word = lowercase(word)
            push!(output, word)
        end
    end

    output
end

println(filterline("lorem.txt"))