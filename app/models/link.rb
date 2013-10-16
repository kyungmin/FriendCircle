class Link < ActiveRecord::Base
  attr_accessible :url
  validates :url, presence: true

  belongs_to :post
end
