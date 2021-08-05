class Gossip < ApplicationRecord
  validates :title, presence: true, length: { in: 3..20 }
  validates :content, presence:true, length: { minimum: 5 }
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :join_gossip_tags
  has_many :tags, through: :join_gossip_tags
end
