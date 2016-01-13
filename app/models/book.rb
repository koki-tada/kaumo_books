class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true
end
