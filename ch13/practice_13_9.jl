# https://discourse.julialang.org/t/how-to-make-plot-window-stay-open-when-running-a-jl-script/23484/3
using Plots

function most50words(filename)
    first_dict = Dict()

    for line in eachline(filename)
        processline(line, first_dict)
    end

    temp_list = []
    for (key, val) in first_dict
        push!(temp_list, (val, key))
    end
    sort!(temp_list, rev=true)

    temp_list[1:50]
end

function processline(line, dict)
    if line == ""
        return nothing
    end

    line = replace(line, '-'=>' ')
    line = replace(line, '—'=>' ')
    line = replace(line, '_'=>' ')
    line = replace(line, ';'=>' ')

    for word in split(line)
        word = string(filter(isletter, [word...])...)
        word = lowercase(word)
        dict[word] = get!(dict, word, 0) + 1
    end
end

most_50 = most50words("emma.txt")
print(most_50)

x = []
y = []
for (i, (count, word)) in enumerate(most_50)
    push!(x, log(count))
    push!(y, 0.3 - 1 * log(i))
end

plot1 = plot(x,y)
display(plot1)

# # Add this line for keep plot alives.
readline()