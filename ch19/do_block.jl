data = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.\n"

open("output.txt", "w") do fout
    write(fout, data)
end


f = fout -> begin
    write(fout, data)
end

open(f, "output2.txt", "w")