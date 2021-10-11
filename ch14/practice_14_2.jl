function copywithreplace(from_word, to_word, file1, file2)
    fout2 = nothing

    try
        fout2 = open(file2, "w")
    catch e
        println("Error : $e")
    finally
        nothing
    end

    for line in eachline(file1)
        new_line = replace(line, from_word => to_word)
        print(fout2, new_line * "\n")
    end

    try
        close(fout2)
    catch e
        println("Error : $e")
    finally
        return nothing
    end
end

function exceptionhandler(work)
    try
        work()
    catch e
        println("Error : $e")
    finally
        return nothing
    end
end

copywithreplace("Kim", "Lee", "output.txt", "editted.txt")