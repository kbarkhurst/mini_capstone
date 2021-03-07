class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    # if params[:search]
    #   @products = Product.where("title ILIKE ?", "%#{params[:search]}%")
    # end

    render "index.json.jb"
  end


  def show
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      supplier_id: params[:supplier_id],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 406
    end
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id

    @product.save

    render "show.json.jb"
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: { message: "Your product was successfully deleted" }
  end
end
