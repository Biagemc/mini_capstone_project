class Api::ProductsController < ApplicationController
  def index
    # @products = Product.where("name LIKE ?", "%#{params[:search]}%")

    # if params[:discount] == "true"
    #   @products = @products.where("price < 10")
    # end
    # if params[:sort] && params[:sort_order]
    #   @products = @products.order(params[:sort] => params[:sort_order])
    # else
    #   @products = @products.order(:id)
    # end
    @products = Product.all.order(name: :asc)
    render "index.json.jb"
  end

  def show
    @product = Product.find(params[:id])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id],
    )

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    @product.images.update(url: params[:image_url]) || @product.images

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    # render "destroy.json.jb"
    render json: { message: "Product was successfuly destroyed." }
  end
end
