require 'csv'
require 'rake'

namespace :import do
  	task :insertwines => :environment do 

  		# Ladda csv-filen
		file = "db/vinsampel20.csv"

		# Loopa igenom alla rader
		CSV.foreach(file, {:headers => true}) do |row|
			theString = ''
			(0..row.size-1).each do |i|
				if theString != ""
					theString = theString + ',' + row[i]

				else
					theString = row[i]
				end
			end

			# Dela raden med avseende på ';'
			theRow = theString.split(';')
	
			# Lägg in vin om det inte redan finns.
			@wine = Wine.find_or_create_by_nummer(
				:nummer          	=>  theRow[0].to_i,
				:artikelID       	=>  theRow[1].to_i,
				:varnummer         	=>  theRow[2].to_i,
				:namn            	=>  theRow[3].to_s,
				:pris	          	=>  theRow[4].to_f,
				:volym	       		=>  theRow[5].to_f,
				:ppl 	        	=>  theRow[6].to_f,
				:varugrupp          =>  theRow[7].to_s,
				:forpackning        =>  theRow[8].to_s,
				:land		      	=>  theRow[9].to_s,
				:producent         	=>  theRow[10].to_s,
				:ar           	 	=>  theRow[11].to_i,
				:alkoholhalt       	=>  theRow[12].to_s,
				:ekologisk	       	=>  theRow[13].to_i,
				:koscher 	        =>  theRow[14].to_i,
				:ravaror          	=>  theRow[15].to_s
			)
			#puts theRow[16]
		end

		puts "New wines were successfully processed."
		
	end



	task :insertfavorites => :environment do 

  		# Ladda csv-filen
		file = "db/favorites.csv"

		# Loopa igenom alla rader
		CSV.foreach(file, {:headers => true}) do |row|
			theString = ''
			(0..row.size-1).each do |i|
				if theString != ""
					theString = theString + ',' + row[i]

				else
					theString = row[i]
				end
			end

			# Dela raden med avseende på ';'
			theRow = theString.split(';')

			# Lägg in vin om det inte redan finns.
			@my_cellar = CellarContent.find_or_create_by_nummer_and_categoryid(
				:uid	          	=>  theRow[0].to_s,
				:nummer 	      	=>  theRow[1].to_i,
				:categoryid      	=>  theRow[2].to_i
				
			)
		end

		puts "Favorites were successfully processed."
		
	end



	task :insertcategories => :environment do 

  		# Ladda csv-filen
		file = "db/categories.csv"

		# Loopa igenom alla rader
		CSV.foreach(file, {:headers => true}) do |row|
			theString = ''
			(0..row.size-1).each do |i|
				if theString != ""
					theString = theString + ',' + row[i]

				else
					theString = row[i]
				end
			end

			# Dela raden med avseende på ';'
			theRow = theString.split(';')

			# Lägg in vin om det inte redan finns.
			@my_categories = Category.find_or_create_by_categoryid_and_categoryname(
				:categoryid	        =>  theRow[0].to_i,
				:categoryname 	    =>  theRow[1].to_s
				
			)
		end

		puts "Categories were successfully processed."
		
	end
end