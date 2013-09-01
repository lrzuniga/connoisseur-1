
require 'rubygems'
require 'json'
require "open-uri"

class HtmlGenerator 


	def page_maker_top
		puts	"<html>\n"
		puts	"<head>\n"
		puts	"\t<link rel='stylesheet' type='text/css' href='style.css'>\n"
		puts	"\t<title>Archie's Home Beer Delivery</title>\n"
		puts	"</head>"
		puts	"<body>"
		puts	"\t<div id='container_green'>\n"
		puts	"\t<div id='container_content'>\n"	
		puts	"\t<div id='banner'>\n"
		puts	"\t\t<h1 id='logo'>Archie's Home Beer Delivery</h1>\n"
		puts	"\t\t<h3 id='subtitle'>I live next to the LCBO, so you get beer in half the time!</h3>\n"
		puts	"\t</div>\n"
		puts	"\t<div id='prices'>\n"
		puts	"\t\t<ul>\n"
		puts	"\t\t\t<li><h2><strong>Unbeatable Delivery Price =</strong></li> \n"
		puts	"\t\t\t<li><h3>Two large can's of Keith's</h3></li>\n"
		puts	"\t\t</ul>\n"
		puts	"\t</div>\n"
		puts	"\t<div id='phone'><h2>Call 1-877-GET BEER now1</h2>\n"
		puts	"\t\t<h2>Tell me to bring you some of these great products:</h2>\n"
		puts	"\t</div>\n"
	end

	def page_maker_bottom
		puts	"\t\t</div> 	<!-- container -->\n"
		puts	"\t</div> 	<!-- container -->\n"
		puts	"</body>\n"
		puts	"</html>\n"
	end	


	def index
		puts "HtmlGenerator: index"
		raw_response = open("http://lcboapi.com/products").read
		# Parse JSON­formatted text into a Ruby Hash 
		parsed_response = JSON.parse(raw_response)
		# Return the actual result data from the response, ignoring metadata
		products = parsed_response["result"]
		# beer_num = products.length
		 # puts products[0]
			
		page_maker_top

		# puts "<h1>Oour wines are</h1>"
		# puts"\n\n\n<ul>"
		# products.each {|product| puts "<li>#{product["primary_category"]}</li>"}
		# puts"\n\n\n</ul>"
		# brands = []
		# puts "<h1>Our #{beer_num} Beers are:</h1>"
		# tester = products[0]
		# puts tester
		#  puts "logic works" if tester["primary category"] == "Beer"

	
		# beers = products.delete_if {|key, value| key == "primary category" && value != "Beer" }
		# 	puts 	products.length

			products.each do |product| 
				if product['primary_category'] == "Beer"
					# puts "Got a beer"
				

				 # if product["primary category"] == "Beer"
				 	puts "<div class = 'sale_section'>"
				 	puts "<ul class = 'description'>"
				 	puts "<li class='beer_name'>"
				 	puts "<h2 class='brand'>#{product['name']}</h2>"
				 	puts "<h3>Price: $#{product['price_in_cents'].to_s.insert(-3,'.')} for #{product['total_package_units']} cold ones!  </h3>"
				 	 puts "</li>"
				 	puts "<li class = 'beer_pic'>"
				 	puts "<img src='#{product['image_url']}' height='100'>"
				 	 puts "</li>"
				 	# puts "<li>#{product['description']}</li>"
				 	 puts "</ul>"
				 	puts "</div>"

				 # 	"primary category" == "Beer" 
				 # 	puts "<p class='description'>#{product['description']}</p>\n\n"
				 # 	puts "#{product['image_url']}"
				end
			end
		
		page_maker_bottom

		end	

		# beers.each do |beer|
		# 	beers.delete_if {|key, value| key == "name" && brands.include?(value)  }
		# 	brands << beer["name"]
		# end	

		# puts brands.inspect
		# puts brands.length
		# puts beers.length
		# beers.each {|beer| brands << beer["name"] if brands.not_include?(beer["name"]}
		# do |beer|
		# 	beers.delete_if brands.include?(beer["name"])
		# 	brands << beer["name"] 
		# end

		# puts"\n\n\n<ul>"
		# products.each do |product| 
		# 	# self.delete_if brands.include?(product["name"])
		# 	# self.delete_if if product["primary_category"] == "Beer"
		# 	if product["primary_category"] == "Beer"
		# 		brands << product["name"] 
				
		# 		# puts "<li>#{product["name"]}</li>" 

		# 		# unless brands.include?(product["name"])
		# 	end
		# end		

		# puts brands.uniq.sort.inspect

# name	
# price_in_cents
# regular_price_in_cents
# 	description	
# image_url
		# puts"\n\n\n</ul>"

		# puts"\n\n\n<ul>"	

		#this prints the keys
		# products[0].each {|k,v| puts "<li>#{k}</li>"}
		
		# puts"</ul>\n\n"

		
	# end

	def show(product_id)
	# write the same as the index method but passing a product_id in
	
	end 	

end

# archie =  HtmlGenerator.new

# archie.index

# puts "end file"
