using FileIO

function getwords(word_file)
    output = []

    try
        for word in eachline(word_file)
            push!(output, word)
        end
    catch e
        println("Error : $e")
    finally
        return output
    end
end

function anagram(all_words)
    output_dict = Dict()

    for word in all_words
        letters = sort(collect(word))
        if letters ∉ keys(output_dict)
            output_dict[letters] = [word]
        else
            push!(output_dict[letters], word)
        end
    end

    output_dict
end

function storeanagrams(ag_dict)
    ag_dict = convertforDB(ag_dict)

    try
        save("test.jld2", ag_dict)
    catch e
        println("Error : $e")
        return false
    finally
        return true
    end
end

function convertforDB(ag_dict)
    output = Dict()
    for (key, val) in ag_dict
        output[join(key)] = val
    end
    output
end

function readanagrams(word, db_name)
    key = sort(collect(word))
    load(db_name, join(key, ""))
end

words = getwords("words.txt")
# test_key = ['e', 'l', 'o', 'v']

ag_dict = anagram(words)
# println(ag_dict[test_key])

ag_dict = convertforDB(ag_dict)
storeanagrams(ag_dict)

print("Result of Anagram DB search for 'love' : ")
println(readanagrams("love", "test.jld2"))