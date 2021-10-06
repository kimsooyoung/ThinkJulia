function histogram(t)
    output = Dict()

    for letter in t
        output[letter] = get!(output, letter, 0) + 1
    end

    output
end

function choosefromhist(t)
    choose_arr = []

    for (key, value) in t
        for i in 1:value
            push!(choose_arr, key)
        end
    end
    
    idx = rand(1:length(choose_arr))
    choose_arr[idx]
end

t = ['a', 'a', 'b']
hist = histogram(t)
println(hist)

for i in 1:10
    println(choosefromhist(hist))
end