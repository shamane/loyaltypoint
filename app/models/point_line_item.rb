class PointLineItem < ActiveRecord::Base
  attr_accessible :user_id, :points, :source, :created_at
  belongs_to :user
  
  scope :points_by_period, lambda { |from, to| where(["DATE(created_at) > :from and DATE(created_at) < :to", from: from, to: to]) }
  scope :negative_points, lambda { |date| where(["DATE(created_at) > ? and points < 0 ", date])}
end
