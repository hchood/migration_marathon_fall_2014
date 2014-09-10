class Categorization < ActiveRecord::Base
  belongs_to :book
  belongs_to :category

  validates :category, presence: true, uniqueness: { scope: :book }
  validates :book, presence: true
end
