class Api::OrdersController < ApplicationController
  def create
    if current_user
      @order = Order.new(
        # user_id: user.id,
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
