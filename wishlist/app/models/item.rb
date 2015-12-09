class Item < ActiveRecord::Base
  validates :notes, length: { maximum: 500 }
  validates :name, presence: true
  validates :max_price, numericality: { message: "must be filled in." }

  belongs_to :list
end
