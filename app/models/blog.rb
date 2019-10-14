class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  # belongs_to :trash
end
