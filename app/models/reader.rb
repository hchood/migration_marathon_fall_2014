class Reader < ActiveRecord::Base
  has_many :checkouts
  has_many :books, through: :checkouts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true

  def full_name
    first_name + ' ' + last_name
  end
end
