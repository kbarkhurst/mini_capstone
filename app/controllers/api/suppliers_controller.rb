class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all

    render "index.json.jb"
  end

  def show
    supplier_id = params["id"]
    @supplier = Supplier.find_by(id: supplier_id)
    render "show.json.jb"
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    if @supplier.save
      render "show.json.jb"
    else
      render json: { errors: @supplier.errors.full_messages }, status: 406
    end
  end

  def update
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: supplier_id)

    @supplier.name = params[:name] || @supplier.name
    @supplier.email = params[:email] || @supplier.email
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number

    @supplier.save

    render "show.json.jb"
  end

  def destroy
    supplier_id = params[:id]
    supplier = Supplier.find_by(id: supplier_id)
    supplier.destroy
    render json: { message: "Your supplier was successfully deleted" }
  end
end
