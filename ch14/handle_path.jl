cwd = pwd()
txt_path = abspath("output.txt")

println("current path : $(cwd), $(txt_path)")

println(ispath("output.txt"))
println(isdir("output.txt"))
println(readdir(cwd))

println("============================================")

function walk(dirname)
    for file in readdir(dirname)
        child_path = joinpath(dirname, file)
        if isdir(child_path)
            walk(child_path)
        else
            println(child_path)
        end
    end
end

function walkdir_test()
    for (root, dirs, files) in walkdir(".")
        println("Directories in $root")
        for dir in dirs
            println(joinpath(root, dir)) # path to directories
        end
        println("Files in $root")
        for file in files
            println(joinpath(root, file)) # path to files
        end
    end
end

walk(".")
walkdir_test()