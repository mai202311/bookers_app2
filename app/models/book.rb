class Book < ApplicationRecord
  belongs_to :user #1:N の「N」側
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
