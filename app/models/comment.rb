class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  belongs_to :trash
end
