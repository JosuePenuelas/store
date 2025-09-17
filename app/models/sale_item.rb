# app/models/sale_item.rb

class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  # Añade estas dos líneas
  before_validation :set_unit_price

  def subtotal
    # Para evitar errores si quantity también fuera nil, podemos hacer esto más seguro
    quantity.to_i * unit_price.to_f
  end

  private

  # Y añade este método
  def set_unit_price
    # Si el producto está presente, copia su precio al unit_price de este item
    if product.present?
      self.unit_price = product.price
    end
  end
end
