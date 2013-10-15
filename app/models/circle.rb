class Circle < ActiveRecord::Base
  attr_accessible :name, :member_ids
  validates :name, presence: true

  belongs_to(
  :user,
  :class_name => 'User',
  :primary_key => :id,
  :foreign_key => :user_id
  )

  has_many(
  :circle_memberships,
  :class_name => 'CircleMembership',
  :primary_key => :id,
  :foreign_key => :circle_id
  )

  has_many(
  :members,
  :through => :circle_memberships,
  :source => :user
  )
end
