fin =  open("words.txt")
for i in 1:10
    println(readline(fin))
end
close(fin)

println()

count = 1
for line in eachline("words.txt")
    println(line)
    global count += 1
    if count > 11
        break
    end
end
