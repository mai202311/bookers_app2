class Book < ApplicationRecord
  belongs_to :user #1:N の「N」側
end
