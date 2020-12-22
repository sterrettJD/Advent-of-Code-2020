open("day-5-data.txt") do file
    data = [ln for ln in eachline(file)]
    maxID = 0
    IDs = []

    for i in 1:length(data)
        row, col = [0,127], [0,7]
        for j in 1:7
            if data[i][j] == 'F'

                row[2] = row[2]-((row[2]-row[1]+1)/2)
            else
                row[1] = row[1] +((row[2]-row[1]+1)/2)
            end
        end

        for j = 8:10
            if data[i][j] == 'L'
                col[2] = col[2]-((col[2]-col[1]+1)/2)
            else
                col[1] = col[1] +((col[2]-col[1]+1)/2)
            end
        end
        append!(IDs, row[1]*8+col[1]) #Add each seat ID to the IDs list
    end

    sort!(IDs, alg=QuickSort)

    println("The largest seat ID is: ", IDs[end])

    for i in 2:length(IDs)
        if IDs[i]-IDs[i-1] != 1
            println("Your seat ID is: ", IDs[i]-1)
        end
    end
end
