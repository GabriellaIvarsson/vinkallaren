require 'csv'
require 'rake'

namespace :import do
  	task :insertwines => :environment do 

  		# Ladda csv-filen
		file = "db/vinsampel20.csv"

		# Loopa igenom alla rader
		CSV.foreach(file, {:headers => true}) do |row|

			# Dela raden med avseende på ';'
			theRow = row[0].split(';')

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
			
		end

		puts "New posts were successfully processed."
		
	end
end