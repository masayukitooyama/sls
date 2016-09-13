class Book < ActiveRecord::Base

  validates :isbn, presence: true
end
