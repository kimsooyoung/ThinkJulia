function getwordsdict()
    output = Dict()
    for word in eachline("words.txt")
        output[word] = 0
    end
    output
end

function printDict(dict)
    for (key, value) in dict
        println("$key => $value")
    end
end

# clone logic from MycroftAI's mimic2
# https://github.com/MycroftAI/mimic2/blob/master/text/cmudict.py
function getcmudict(is_test=false)
    output = Dict()
    count = 0

    for line in eachline("cmudict-0.7b.txt")
        if length(line) > 0 && (line[1] >= 'A' && line[1] <= 'Z' || line[1] == "'")
            line_split = split(line, "  ")
            word = line_split[1]
            pronounce = line_split[2:end]
            output[word] = pronounce
        end

        if is_test == true
            count += 1
            if count ≥ 140
                return output 
            end
        end
    end

    output
end

function puzzlerCheck(word, p_dict)
    word1 = word[2:end]
    word2 = word[1] * word[3:end]

    if word1 ∈ keys(p_dict) && word2 ∈ keys(p_dict)
        if p_dict[word] == p_dict[word1] && p_dict[word] == p_dict[word2]
            return true
        end
    end

    false
end

function puzzlerHandler(word_dict, p_dict)
    output = []

    for word in keys(word_dict)
        if length(word) == 5 && uppercase(word) ∈ keys(p_dict)
            if puzzlerCheck(uppercase(word), p_dict) == true
                @show word
                push!(output, word)
            end
        end
    end

    output
end

word_dict = getwordsdict()
p_dict = getcmudict()

println(puzzlerHandler(word_dict, p_dict))
