class Item < ApplicationRecord
  belongs_to :category
  before_save :set_default_status

  enum status: [:retired, :active, :out_of_stock]

  def set_default_status
    self.status = 1
  end

  def price_in_dollars
    "$#{sprintf('%.2f', price/100)}"
  end
end
