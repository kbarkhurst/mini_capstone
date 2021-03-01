require "http"

#Print All
# response = HTTP.get("http://localhost:3000/api/products").parse
# pp response

#Passing ID
puts "Enter product id number"
id = gets.chomp.to_i
param_response = HTTP.get("http://localhost:3000/api/products/#{id}").parse

pp param_response

#Post Request
# puts "What product would you like to create? Enter the name."
# post_response = HTTP.post
#   @product = Product.new(
#     name: params[:name],
#     price: params[:price],
#     image_url: params[:image_url],
#     description: params[:description],
#   )
#   @product.save
#   render "show.json.jb"
# end
