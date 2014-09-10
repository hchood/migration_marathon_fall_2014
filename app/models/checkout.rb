class Checkout < ActiveRecord::Base
  belongs_to :book

  validates :book, presence: true
  validates :reader, presence: true
end
