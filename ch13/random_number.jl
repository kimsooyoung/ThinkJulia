function basicrandnum()
    for i in 1:10
        println(rand())
    end
end

function dice()
    for i in 1:10
        println(rand(1:6))
    end
end

basicrandnum()
dice()