function catTwicw(part1, part2)
    concat = part1 * part2
    println(concat)
end

catTwicw("meow", "woof")
println(concat) # ERROR: LoadError: UndefVarError: concat not defined