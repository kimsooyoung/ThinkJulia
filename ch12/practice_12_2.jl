function mostfrequent(sentance)
    hist = Dict()
    output = []
    for letter in sentance
        hist[letter] = get(hist, letter, 0) + 1
    end

    for (key, value) in hist
        push!(output, (value, key))
    end
    
    sort(output)
end

println(mostfrequent("Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur iste ad laudantium, deserunt voluptate odit facilis. Unde vero quod, non deleniti, nesciunt molestiae, sed at fuga enim quisquam odit minima!"))
