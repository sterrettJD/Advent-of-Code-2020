open("day-4-data.txt") do file
    fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
    person = []
    passed, people = 0, 0

    for ln in readlines(file)
        if ln != "" #There are empty lines between each person,
                    #so I am creating a 'new' person every time there is
                    #an empty line
            append!(person, split(ln)) #filling each person's array with the data
        else
            person = Dict(split(x,":")[1] => split(x,":")[2] for x in person)
            #created a dictionary of the person's info and establish that
            #they have not met any criteria yet
            criteria = 0

            #Next line is making sure they have all criteria
            if sum(haskey(person, field) for field in fields) == 7
                #Now we add 1 for each criterion that is met
                if (parse(Int,person["byr"]) >= 1920) & (parse(Int,person["byr"]) <= 2002)
                    criteria += 1
                end

                if (parse(Int,person["iyr"]) >= 2010) & (parse(Int,person["iyr"]) <= 2020)
                    criteria += 1
                end

                if (parse(Int,person["eyr"]) >= 2020) & (parse(Int,person["eyr"]) <= 2030)
                    criteria += 1
                end

                if endswith(person["hgt"], "cm")
                    if (parse(Int,person["hgt"][1:end-2]) >= 150) & (parse(Int,person["hgt"][1:end-2]) <= 193)
                        criteria += 1
                    end
                elseif endswith(person["hgt"], "in")
                    if (parse(Int,person["hgt"][1:end-2]) >= 59) & (parse(Int,person["hgt"][1:end-2]) <= 76)
                        criteria += 1
                    end
                end

                if !isnothing(match(r"^#[a-f0-9]{6}$", person["hcl"]))
                    criteria +=1
                end

                if sum(person["ecl"]==x for x in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]) == 1
                    criteria += 1
                end

                if !isnothing(match(r"^\d{9}$", person["pid"]))
                    criteria += 1
                end
            end

            #All 7 criteria must be met to pass
            if criteria == 7
                passed += 1
            end

            person = [] #Initialize a new person
            people += 1 #Say that 1 person has been tested
        end
    end

    flush(stdout)
    println("$passed passed the criteria out of $people total")
end
