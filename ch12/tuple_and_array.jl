s = "abc"
t = [1, 2, 3]

for pair in zip(s,t)
    println(pair)
end
# ('a', 1)
# ('b', 2)
# ('c', 3)

println(collect(zip(s,t)))
# [('a', 1), ('b', 2), ('c', 3)]

println(collect(zip("Anne", "Elk")))
# [('A', 'E'), ('n', 'l'), ('n', 'k')]

t = [('a', 1), ('b', 2), ('c', 3)]

for (letter, num) in t
    println("$letter => $num")
end

function hasmatch(t1, t2)
    for (letter1, letter2) in zip(t1, t2)
        if letter1 == letter2
            return true
        end
    end
    
    false
end

println(hasmatch("this", "ssss"))

for (index, value) in enumerate("abcdefg")
    println("$index : $value")
end

