class Gossip < ApplicationRecord
  has_many :join_tag
  has_many :comment
  has_many :tag, through: :join_tag
  has_many :likes, as: :content
  validates :title, 
    length: { in: 3..14}
  belongs_to :user
end
