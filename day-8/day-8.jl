open("day-8-data.txt") do file
    data = [ln for ln in eachline(file)]
    acc, i = 0, 1
    executed = []

    while true
        #For each line of the input executed, its index is added to executed
        #If that index is already in executed, the input file is done running.
        if i in executed
            println("YOUR END ACC VALUE IS: $acc")
            println("THE REPEAT LINE IS : $i, \"", data[i], "\"")
            break
        else
            push!(executed, i)
        end

        #Following commands from AoC challenge
        if data[i][1:5] == "jmp +"
            i += parse(Int, data[i][6:end])
        elseif data[i][1:5] == "jmp -"
            i -= parse(Int, data[i][6:end])
        elseif data[i][1:3] == "nop"
            i += 1
        elseif data[i][1:5] == "acc +"
            acc += parse(Int, data[i][6:end])
            i += 1
        elseif data[i][1:5] == "acc -"
            acc -= parse(Int, data[i][6:end])
            i += 1
        end
    end
end
