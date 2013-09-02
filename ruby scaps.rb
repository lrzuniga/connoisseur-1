ruby scaps

# puts product_id
		# puts product_requested.sort.inspect
		

puts "item #{product['product_no']} is a #{product['primary_category']}" unless product['primary_category'] == "Beer"

beer_num = products.length
		 puts products[0].inspect

		 puts "<h1>Oour wines are</h1>"
		puts"\n\n\n<ul>"
		products.each {|product| puts "<li>#{product["primary_category"]}</li>"}
		puts"\n\n\n</ul>"
		brands = []
		puts "<h1>Our #{beer_num} Beers are:</h1>"
		tester = products[0]
		puts tester
		 puts "logic works" if tester["primary category"] == "Beer"

	
		beers = products.delete_if {|key, value| key == "primary category" && value != "Beer" }
			puts 	products.length

puts "Got a beer"

if product["primary category"] == "Beer"

puts "<li>#{product['description']}</li>"

	"primary category" == "Beer" 
				 	puts "<p class='description'>#{product['description']}</p>\n\n"
				 	puts "#{product['image_url']}"


				beers.each do |beer|
			beers.delete_if {|key, value| key == "name" && brands.include?(value)  }
			brands << beer["name"]
		end	

		puts brands.inspect
		puts brands.length
		puts beers.length
		beers.each {|beer| brands << beer["name"] if brands.not_include?(beer["name"]}
		do |beer|
			beers.delete_if brands.include?(beer["name"])
			brands << beer["name"] 
		end

		puts"\n\n\n<ul>"
		products.each do |product| 
			# self.delete_if brands.include?(product["name"])
			# self.delete_if if product["primary_category"] == "Beer"
			if product["primary_category"] == "Beer"
				brands << product["name"] 
				
				# puts "<li>#{product["name"]}</li>" 

				# unless brands.include?(product["name"])
			end
		end		

		puts brands.uniq.sort.inspect

name	
price_in_cents
regular_price_in_cents
	description	
image_url
		puts"\n\n\n</ul>"

		puts"\n\n\n<ul>"	

		this prints the keys
		products[0].each {|k,v| puts "<li>#{k}</li>"}
		
		puts"</ul>\n\n"

		
	end 

	 archie =  HtmlGenerator.new

archie.index

puts "end file"


num = gets.chomop

		print "Enter the product number desired:"
		product_id = '300681'
		# .chomp.to_s 
		puts "\n\n"