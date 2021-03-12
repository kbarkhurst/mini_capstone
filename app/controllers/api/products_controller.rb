class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  before_action :authenticate_user, except: [:index]

  def index
    @products = Product.all

    # if params[:search]
    #   @products = Product.where("title ILIKE ?", "%#{params[:search]}%")
    # end

    render "index.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 406
    end
  end

  def show
    # product_id = params["id"]
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id

    @product.save

    render "show.json.jb"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Your product was successfully deleted" }
  end
end
