class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render "all_products.json.jb"
  end

  def http_view
    @response = HTTP.get("http://localhost:3000/api/product")
    render "http_view.json.jb"
  end
end
