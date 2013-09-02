
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
		puts	"\t\t\t<li><h3>Two can's of Coor's Light</h3></li>\n"
		puts	"\t\t</ul>\n"
		puts	"\t</div>\n"
		puts	"\t<div id='phone'><h2>Call 1-877-GET BEER now!</h2>\n"
		puts	"\t\t<h2>Tell me to bring you your thirst quenching favourite!</h2>\n"
		puts	"\t</div>\n"
	end

	def page_maker_bottom
		puts	"\t\t</div> 	<!-- container -->\n"
		puts	"\t</div> 	<!-- container -->\n"
		puts	"</body>\n"
		puts	"</html>\n"
	end	

	def	 get_data
		# retrieve data from the api
		raw_response = open("http://lcboapi.com/products").read
		# Parse JSON­formatted text into a Ruby Hash 
		parsed_response = JSON.parse(raw_response)
		# Return the actual result data from the response, ignoring metadata
		products = parsed_response["result"]
	return products
	end


	def index
		puts "HtmlGenerator: index"
		
		products = get_data	
		page_maker_top

		
			products.each do |product| 
				if product['primary_category'] == "Beer"
					
					product['total_package_units'] >1 ? plural = 's' : plural = ""

				 
				 	puts "<div class = 'sale_section'>"
				 	puts "<ul class = 'description'>"
				 	puts "<li class='beer_name'>"
				 	puts "<h2 class='brand'>#{product['name']}</h2>"
				 	puts "<h3>Price: $#{product['price_in_cents'].to_s.insert(-3,'.')} per #{product['package']}#{plural} </h3>"
				 	puts "</li>"
				 	puts "<li class = 'beer_pic'>"
				 	puts "<img src='#{product['image_url']}' height='100'>"
				 	puts "</li>"
				 	puts "</ul>"
				 	puts "</div>"
				 
				end
			end
		
		page_maker_bottom

		end	

		
	def find_product(product_id)
		products = get_data
		product_requested = {}

		#find the product desisred
		products.each do |product| 
			if product['product_no'].to_i == product_id.to_i
				product_requested = product
			end	
		end	
		return product_requested
	
	end	


	def show(product_id)

		puts "HtmlGenerator: for show product #{product_id}" 
		
		product_requested = find_product(product_id)

		# quit if no prduct was found.
		if product_requested.empty?
			puts "No such product number, please try again or use index to display all beers." 
			return 
		end	
		
		# quit if product is not a beer
		if product_requested['primary_category'] != "Beer"
			puts "Sorry, we only deliver beer" 
			return 
		end
			
		page_maker_top

		product_requested['total_package_units'] >1 ? plural = 's' : plural = ""

		puts "<div class = 'sale_section'>"
	 	puts "<ul class = 'description'>"
	 	puts "<li class='beer_name'>"
	 	puts "<h2 class='brand'>#{product_requested['name']}</h2>"
	 	puts "<h3>Price: $#{product_requested['price_in_cents'].to_s.insert(-3,'.')} per #{product_requested['package']}#{plural} </h3>"
	 	puts "</li>"
	 	puts "<li class = 'beer_pic'>"
	 	puts "<img src='#{product_requested['image_url']}' height='100'>"
	 	puts "</li>"
	 	puts "</ul>"
	 	puts "</div>"	
	
		page_maker_bottom
	end 	

end

