require "http"

response = HTTP.get("http://localhost:3000/api/products").parse

#Putting from HTTP gem is a BONUS. I haven't done this yet.

# param_response = HTTP.get("http://localhost:3000/api/products/:id", :params => { "id" => "3" })

# pp response
pp param_response
