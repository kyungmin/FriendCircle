class Post < ActiveRecord::Base
  attr_accessible :title, :body, :circle_ids
  validates :title, :body, :circles, presence: true

  belongs_to :user

  has_many :links

  has_many :post_shares

  has_many :circles, through: :post_shares, source: :circle
end
