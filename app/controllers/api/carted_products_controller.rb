class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "Carted",
    )

    if @carted_product.save
      render "show.json.jb"
      # index() #render index, just the carted orders for that user
      # render json: { message: "success" }
    else
      render json: { errors: @carted_product.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @carted_products = current_user.carted_products.where(status: "Carted")

    # @carted_products = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "Carted")
    render "index.json.jb"
  end

  def show
    @carted_product = CartedProduct.find_by(id: params[:id])
    render "show.json.jb"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: { status: "carted product successfully removed!" }
  end
end
