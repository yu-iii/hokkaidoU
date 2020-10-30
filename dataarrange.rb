require 'csv'

years = []
rains = []
findb = []
a_years = []  
a_rains = []
 
CSV.foreach("rainfalldata2.csv") do |row|
    years << row[0]
    rains << row[1]
end

print("#{years.min}, #{years.max}\n") # >> 1950 2020

years.collect!{|item| item.to_i}
rains.collect!{|item| item.to_f}

# print("#{years.min.class}, #{years.max.class}\n")

(years.min..years.max).each do |yy|
	years.each_with_index do |year, i|
		if (yy == year) then 
			if (rains[i] >= 50) then
				findb << rains[i]
			end
		end
		# print(findb)
	end
	a_years << yy
	a_rains << findb.size
	findb = []
end

print(findb)

outputfile = open("data_gifu_arranged.txt", mode = "w")

a_years.size.times do |i|
	outputfile.write("#{a_years[i]}\t#{a_rains[i]}\n")
end
