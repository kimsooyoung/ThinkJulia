# function parameter

function dotwice(func_in, str_in)
    func_in(str_in)
    func_in(str_in)
end

function printspam(str_in)
    println(str_in)
end

function printTwice(bruce)
    println(bruce)
    println(bruce)
end

function dofour(func_in, str_in)
    dotwice(func_in, str_in)
    dotwice(func_in, str_in)
end

dotwice(printTwice, "spam")
println()
dofour(printspam, "dofour")