class SalesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_sale, only: %i[ show edit update destroy ]
  def new
    @sale = Sale.new
    @sale.sale_items.build
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to sales_path, notice: "Venta creada exitosamente."
    else
      render :new
    end
  end

  def index
    @sales = Sale.all
    render json: @sales
  end

  def show
  end

  def edit
  end

  def update
    if @sale.update(sale_params)
      redirect_to @sale, notice: "Venta actualizada exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @sale.destroy
    redirect_to sales_path, notice: "Venta eliminada exitosamente."
  end

private
  def set_sale
      @sale = Sale.includes(sale_items: :product).find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(
      :client_name,
      sale_items_attributes: [ :id, :product_id, :quantity, :unit_price, :_destroy ]
    )
  end
end
