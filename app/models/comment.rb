class Comment < ApplicationRecord
  belongs_to :prototype
  belongs_to :users
end
