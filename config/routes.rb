Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # get "/all_products_path" => "products#all_products_action"
    get "/products" => "products#index"

    get "/first_product_path" => "products#first_product_action"

    get "/one_product_path" => "products#one_product_action"

    # get "/one_product_path/:id" => "products#one_product_action"

    get "/products/:id" => "products#show"
  end
end
