class Trash < ApplicationRecord
  # has_many :blogs
  belongs_to :user
  has_many :comments
end
