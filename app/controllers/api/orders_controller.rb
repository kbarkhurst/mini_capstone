class Api::OrdersController < ApplicationController
  def create
    # @order = Order.new(
    #   user_id: 1, #can only figure out hard-coding the userid number
    #   product_id: params[:product_id],
    #   quantity: params[:quantity],
    # )
    # if @order.save
    #   render "show.json.jb"
    # else
    #   render json: { errors: @order.errors.full_messages }, status: 406
    # end
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
