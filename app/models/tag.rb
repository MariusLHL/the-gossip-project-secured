class Tag < ApplicationRecord
  has_many :join_tag
  has_many :gossip, through: :join_tag
end
