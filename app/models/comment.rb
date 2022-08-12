class Comment < ApplicationRecord
  belongs_to :prototype
  belongs_to :users

  validates :content, presence: true
end
