class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true, length: { minimum:10, maximum: 10 }
end
