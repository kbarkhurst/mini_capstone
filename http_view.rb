require "http"

response = HTTP.get("http://localhost:3000/api/products").parse

#Putting from HTTP gem is a BONUS. I haven't done this yet. put_response = HTTP.put("http://localhost:3000/api/products")

pp response
