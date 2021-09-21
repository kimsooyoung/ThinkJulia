function anylowercase1(s)
    for c in s
        if islowercase(c)
            return true
        else
            return false 
        end
    end
end

function anylowercase2(s)
    for c in s
        if islowercase('c')
            return "true"
        else
            return "false"
        end
    end
end

function anylowercase3(s)
    flag = false
    for c in s
        flag = islowercase(c)
    end
    flag
end

function anylowercase4(s)
    flag = false
    for c in s
        flag = flag || islowercase(c)
    end
    flag
end

function anylowercase5(s)
    for c in s
        if !islowercase(c)
            return false
        end 
    end 
    true
end

function myanylowercase(s)
    for c in s
        if islowercase(c)
            return true 
        end
    end
end

println(anylowercase1("IAMUPPERCAsE"))
println(anylowercase2("IAMUPPERCAsE"))
println(anylowercase3("IAMUPPERCAsE"))
println(anylowercase4("IAMUPPERCAsE"))
println(anylowercase5("IAMUPPERCAsE"))
println()
println(myanylowercase("IAMUPPERCAsE"))
