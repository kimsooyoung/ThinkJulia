function markov_mapping(filename, word_length)
    my_dict = Dict()
    p = []
    for line in eachline(filename)
        p = processmarkovline(line, my_dict, word_length, p)
    end
    my_dict
end

function processmarkovline(line, dict, word_length, prior_in=[])
    if line == ""
        return nothing
    end

    line = replace(line, '-'=>' ')
    line = replace(line, '—'=>' ')
    line = replace(line, '_'=>' ')
    line = replace(line, ';'=>' ')

    splited_line = split(line)
    if length(splited_line) < word_length
        return nothing
    end
    if prior_in == [] || prior_in == nothing
        prior = splited_line[1:word_length]
        splited_line = splited_line[word_length+1:end]
    else
        prior = prior_in
    end

    next = []

    for word in splited_line
        next = push!(prior[2:end], word)
        # @show prior
        if prior ∈ keys(dict)
            push!(dict[prior], next)
        elseif 
            dict[prior] = Set([next])
        end
        prior = next
    end

    prior
end

function markov_analysis(hist, len)
    rand_prior = rand(collect(keys(hist)))
    # @show rand_prior
    output = rand_prior
    
    for i in 1:len
        next = rand(hist[rand_prior])
        push!(output, next[end])
        rand_prior = next 
    end

    join(output, " ")
end

my_dict = markov_mapping("emma.txt", 3)

for (key, value) ∈ my_dict
    println("$(key) $(value)")
end

# my_dict = markov_mapping("short_emma.txt", 3)
# result = markov_analysis(my_dict, 30)
# println(result)

# count = 0

# for (key, val) in my_dict
#     global count

#     println("$(key) / $(val)")
#     count += 1
#     if count ≥ 10
#         break
#     end
# end
