open("day-4-data.txt") do file
    fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]

    person = ""
    passed, people = 0, 0
    for ln in readlines(file)
        if ln != ""
            person = person * ln
        else
            if sum(occursin(field, person) for field in fields) == 7
                passed +=1
            end
            person = ""
            people += 1
        end
    end
    println("$passed passed out of $people total")

end
