class Sale < ApplicationRecord
  has_many :sale_items, dependent: :destroy
  has_many :products, through: :sale_items

  accepts_nested_attributes_for :sale_items,
                                reject_if: :all_blank,
                                allow_destroy: true

  def total
    sale_items.sum(&:subtotal)
  end
end
