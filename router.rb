require 'html_generator'

if ARGV.empty?
	puts "Usage: ruby router.rb [action]"
else
	action = ARGV[0]
	generator = HtmlGenerator.new
	if action == "index" 
		generator.index

	elsif action == "show"
		product_id = ARGV[1]
		generator.show(product_id)
	else
		puts "Unknown action #{action}. Use index or show."
	end 

end