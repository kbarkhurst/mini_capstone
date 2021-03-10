class Api::OrdersController < ApplicationController
  def index
    if current_user
      @orders = Order.all
      render "index.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: 406
    end
  end

  def show
    if current_user
      order_id = params["id"]
      @order = Order.find_by(id: order_id)
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: 406
    end
  end

  def create
    if current_user
      @order = Order.new(
        user_id: current_user[:id],
        product_id: params[:product_id],
        quantity: params[:quantity],
      )
      @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: 406
    end
  end
end
