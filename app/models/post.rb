class Post < ApplicationRecord
  validates :title, presence: true, length: { minium: 1, maximum: 200 }
  validates :content, presence: true
  belongs_to :city, :user
end
