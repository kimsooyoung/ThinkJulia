function walkdir_test(dir_name)
    playlist = Dict()

    for (root, dirs, files) in walkdir(dir_name)
        println("Files in $root")
        for file in files
            file_path = joinpath(root, file)
            if file in keys(playlist)
                push!(playlist[file], file_path)
            else
                playlist[file] = [file_path]
            end
        end
    end

    playlist
end

playlist = walkdir_test("Music")
println(playlist)