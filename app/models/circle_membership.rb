class CircleMembership < ActiveRecord::Base
  belongs_to(
  :user,
  :class_name => 'User',
  :primary_key => :id,
  :foreign_key => :user_id
  )

  belongs_to(
  :circle,
  :class_name => 'Circle',
  :primary_key => :id,
  :foreign_key => :circle_id
  )
end
