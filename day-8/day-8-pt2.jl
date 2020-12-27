open("day-8-data.txt") do file
    data = [ln for ln in eachline(file)]
    acc, i = 0, 1
    executed = Array{Int,1}()
    x = 1

    function jmp_nop_switch(line::String)
        """Switch jmp and nop with each other"""
        if line[1:3] == "jmp"
            line = "nop"*line[4:end]
        elseif line[1:3] == "nop"
            line = "jmp"*line[4:end]
        end
        return line
    end

    while true
        if i in executed  #If we've visited i twice, the switch at x didn't work.
            acc, i = 0, 1 #Reset the program to start from line 1, and
            executed = Array{Int,1}() #empty the executed list.

            #Switch data[x] and switch data[x-1] back to what it was,
            #then walk x up to the next value. I could speed this up by
            #walking it up to the next jmp or nop command, but I'm not going to
            #deal with that now. Bigger fish to fry.
            data[x] = jmp_nop_switch(data[x])
            if x > 1
                data[x-1] = jmp_nop_switch(data[x-1])
            end
            x+=1
        else
            push!(executed, i)
        end

        #if i gets to the end of the input file, the switch has succeeded,
        #and we have the output we need, so we should break here.
        if i == length(data)
            flush(stdout)
            println("The program has run all the way through ar line $x was "*
                    "changed, and the accumulated total is $acc")
            break
        end

        #Follow the commands given on the AoC challenge page
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
