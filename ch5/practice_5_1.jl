function do_n(f, n)
    if n ≤ 0
        f(n)
        # No return occurs infinite recursive
        return 0
    end

    f(n)
    do_n(f, n - 1)
end

function printSth(sth)
    println(sth)
end

do_n(printSth, 5)