# app/controllers/api/v1/products_controller.rb
class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end
end
